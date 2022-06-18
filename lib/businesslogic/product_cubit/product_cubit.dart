import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductStateInitial());
  static ProductCubit get(context) => BlocProvider.of(context);

  int selectedPosition = 0;

  void changeindex(int i) {
    selectedPosition = i;

    emit(BoxBarChangeIndex());
  }

  int number = 0;
  void increament() {
    number++;
    emit(ProductStateIncreament());
  }

  void decreament() {
    number--;
    emit(ProductStateDecreament());
  }
}
