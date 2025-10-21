import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_constants.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/core/util/my_functions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/estate_announcement/presentation/filters/filter_bottom_sheet.dart';
import 'package:evo_med/features/estate_announcement/presentation/filters/sort_bottom_sheet.dart';
import 'package:evo_med/features/estate_announcement/presentation/widgets/save_search_modal.dart';
import 'package:evo_med/generated/locale_keys.g.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class SearchFromMapScreen extends StatefulWidget {
  const SearchFromMapScreen({super.key});

  @override
  State<SearchFromMapScreen> createState() => _SearchFromMapScreenState();
}

class _SearchFromMapScreenState extends State<SearchFromMapScreen> {
  List<MapObject> clusterMapObjects = [];
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
          LocaleKeys.title_estateAnnouncement.tr(),
          style: context.textTheme.displaySmall,
        ),
        toolbarHeight: 64,
        surfaceTintColor: AppColors.white,
        actions: [
          CustomButton(
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                isScrollControlled: true,
                useSafeArea: true,
                builder: (context) {
                  return SaveSearchModal();
                },
              );
            },
            width: 48,
            color: Colors.transparent,
            child: AppIcons.saveBut.toSVGWidget(),
          )
        ],
      ),
      body: Column(
        children: [
          CustomButton(
            margin: EdgeInsets.symmetric(horizontal: 16),
            color: AppColors.borderColor,
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                isScrollControlled: true,
                useSafeArea: true,
                builder: (context) {
                  return FilterBottomSheet();
                },
              );
            },
            child: Row(
              children: [
                Badge(
                  smallSize: 10,
                  backgroundColor: AppColors.badgeColor,
                  child: AppIcons.filter.toSVGWidget(size: 22),
                ),
                const SizedBox(width: 12),
                Text(
                  LocaleKeys.label_filters.tr(args: ["Ko’chmas mulk turi, hududi va narxi"]),
                  style: context.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          Gap(8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 8),
            child: Row(
              children: [
                Text(
                  LocaleKeys.label_adsCount.tr(args: ["531"]),
                  style: context.textTheme.bodyMedium!.copyWith(color: AppColors.labelColor),
                ),
                const Spacer(),
                Text(
                  "sh.b",
                  style: context.textTheme.headlineSmall,
                ),
                Gap(4),
                Transform.scale(
                  scale: .8,
                  child: CupertinoSwitch(
                    value: false,
                    onChanged: (v) {},
                    activeTrackColor: AppColors.primaryColor,
                    inactiveTrackColor: AppColors.borderColor,
                  ),
                ),
                Gap(16),
                CustomButton(
                  height: 40,
                  width: 40,
                  color: AppColors.containerBloc,
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      isScrollControlled: true,
                      useSafeArea: true,
                      builder: (context) {
                        return SortingResultModal();
                      },
                    );
                  },
                  child: AppIcons.arrowDownArrowUp.toSVGWidget(),
                ),
                Gap(16),
                CustomButton(
                  height: 40,
                  width: 40,
                  color: AppColors.containerBloc,
                  onTap: () {},
                  child: AppIcons.sort.toSVGWidget(),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                YandexMap(
                  mapType: MapType.vector,
                  rotateGesturesEnabled: true,
                  zoomGesturesEnabled: true,
                  scrollGesturesEnabled: true,
                  mapObjects: clusterMapObjects,
                  cameraBounds: cameraBound,
                  onMapCreated: (YandexMapController yandexMapController) {
                    MyFunctions.setMapStyle(yandexMapController);
                    initMap(yandexMapController);
                    controller = yandexMapController;
                  },
                  onMapTap: (argument) {
                    // pickupBloc.add(ClearSelectedShop());
                  },
                  onCameraPositionChanged:
                      (CameraPosition cameraPosition, CameraUpdateReason updateReason, bool change) {
                    // if (change && updateReason == CameraUpdateReason.gestures) {
                    //   context.read<PickupBloc>().add(
                    //     OnMapCameraChange(
                    //       cameraPosition: cameraPosition,
                    //     ),
                    //   );
                    // }
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
                  bottom: 4 + context.padding.bottom,
                  left: 16,
                  right: 16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
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
                            Icon(Icons.close_sharp, color: AppColors.white),
                            Text(
                              LocaleKeys.btn_close.tr(),
                              style: context.textTheme.headlineMedium!.copyWith(color: AppColors.white),
                            ),
                          ],
                        ),
                      ),
                      CustomButton(
                        onTap: () {
                          findMe();
                        },
                        height: 40,
                        width: 40,
                        color: AppColors.successGreen,
                        child: AppIcons.navigation.toSVGWidget(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> initMap(YandexMapController controller) async {
    // final List<PlacemarkMapObject> mapObjects = [];
    // final List<LocationEntity> pickupPoint = [
    //   LocationEntity(id: "1", name: "650 mln", lat: 41.306619, long: 69.275595),
    //   LocationEntity(id: "2", name: "400 mln", lat: 41.308022, long: 69.280087),
    //   LocationEntity(id: "3", name: "140 mln", lat: 41.305122, long: 69.277949),
    //   LocationEntity(id: "4", name: "900 mln", lat: 41.305813, long: 69.284444),
    // ];
    //
    // final currentPosition = await Geolocator.getCurrentPosition();
    // pickupPoint.add(LocationEntity(
    //     id: "5", name: "Mening joyim", lat: currentPosition.latitude, long: currentPosition.longitude, isMe: true));
    //
    // for (var element in pickupPoint) {
    //   Uint8List image;
    //   if (element.isMe) {
    //     image = await MyFunctions.singlePin(
    //       width: 105,
    //       height: 105,
    //       image: AppImages.currentPoint,
    //     );
    //   } else {
    //     image = await MyFunctions.createImageFromWidget(
    //       Stack(
    //         alignment: Alignment.center,
    //         children: [
    //           Container(
    //             margin: EdgeInsets.only(bottom: 18),
    //             decoration: BoxDecoration(
    //               color: AppColors.defaultDark,
    //               borderRadius: BorderRadius.circular(18),
    //             ),
    //             padding: EdgeInsets.only(
    //               top: 6,
    //               left: 18,
    //               right: 18,
    //               bottom: 18,
    //             ),
    //             child: Text(
    //               element.name,
    //               style: context.textTheme.displayMedium!.copyWith(
    //                 color: AppColors.white,
    //                 fontSize: 56,
    //                 decoration: TextDecoration.underline,
    //                 decorationColor: AppColors.white,
    //               ),
    //               textAlign: TextAlign.center,
    //               maxLines: 1,
    //               overflow: TextOverflow.ellipsis,
    //             ),
    //           ),
    //           Positioned(
    //             bottom: 0,
    //             child: AppIcons.triangle.toSVGWidget(size: 32),
    //           )
    //         ],
    //       ),
    //       imageSize: const Size(600, 200),
    //       logicalSize: const Size(600, 200),
    //     );
    //   }
    //
    //   final pin = PlacemarkIconStyle(
    //     image: BitmapDescriptor.fromBytes(image),
    //     anchor: const Offset(0.5, 1),
    //     scale: 1,
    //   );
    //
    //   mapObjects.add(
    //     PlacemarkMapObject(
    //       mapId: MapObjectId(element.id),
    //       point: element.point,
    //       opacity: 1,
    //       icon: PlacemarkIcon.single(pin),
    //       consumeTapEvents: true,
    //       onTap: (mapObject, point) {
    //         showModalBottomSheet(
    //           context: context,
    //           backgroundColor: AppColors.white,
    //           shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.only(
    //               topLeft: Radius.circular(16),
    //               topRight: Radius.circular(16),
    //             ),
    //           ),
    //           isScrollControlled: true,
    //           useSafeArea: true,
    //           builder: (context) {
    //             return Padding(
    //               padding: EdgeInsets.only(
    //                   bottom: context.padding.bottom + context.viewInsets.bottom + 16, left: 16, right: 16),
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.start,
    //                 mainAxisSize: MainAxisSize.min,
    //                 children: [
    //                   DragWidget(),
    //                   TitleModalWidget(
    //                     title: "",
    //                     onCloseTap: () {
    //                       context.pop();
    //                     },
    //                   ),
    //                   AnnouncementItemWidget(
    //                     imageList: imageList,
    //                     price: 120000000,
    //                     address: "Tashkent, Yunusabad, 2nd block",
    //                     roomNumbers: 4,
    //                     area: 150,
    //                     floor: 3,
    //                     totalFloor: 6,
    //                     saved: true,
    //                     difference: 5,
    //                     view: 1192,
    //                     onTap: () {},
    //                   ),
    //                 ],
    //               ),
    //             );
    //           },
    //         );
    //       },
    //     ),
    //   );
    // }
    //
    // final mapCluster = ClusterizedPlacemarkCollection(
    //   mapId: const MapObjectId('cluster'),
    //   radius: 20,
    //   minZoom: 18,
    //   onClusterAdded: (self, cluster) async {
    //     final appearance = await MyFunctions.clusterPin(
    //       width: 160,
    //       height: 160,
    //       placeCount: cluster.placemarks.length,
    //       shouldAddText: true,
    //     );
    //     return cluster.copyWith(
    //       appearance: cluster.appearance.copyWith(
    //         opacity: 1,
    //         icon: PlacemarkIcon.single(
    //           PlacemarkIconStyle(
    //             image: BitmapDescriptor.fromBytes(appearance),
    //             scale: 1,
    //           ),
    //         ),
    //       ),
    //     );
    //   },
    //   onClusterTap: (self, cluster) {
    //     controller.moveCamera(
    //       CameraUpdate.newCameraPosition(
    //         CameraPosition(
    //           target: cluster.appearance.point,
    //         ),
    //       ),
    //       animation: const MapAnimation(
    //         type: MapAnimationType.linear,
    //         duration: 0.5,
    //       ),
    //     );
    //   },
    //   placemarks: mapObjects,
    //   consumeTapEvents: true,
    // );
    // clusterMapObjects.add(mapCluster);
    // setState(() {});
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
