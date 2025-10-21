import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_constants.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/config/app_images.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/core/util/my_functions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_text_field.dart';
import 'package:evo_med/generated/locale_keys.g.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';


class PointFromMapScreen extends StatefulWidget {
  const PointFromMapScreen({super.key});

  @override
  State<PointFromMapScreen> createState() => _PointFromMapScreenState();
}

class _PointFromMapScreenState extends State<PointFromMapScreen> {
  List<MapObject> mapObject = [];
  YandexMapController? controller;

  @override
  void initState() {
    super.initState();
    MyFunctions.getLocationPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppIcons.chevronLeft.toSVGWidget(onTap: () {
          context.pop();
        }),
        title: Text(
          LocaleKeys.btn_pointFromMap.tr(),
          style: context.textTheme.displaySmall,
        ),
        toolbarHeight: 64,
        surfaceTintColor: AppColors.white,
      ),
      body: Stack(
        children: [
          YandexMap(
            mapType: MapType.vector,
            rotateGesturesEnabled: true,
            zoomGesturesEnabled: true,
            scrollGesturesEnabled: true,
            mapObjects: mapObject,
            cameraBounds: cameraBound,
            onMapCreated: (YandexMapController yandexMapController) {
              MyFunctions.setMapStyle(yandexMapController);
              controller = yandexMapController;
            },
            onMapTap: (argument) {
              if (controller != null) {
                controller!.moveCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: Point(
                        latitude: argument.latitude,
                        longitude: argument.longitude,
                      ),
                      zoom: 16,
                    ),
                  ),
                  animation: const MapAnimation(
                    type: MapAnimationType.linear,
                    duration: 0.5,
                  ),
                );
                initMap(argument);
              }
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: IgnorePointer(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  gradient: LinearGradient(
                    colors: [AppColors.white, Colors.white.withValues(alpha: .0)],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                height: 90,
              ),
            ),
          ),
          Positioned(
            bottom: 12 + context.padding.bottom,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              spacing: 32,
              children: [
                CustomButton(
                  onTap: () {
                    findMe();
                  },
                  height: 40,
                  width: 40,
                  color: AppColors.successGreen,
                  child: AppIcons.navigation.toSVGWidget(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  spacing: 12,
                  children: [
                    CustomButton.light(
                      isExpanded: true,
                      onTap: () {
                        context.pop();
                      },
                      height: 40,
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 4,
                        children: [
                          Icon(
                            Icons.close_sharp,
                            color: AppColors.primaryColor,
                          ),
                          Text(
                            LocaleKeys.btn_close.tr(),
                            style: context.textTheme.headlineMedium!.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomButton(
                      isExpanded: true,
                      onTap: () {
                        context.pop();
                      },
                      height: 40,
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 4,
                        children: [
                          AppIcons.checked.toSVGWidget(size: 32, fit: BoxFit.cover),
                          Text(
                            LocaleKeys.btn_confirm.tr(),
                            style: context.textTheme.headlineMedium!.copyWith(color: AppColors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 24,
            left: 16,
            right: 16,
            child: CustomTextField(
              controller: TextEditingController(),
              fillColor: AppColors.white,
              onChanged: (value) {},
              hintText: LocaleKeys.hints_search.tr(),
              suffix: AppIcons.search.toSVGWidget(),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> initMap(Point argument) async {
    Uint8List image = await MyFunctions.singlePin(
      width: 105,
      height: 105,
      image: AppImages.currentPoint,
    );
    mapObject = [
      PlacemarkMapObject(
        mapId: MapObjectId("me"),
        point: Point(
          latitude: argument.latitude,
          longitude: argument.longitude,
        ),
        opacity: 1,
        icon: PlacemarkIcon.single(
          PlacemarkIconStyle(
            image: BitmapDescriptor.fromBytes(image),
            anchor: const Offset(0.5, 1),
            scale: 1,
          ),
        ),
      ),
    ];
    setState(() {});
  }

  Future<void> findMe() async {
    final currentPosition = await Geolocator.getCurrentPosition();
    if (controller != null) {
      controller!.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: Point(latitude: currentPosition.latitude, longitude: currentPosition.longitude),
            zoom: 16,
          ),
        ),
        animation: const MapAnimation(
          type: MapAnimationType.linear,
          duration: 0.5,
        ),
      );
    }
  }
}
