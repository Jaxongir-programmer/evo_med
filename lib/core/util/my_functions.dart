import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/main.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'dart:ui' as ui;

class MyFunctions {
  static setMapStyle(YandexMapController controller) {
    Map<String, dynamic> style2 = {
      "types": ["point", "polyline", "polygon"],
      "tags": {
        "any": [
          "poi",
          "country",
          "locality",
          "district",
          "traffic_light",
          'crosswalk',
          "transit_schema",
          "transit_line",
          "geographic_line"
        ]
      },
      "stylers": {"visibility": "off"}
    };
    controller.setMapStyle([jsonEncode(style2)].toString());
  }

  static FutureOr<bool?> getLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    final geolocator = GeolocatorPlatform.instance;
    bool serviceEnabled;
    serviceEnabled = await geolocator.isLocationServiceEnabled();
    if (!serviceEnabled || permission == LocationPermission.denied) {
      permission = await geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return null;
      } else {
        return permission == LocationPermission.always || permission == LocationPermission.whileInUse;
      }
    } else {
      return permission == LocationPermission.always || permission == LocationPermission.whileInUse;
    }
  }

  static Future<Map<String, dynamic>> getDeviceInfo() async {
    Map<String, String> deviceInfo = {
      "device": '',
      "deviceId": '',
      "deviceOS": '',
    };
    if (Platform.isIOS) {
      IosDeviceInfo info = await DeviceInfoPlugin().iosInfo;
      deviceInfo['device'] = '${info.model} ${info.utsname.nodename}';
      deviceInfo['deviceId'] = info.identifierForVendor ?? '';
      deviceInfo['deviceOS'] = 'ios';
    } else {
      AndroidDeviceInfo info = await DeviceInfoPlugin().androidInfo;
      deviceInfo['device'] = '${info.manufacturer} ${info.brand}';
      deviceInfo['deviceId'] = info.id;
      deviceInfo['deviceOS'] = 'android';
    }
    return deviceInfo;
  }

  static TextSpan boldText(String similarText, String searchingLetters, TextTheme textTheme) {
    List<TextSpan> spans = [];
    int index = 0;
    var similarRuns = similarText.runes;
    while (index < similarText.length) {
      if (similarText.toLowerCase().startsWith(searchingLetters.toLowerCase(), index)) {
        spans.add(TextSpan(
          text: String.fromCharCodes(similarRuns.toList().sublist(index, index + searchingLetters.length)),
          style: textTheme.headlineLarge!,
        ));
        index += searchingLetters.length;
      } else {
        spans.add(
          TextSpan(
            text: similarText[index],
            style: textTheme.headlineSmall,
          ),
        );
        index++;
      }
    }
    return TextSpan(children: spans);
  }

  static Future<Uint8List> createImageFromWidget(
    Widget widget, {
    Size? logicalSize,
    Size? imageSize,
  }) async {
    final repaintBoundary = RenderRepaintBoundary();
    logicalSize ??= ui.window.physicalSize / ui.window.devicePixelRatio;
    imageSize ??= ui.window.physicalSize;
    assert(logicalSize.aspectRatio == imageSize.aspectRatio, 'logicalSize and imageSize must not be the same');
    final renderView = RenderView(
      // window: ui.window,
      child: RenderPositionedBox(alignment: Alignment.center, child: repaintBoundary),
      configuration: ViewConfiguration(
        devicePixelRatio: imageSize.width / logicalSize.width,
        logicalConstraints: BoxConstraints(maxHeight: logicalSize.height, maxWidth: logicalSize.width),
      ),
      view: ui.window,
    );
    final pipelineOwner = PipelineOwner();
    final buildOwner = BuildOwner(focusManager: FocusManager());
    pipelineOwner.rootNode = renderView;
    renderView.prepareInitialFrame();
    final rootElement = RenderObjectToWidgetAdapter<RenderBox>(
        container: repaintBoundary,
        child: Directionality(
          textDirection: ui.TextDirection.ltr,
          child: widget,
        )).attachToRenderTree(buildOwner);
    buildOwner.buildScope(rootElement);
    buildOwner
      ..buildScope(rootElement)
      ..finalizeTree();
    pipelineOwner
      ..flushLayout()
      ..flushCompositingBits()
      ..flushPaint();

    final image = await repaintBoundary.toImage(pixelRatio: imageSize.width / logicalSize.width);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  static Future<Uint8List> singlePin({
    required int width,
    required int height,
    Offset? offset,
    required String image,
  }) async {
    final pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..color = AppColors.defaultDark;
    canvas.drawImage(
      await getImageInfo(image).then((value) => value.image),
      offset ?? const Offset(0, 0),
      paint,
    );
    final img = await pictureRecorder.endRecording().toImage(width, height);
    final data = await img.toByteData(format: ui.ImageByteFormat.png);
    return data?.buffer.asUint8List() ?? Uint8List(0);
  }

  static Future<Uint8List> clusterPin({
    required int width,
    required int height,
    int placeCount = 0,
    Offset? offset,
    bool shouldAddText = false,
  }) async {
    final pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..color = AppColors.defaultDark;
    canvas.drawCircle(Offset(width / 2, height / 2), 80, paint);
    if (shouldAddText) {
      TextPainter painter = TextPainter(textDirection: ui.TextDirection.ltr, textAlign: TextAlign.center);
      painter.text = TextSpan(
        text: placeCount.toString(),
        style: const TextStyle(
          color: AppColors.white,
          fontSize: 56,
          fontWeight: FontWeight.bold,
          fontFamily: "NT Somic",
        ),
      );
      painter.layout();
      painter.paint(canvas, Offset((width * (placeCount > 9 ? 0.43 : 0.46)) - painter.width * 0.34, (height * 0.24)));
    }

    final img = await pictureRecorder.endRecording().toImage(width, height);
    final data = await img.toByteData(format: ui.ImageByteFormat.png);
    return data?.buffer.asUint8List() ?? Uint8List(0);
  }

  static Future<ImageInfo> getImageInfo(String image) async {
    AssetImage assetImage = AssetImage(image);
    final context = navigatorKey.currentContext;
    ImageStream stream = assetImage.resolve(createLocalImageConfiguration(context!));
    Completer<ImageInfo> completer = Completer();
    stream.addListener(ImageStreamListener((ImageInfo imageInfo, _) {
      return completer.complete(imageInfo);
    }));
    return completer.future;
  }

  static Future<Uint8List> convert(String image) async {
    ByteData byteData = await rootBundle.load(image);
    Uint8List imageData = byteData.buffer.asUint8List();
    return imageData;
  }
}
