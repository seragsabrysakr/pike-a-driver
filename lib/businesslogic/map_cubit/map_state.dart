part of 'map_cubit.dart';

@immutable
abstract class MapState {}

class MapInitial extends MapState {}

class SetMapController extends MapState {}

class MapCreated extends MapState {}

class AddMarker extends MapState {}
class GetInitialCamera extends MapState {}

class MoveCameratoCurrentLocation extends MapState {}

class MapGetLocation extends MapState {}

class MapChangeLocation extends MapState {}
