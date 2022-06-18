import 'dart:ui';

import 'package:custom_info_window/custom_info_window.dart';
import '../../../../businesslogic/map_cubit/map_cubit.dart';
import '../../../../main.dart';
import '../../../../presentaion/screens/maps/widget/adress_widget.dart';
import '../../../../presentaion/widget/customline.dart';
import '../../../../presentaion/widget/customtext.dart';
import '../../../../shared/colors.dart';
import '../../../../shared/functions.dart';
import '../../../../shared/resurces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

class ChangeAdressMap extends StatefulWidget {
  const ChangeAdressMap({Key? key}) : super(key: key);
  static const String id = 'ChangeAdressMap';

  @override
  State<ChangeAdressMap> createState() => _ChangeAdressMapState();
}

class _ChangeAdressMapState extends State<ChangeAdressMap> {
  var serachController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: BlocProvider(
        create: (context) => MapCubit(),
        child: BlocConsumer<MapCubit, MapState>(
          listener: (context, state) {},
          builder: (context, state) {
            MapCubit mapCubit = MapCubit.get(context);
            return Stack(
              children: [
                //map widget
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: GoogleMap(
                    onCameraMove: (position) {
                      mapCubit.customInfoWindowController.onCameraMove!();
                    },
                    buildingsEnabled: true,
                    zoomControlsEnabled: false,
                    initialCameraPosition:
                        const CameraPosition(target: LatLng(12, 12)),
                    onTap: (pos) {
                      mapCubit.addMarker(pos);
                      mapCubit.customInfoWindowController.hideInfoWindow!();
                    },
                    markers: Set.from(mapCubit.markers),
                    mapType: MapType.normal,
                    onMapCreated: mapCubit.onmapcreated,
                  ),
                ),
                _mapheader(context),
                _locationIcon(ontap: () {
                  mapCubit.movecameratocurrentlocation(mapCubit.mapcontroller);
                }),
                _mapbox(context),
                _mapfooter(),
                CustomInfoWindow(
                  controller: mapCubit.customInfoWindowController,
                  height: 100,
                  width: 150,
                  offset: 100,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  onSearchTextChanged(String text) async {}

  _mapheader(context) {
    return Positioned(
      top: 5.h,
      left: 5.w,
      right: 5.w,
      child: Container(
        width: MediaQuery.of(context).size.width * .8,
        height: MediaQuery.of(context).size.height * .07,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.h),
            color: MyColors.textFormColor),
        child: Row(
          children: [
            SizedBox(
              width: 5.w,
            ),
            InkWell(
                onTap: () {
                  navigateback(context: context);
                },
                child: const Icon(Icons.arrow_back_ios)),
            const Spacer(
              flex: 1,
            ),
            CustomText(
              data: App.tr.changeadress,
              size: 18.sp,
              weight: FontWeight.w900,
            ),
            SizedBox(
              width: 23.w,
            ),
          ],
        ),
      ),
    );
  }

  _mapfooter() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const CustomLine(),
            SizedBox(
              height: .9.h,
            )
          ],
        ));
  }

  _mapbox(context) {
    return Positioned(
      bottom: 4.h,
      left: 7.w,
      right: 7.w,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(3.h),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Container(
              // height: MediaQuery.of(context).size.height * .25,
              width: MediaQuery.of(context).size.width * .8,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(3.h)),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 5.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _searchBar(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 2.h,
                            child: SvgPicture.asset(
                              Resurces.recentplace,
                              cacheColorFilter: true,
                              height: 120.sp,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        CustomText(
                            size: 11.sp,
                            weight: FontWeight.w700,
                            data: App.tr.recentplace),
                        const Spacer(
                          flex: 1,
                        ),
                        InkResponse(
                            onTap: () {
                              MapCubit.get(context).recent =
                                  !MapCubit.get(context).recent;
                              setState(() {});
                            },
                            child: MapCubit.get(context).recent
                                ? Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    size: 10.w,
                                  )
                                : Icon(
                                    Icons.arrow_forward_ios,
                                    size: 7.w,
                                  ))
                      ],
                    ),
                    if (MapCubit.get(context).recent)
                      SizedBox(
                          height: 6.h,
                          width: 70.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Adress(adress: 'No 03, 4th Lane, Newyork'),
                              Adress(adress: 'No 03, 4th Lane, '),
                            ],
                          ))
                    else
                      SizedBox(
                        height: 1.h,
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 2.h,
                            child: SvgPicture.asset(
                              Resurces.savedplace,
                              cacheColorFilter: true,
                              height: 120.sp,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        CustomText(
                            size: 11.sp,
                            weight: FontWeight.w700,
                            data: App.tr.savedplace),
                        const Spacer(
                          flex: 1,
                        ),
                        InkResponse(
                            onTap: () {
                              MapCubit.get(context).saved =
                                  !MapCubit.get(context).saved;
                              setState(() {});
                            },
                            child: MapCubit.get(context).saved
                                ? Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    size: 10.w,
                                  )
                                : Icon(
                                    Icons.arrow_forward_ios,
                                    size: 7.w,
                                  ))
                      ],
                    ),
                    if (MapCubit.get(context).saved)
                      SizedBox(
                          height: 6.h,
                          width: 70.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Adress(adress: 'No 03, 4th Lane, Newyork'),
                              Adress(adress: 'No 03, 4th Lane, '),
                            ],
                          ))
                    else
                      SizedBox(
                        height: 1.h,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _locationIcon({required VoidCallback ontap}) {
    return Positioned(
      bottom: 30.h,
      right: 5.w,
      child: InkWell(
        onTap: ontap,
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 3.h,
          child: SvgPicture.asset(
            Resurces.currentlocation,
            cacheColorFilter: true,
            height: 120.sp,
          ),
        ),
      ),
    );
  }

  _searchBar() {
    return SizedBox(
      height: 7.h,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
        child: TextField(
          style: const TextStyle(color: MyColors.primarColor),
          textAlign: TextAlign.start,
          cursorColor: Colors.black,
          controller: serachController,
          onChanged: onSearchTextChanged,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.all(4),
            hintText: App.tr.search,
            hintStyle: const TextStyle(color: MyColors.placeHolderColor),
            hintTextDirection: TextDirection.ltr,
            filled: true,
            fillColor: Colors.grey.shade400,
            prefixIcon: Icon(
              Icons.search,
              size: 16.sp,
              color: MyColors.secondryColor,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(5.h),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(5.h),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(5.h),
            ),
          ),
        ),
      ),
    );
  }
}
