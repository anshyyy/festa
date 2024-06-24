import '../../../infrastructure/core/enum/image_type.enum.dart';
import '../constants/other_constants.dart';

class CustomImageProvider {
  static String getImageUrl(String? imageUrl, ImageType type) {
    return imageUrl ==null || imageUrl.isEmpty ? 
    type == ImageType.other ?
    OtherConstants.defaultImage : OtherConstants.profileImage : imageUrl;
  }
}
