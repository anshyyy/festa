import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../domain/core/constants/asset_constants.dart';

class StarRating extends StatefulWidget {
  final int starCount;
  final double rating;
  final ValueChanged<double> onRatingChanged;

  StarRating({
    this.starCount = 5,
    this.rating = 0.0,
    required this.onRatingChanged,
  });

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  double _rating = 0.0;
  double _sliderValue = 0.0;

  @override
  void initState() {
    super.initState();
    _rating = widget.rating;
    _sliderValue = _rating / widget.starCount;
  }

  List<String> starAssets = [
    AssetConstants.review1Icon,
    AssetConstants.review2Icon,
    AssetConstants.review3Icon,
    AssetConstants.review4Icon,
    AssetConstants.review5Icon,
  ];

  double getStarSize(int index) {
    double baseSize = 5.5.h;
    List<double> sizeMultipliers = [0.7, 1.0, 1.3, 1.0, 0.7];
    return baseSize * sizeMultipliers[index];
  }

  Widget buildStar(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _rating = index + 1.0;
          _sliderValue = _rating / widget.starCount;
        });
        widget.onRatingChanged(_rating);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.5.w),
        child: SvgPicture.asset(
          starAssets[index],
          height: getStarSize(index),
          width: getStarSize(index),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.starCount, (index) => buildStar(index)),
            ),
            SizedBox(height: 1.h),
            SizedBox(
              width: constraints.maxWidth * 0.7,
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 0.5.h,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 1.h),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 2.h),
                  trackShape: CustomTrackShape(),
                ),
                child: Slider(
                  value: _sliderValue,
                  min: 0,
                  max: 1,
                  activeColor: Colors.amber,
                  thumbColor: Colors.white,
                  inactiveColor: Colors.amber,
                  onChanged: (newValue) {
                    setState(() {
                      _sliderValue = newValue;
                      _rating = newValue * widget.starCount;
                    });
                    widget.onRatingChanged(_rating);
                  },
                ),
              ),
            ),
          ],
        );
      }
    );
  }
}

// Custom track shape to remove the side paddings of the slider
class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight!;
    final double trackLeft = offset.dx;
    final double trackTop = offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}