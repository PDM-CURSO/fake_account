import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'picture_event.dart';
part 'picture_state.dart';

class PictureBloc extends Bloc<PictureEvent, PictureState> {
  PictureBloc() : super(PictureInitial()) {
    on<CambiarFotoEvent>(_onChangeImage);
  }

  void _onChangeImage(PictureEvent event, Emitter emit) async {
    File? img = await _pickImage();
    if (img == null) {
      emit(PictureErrorState(errorMsg: "No se seleccionó imagen"));
    } else {
      emit(PictureSelectedState(picture: img));
    }
  }

  Future<File?> _pickImage() async {
    var _picker = ImagePicker();
    XFile? image = await _picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 720,
      maxWidth: 720,
    );
    return image != null ? File(image.path) : null;
  }
}
