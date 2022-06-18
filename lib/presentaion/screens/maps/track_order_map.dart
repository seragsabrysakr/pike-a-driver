import 'dart:ui';

import '../../../../businesslogic/map_cubit/map_cubit.dart';
import '../../../../presentaion/screens/maps/progressline.dart';
import '../../../../presentaion/widget/custombutton.dart';
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

import '../../../main.dart';

class TrackOrderMap extends StatelessWidget {
  TrackOrderMap({Key? key}) : super(key: key);
  static const String id = 'TrackOrderMap';
  var serachController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    buildingsEnabled: true,
                    zoomControlsEnabled: false,
                    initialCameraPosition:
                        const CameraPosition(target: LatLng(12, 12)),
                    onTap: mapCubit.addMarker,
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
                _mapfooter(context),
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
              data: App.tr.tracking,
              size: 18.sp,
              weight: FontWeight.w800,
            ),
            SizedBox(
              width: 33.w,
            ),
          ],
        ),
      ),
    );
  }

  _mapfooter(context) {
    return Positioned(
      bottom: 0,
      left: 5.w,
      right: 5.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
            fontsize: 13.sp,
            fontweight: FontWeight.w500,
            height: 5.7.h,
            butcolor: Colors.white.withOpacity(.6),
            txtcolor: MyColors.goldColor,
            ontap: () {},
            text: App.tr.support,
            width: MediaQuery.of(context).size.width * .67,
          ),
          const CustomLine(),
          SizedBox(
            height: .9.h,
          )
        ],
      ),
    );
  }

  _mapbox(context) {
    return Positioned(
      bottom: 9.h,
      left: 7.w,
      right: 7.w,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            // height: MediaQuery.of(context).size.height * .25,
            width: MediaQuery.of(context).size.width * .8,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white10.withAlpha(80)),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withAlpha(10),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ),
              ],
              color: Colors.white.withOpacity(0.3),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 1.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          data: App.tr.status,
                          size: 12.sp,
                          weight: FontWeight.w400,
                        ),
                        CustomText(
                          data: App.tr.ontheway,
                          size: 13.sp,
                          weight: FontWeight.w700,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  const ScreenProgress(
                    ticks: 2,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                ],
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
}
