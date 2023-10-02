import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final imagePickerAppProvider = Provider((ref) {
  return ImagePickerApp();
});

class ImagePickerApp {
  final picker = ImagePicker();
  Future<XFile?> pickImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return XFile(pickedFile.path);
    }
    return null;
  }

  Future<XFile?> pickImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      return XFile(pickedFile.path);
    }
    return null;
  }
}
