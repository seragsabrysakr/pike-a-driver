import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:marker_icon/marker_icon.dart';

import '../../../../shared/resurces.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapInitial());
  static MapCubit get(context) => BlocProvider.of(context);
  GoogleMapController? mapcontroller;
  List<Marker> markers = [];
  final CustomInfoWindowController customInfoWindowController =
      CustomInfoWindowController();
//setmapController//
  GoogleMapController setmapController(GoogleMapController controller) {
    emit(SetMapController());
    return controller;
  }

//on map created
  Future<void> onmapcreated(GoogleMapController? controller) async {
    customInfoWindowController.googleMapController = controller;
    mapcontroller = setmapController(controller!);
    getCurrentLocation().then((value) {
      mapcontroller?.animateCamera(CameraUpdate.newLatLngZoom(
          LatLng(value.latitude, value.longitude), 10));
      addMarker(LatLng(value.latitude, value.longitude));
    });

    emit(MapCreated());
  }

//add marker
  addMarker(LatLng latlng) async {
    BitmapDescriptor icon = await MarkerIcon.pictureAsset(
      assetPath: Resurces.marker,
      width: 60,
      height: 100,
    );
    markers = [];

    markers.add(Marker(
      markerId: MarkerId(latlng.toString()),
      position: latlng,
      icon: icon,
      onTap: () {
        print('tap');
        customInfoWindowController.addInfoWindow!(
          Stack(
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: SvgPicture.asset('assets/images/map/Group 8208.svg',
                    fit: BoxFit.cover),
              )
            ],
          ),
          latlng,
        );
      },
      draggable: true,
      onDrag: (po) {},
    ));
    emit(AddMarker());
  }

  //getCurrentlocation
  Future<Position> getCurrentLocation() async {
    await Geolocator.requestPermission();

    Position currentLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    emit(MapGetLocation());
    return currentLocation;
  }

//movecamera
  movecameratocurrentlocation(GoogleMapController? controller) {
    getCurrentLocation().then((value) {
      controller?.animateCamera(CameraUpdate.newLatLngZoom(
          LatLng(value.latitude, value.longitude), 12));
      addMarker(LatLng(value.latitude, value.longitude));
    });
    emit(MoveCameratoCurrentLocation());
  }

//getinitialcamiraposition
  CameraPosition getinitialcamiraposition() {
    CameraPosition? initialCamera;
    getCurrentLocation().then((value) {
      initialCamera = CameraPosition(
          target: LatLng(value.latitude, value.longitude), zoom: 12.0);
    });
    emit(GetInitialCamera());
    return initialCamera!;
  }

  bool saved = true;
  bool recent = true;

  List<String> savedplaces = [
    'No 03, 4th Lane, Newyork',
    'No 03, 4th Lane',
  ];

  List<String> recentplaces = [
    'No 03, 4th Lane, Newyork',
    'No 03, 4th Lane',
  ];
}
