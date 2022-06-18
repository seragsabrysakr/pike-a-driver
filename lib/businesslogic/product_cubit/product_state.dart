part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductStateInitial extends ProductState {}

class BoxBarChangeIndex extends ProductState {}

class ProductStateIncreament extends ProductState {}

class ProductStateDecreament extends ProductState {}
