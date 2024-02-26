
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PosterPreview extends StatelessWidget {
  const PosterPreview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 9.w,
        width: 9.w,
        child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl:
                'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/modern-glossy-music-event-poster-design-template-84d38a706368baec17981e71a5e5810d_screen.jpg?ts=1636991393'),
      );
  }
}