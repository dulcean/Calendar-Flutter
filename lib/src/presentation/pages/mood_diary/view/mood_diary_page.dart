import 'dart:developer';

import 'package:calendar/src/presentation/constants/assets/assets.gen.dart';
import 'package:calendar/src/presentation/constants/dimensions.dart';
import 'package:calendar/src/presentation/constants/strings.dart';
import 'package:calendar/src/presentation/pages/calendar/view/calendar.dart';
import 'package:calendar/src/presentation/shared/button_list.dart';
import 'package:calendar/src/presentation/shared/list_view.dart';
import 'package:calendar/src/presentation/shared/slider.dart';
import 'package:calendar/src/presentation/shared/switch.dart';
import 'package:calendar/src/presentation/shared/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'mood_list.dart';

class MoodDiaryPage extends StatefulWidget {
  const MoodDiaryPage({super.key});

  @override
  State<MoodDiaryPage> createState() => _MoodDiaryPageState();
}

class _MoodDiaryPageState extends State<MoodDiaryPage> {
  int currentMods = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: Dimensions.size_64,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: Dimensions.size_20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: Dimensions.size_24),
                    const Spacer(),
                    Text(
                      Strings.dateTimeNow,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Spacer(),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CalendarScreen()),
                          );
                        },
                        child: SvgPicture.asset(Assets.svg.calendarIcon)),
                  ],
                ),
              ),
              const SizedBox(
                height: Dimensions.size_24,
              ),
              ISwitch(
                width: Dimensions.size_288,
                height: Dimensions.size_35,
                radius: Dimensions.size_47,
                onChanged: (value) => log(value.toString()),
              ),
              const SizedBox(height: Dimensions.size_30),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: Dimensions.size_20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      Strings.line_1,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: Dimensions.size_20,
              ),
              ButtonList(
                onButtonPressed: (index) => setState(() {
                  currentMods = index;
                }),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimensions.size_20),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimatedSize(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                          child: currentMods != -1
                              ? IList(items: getMoodList(currentMods))
                              : const SizedBox(),
                        ),
                        const SizedBox(
                          height: Dimensions.size_35,
                        ),
                        Text(
                          Strings.line_2,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(
                          height: Dimensions.size_20,
                        ),
                        CustomSlider(
                          isActive: currentMods != -1,
                          leftText: Strings.widgetTl1,
                          rightText: Strings.widgetTr1,
                        ),
                        const SizedBox(
                          height: Dimensions.size_35,
                        ),
                        Text(
                          Strings.line_3,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(
                          height: Dimensions.size_20,
                        ),
                        CustomSlider(
                          isActive: currentMods != -1,
                          leftText: Strings.widgetTl2,
                          rightText: Strings.widgetTr2,
                        ),
                        const SizedBox(
                          height: Dimensions.size_35,
                        ),
                        Text(
                          Strings.line_4,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(
                          height: Dimensions.size_20,
                        ),
                        MultiLineTextFormField(),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          height: currentMods != -1
                              ? Dimensions.size_20
                              : Dimensions.size_91,
                        ),
                        Center(
                          child: TextButton(
                            style: Theme.of(context)
                                .textButtonTheme
                                .style
                                ?.copyWith(
                                  backgroundColor: currentMods != -1 ? WidgetStateProperty.all(
                                    const Color(0xFFFF8702),
                                  ) : WidgetStateProperty.all(
                                    const Color(0xFFF2F2F2),
                                  )
                                ),
                            onPressed: () {
                              log("Button pressed");
                            },
                            child: Text(
                              Strings.buttonText,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                      color: currentMods != -1
                                          ? Colors.white
                                          : const Color(0xFFBCBCBF)),
                            ),
                          ),
                        ),
                        const SizedBox(height: Dimensions.size_20),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
