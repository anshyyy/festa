import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

Future<Color> dominantColorPaletteGenerator(String imgUrl) async {
  final paletteGenerator = await PaletteGenerator.fromImageProvider(
    CachedNetworkImageProvider(imgUrl),
  );
  return paletteGenerator.dominantColor!.color;
}
