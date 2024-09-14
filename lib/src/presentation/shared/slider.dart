import 'package:calendar/src/presentation/constants/assets/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSlider extends StatefulWidget {
  final String leftText;
  final String rightText;
  final bool isActive;

  const CustomSlider({
    super.key,
    required this.leftText,
    required this.rightText,
    required this.isActive,
  });

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double _value = 50.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 1,
            spreadRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, (index) {
                return SvgPicture.asset(Assets.svg.rectDiv);
              }),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: widget.isActive
                  ? Theme.of(context).primaryColor
                  : Colors.grey.shade300,
              inactiveTrackColor:
                  widget.isActive ? Colors.grey.shade300 : Colors.grey.shade300,
              thumbColor: widget.isActive
                  ? Theme.of(context).primaryColor
                  : Colors.grey.shade300,
              thumbShape: CustomSliderThumbShape(isActive: widget.isActive),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 0.0),
              trackShape: CustomTrackShape(isActive: widget.isActive),
            ),
            child: Slider(
              min: 0.0,
              max: 100.0,
              value: widget.isActive ? _value : 50.0,
              onChanged: widget.isActive
                  ? (value) {
                      setState(() {
                        _value = value;
                      });
                    }
                  : null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.leftText,
                    style: Theme.of(context).textTheme.labelSmall),
                Text(widget.rightText,
                    style: Theme.of(context).textTheme.labelSmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSliderThumbShape extends SliderComponentShape {
  final bool isActive;

  CustomSliderThumbShape({required this.isActive});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size(6.0, 6.0);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {required Animation<double> activationAnimation,
      required Animation<double> enableAnimation,
      required bool isDiscrete,
      required TextPainter labelPainter,
      required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required TextDirection textDirection,
      required double value,
      required double textScaleFactor,
      required Size sizeWithOverflow}) {
    final Canvas canvas = context.canvas;
    final Paint paint = Paint()
      ..color = isActive ? Colors.orange : Colors.grey.shade300
      ..style = PaintingStyle.fill;

    final Paint borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    canvas.drawCircle(center, 6.0, paint);
    canvas.drawCircle(center, 6.0, borderPaint);
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  final bool isActive;

  CustomTrackShape({required this.isActive});

  @override
  void paint(PaintingContext context, Offset offset,
      {required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required Animation<double> enableAnimation,
      required TextDirection textDirection,
      required Offset thumbCenter,
      Offset? secondaryOffset,
      bool isDiscrete = false,
      bool isEnabled = false,
      double additionalActiveTrackHeight = 2}) {
    final Rect trackRect = getPreferredRect(
        parentBox: parentBox,
        sliderTheme: sliderTheme,
        offset: offset,
        isEnabled: isEnabled,
        isDiscrete: isDiscrete);

    final Paint activeTrackPaint = Paint()
      ..color = isActive ? sliderTheme.activeTrackColor! : Colors.grey.shade300
      ..style = PaintingStyle.fill;

    final Paint inactiveTrackPaint = Paint()
      ..color = isActive ? sliderTheme.inactiveTrackColor! : Colors.grey.shade300
      ..style = PaintingStyle.fill;

    const double trackHeight = 6.0;
    const double roundedShape = 10.0;

    final RRect activeTrackRect = RRect.fromLTRBAndCorners(
      trackRect.left,
      trackRect.center.dy - trackHeight / 2,
      thumbCenter.dx,
      trackRect.center.dy + trackHeight / 2,
      topLeft: const Radius.circular(roundedShape),
      bottomLeft: const Radius.circular(roundedShape),
    );
    context.canvas.drawRRect(activeTrackRect, activeTrackPaint);

    final RRect inactiveTrackRect = RRect.fromLTRBAndCorners(
      thumbCenter.dx,
      trackRect.center.dy - trackHeight / 2,
      trackRect.right,
      trackRect.center.dy + trackHeight / 2,
      topRight: const Radius.circular(roundedShape),
      bottomRight: const Radius.circular(roundedShape),
    );
    context.canvas.drawRRect(inactiveTrackRect, inactiveTrackPaint);
  }
}
