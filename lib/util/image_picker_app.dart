import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';

final imagePickerAppProvider = Provider((ref) {
  return ImagePickerApp();
});

class ImagePickerApp {
  final picker = ImagePicker();
  Future<XFile?> pickImageFromGallery() async {
    final status = await Permission.photos.status;
    Logger().i(status);
    if (status.isGranted) {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        return XFile(pickedFile.path);
      }
    } else {
      Logger().i(status);
      await Permission.photos.request();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        return XFile(pickedFile.path);
      }
    }
    return null;
  }

  Future<XFile?> pickImageFromCamera() async {
    final status = await Permission.camera.status;
    if (status.isGranted) {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        return XFile(pickedFile.path);
      }
    } else {
      await Permission.camera.request();
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        return XFile(pickedFile.path);
      }
    }
    return null;
  }
}
