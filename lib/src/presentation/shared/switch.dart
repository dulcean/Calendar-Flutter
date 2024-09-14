import 'package:calendar/src/presentation/constants/assets/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ISwitch extends StatefulWidget {
  final double width;
  final double height;
  final double radius;
  final ValueChanged<bool> onChanged;
  const ISwitch(
      {super.key,
      required this.width,
      required this.height,
      required this.radius,
      required this.onChanged});

  @override
  State<ISwitch> createState() => _ISwitchState();
}

class _ISwitchState extends State<ISwitch> {
  bool isFirstSelected = true;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isFirstSelected = !isFirstSelected;
          });
          widget.onChanged(isFirstSelected);
        },
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
              color: Theme.of(context).highlightColor,
              borderRadius: BorderRadius.circular(widget.radius)),
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                left: isFirstSelected ? 0 : 172,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: isFirstSelected ? 172 : 116,
                  height: widget.height,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(widget.radius),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 9.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 17),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            Assets.svg.bookIcon,
                            width: 12,
                            colorFilter: isFirstSelected
                                ? const ColorFilter.mode(
                                    Colors.white, BlendMode.srcIn)
                                : const ColorFilter.mode(
                                    Color(0xFFBCBCBF), BlendMode.srcIn),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Дневник настроения',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: isFirstSelected
                                  ? Colors.white
                                  : const Color(0xFFBCBCBF),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 17),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            Assets.svg.statIcon,
                            width: 12,
                            colorFilter: isFirstSelected
                                ? const ColorFilter.mode(
                                    Color(0xFFBCBCBF), BlendMode.srcIn)
                                : const ColorFilter.mode(
                                    Colors.white, BlendMode.srcIn),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Статистика',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: isFirstSelected
                                  ? const Color(0xFFBCBCBF)
                                  : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
