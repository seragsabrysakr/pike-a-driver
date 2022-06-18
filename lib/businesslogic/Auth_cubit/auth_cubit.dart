import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:meta/meta.dart';

import '../../shared/functions.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);
File? profileimage;
  File? idimage;

  Future<File> tackphoto(context) async {
    File? _image;
    final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);

    _image = File(pickedFile!.path);
    navigateback(context: context);
    return _image;
  }

  Future<File> gallaryphoto(context) async {
    File? _image;

    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    _image = File(pickedFile!.path);

    navigateback(context: context);
    return _image;
  }
}
