import 'package:calendar/src/presentation/constants/dimensions.dart';
import 'package:calendar/src/presentation/constants/fonts/fonts.gen.dart';
import 'package:calendar/src/presentation/utils/date/date_enum.dart';
import 'package:flutter/material.dart';
import 'package:paged_vertical_calendar/paged_vertical_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = DateTime.now();

  void _goToToday() {
    setState(() {
      _focusedDay = DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: Dimensions.size_30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Color(0xFFBCBCBF),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                InkWell(
                  onTap: _goToToday,
                  child: const Text('Сегодня',
                      style: TextStyle(
                          color: Color(0xFFBCBCBF),
                          fontFamily: FontFamily.nunito,
                          fontSize: 18)),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('ПН', style: TextStyle(
                          color: Color(0xFFBCBCBF),
                          fontWeight:  FontWeight.w400,
                          fontFamily: FontFamily.nunito,
                          fontSize: 12)),
                Text('ВТ', style: TextStyle(
                          color: Color(0xFFBCBCBF),
                          fontWeight:  FontWeight.w400,
                          fontFamily: FontFamily.nunito,
                          fontSize: 12)),
                Text('СР', style: TextStyle(
                          color: Color(0xFFBCBCBF),
                          fontWeight:  FontWeight.w400,
                          fontFamily: FontFamily.nunito,
                          fontSize: 12)),
                Text('ЧТ', style: TextStyle(
                          color: Color(0xFFBCBCBF),
                          fontWeight:  FontWeight.w400,
                          fontFamily: FontFamily.nunito,
                          fontSize: 12)),
                Text('ПТ', style: TextStyle(
                          color: Color(0xFFBCBCBF),
                          fontWeight:  FontWeight.w400,
                          fontFamily: FontFamily.nunito,
                          fontSize: 12)),
                Text('СБ', style: TextStyle(
                          color: Color(0xFFBCBCBF),
                          fontWeight:  FontWeight.w400,
                          fontFamily: FontFamily.nunito,
                          fontSize: 12)),
                Text('ВС', style: TextStyle(
                          color: Color(0xFFBCBCBF),
                          fontWeight:  FontWeight.w400,
                          fontFamily: FontFamily.nunito,
                          fontSize: 12)),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Expanded(
                    child: PagedVerticalCalendar(
                      minDate: _focusedDay.subtract(const Duration(days: 365)),
                      maxDate: _focusedDay.add(const Duration(days: 365)),
                      initialDate: DateTime.now().add(const Duration(days: 3)),
                      startWeekWithSunday: false,
                      monthBuilder: (context, month, year) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              child: Text(
                                year.toString(),
                                style: const TextStyle(
                                  fontFamily: FontFamily.nunito,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFBCBCBF),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              child: Text(
                                intToMonthName(month),
                                style: const TextStyle(
                                  fontFamily: FontFamily.nunito,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF4C4C69),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      dayBuilder: (context, date) {
                        final isToday = date.year == _focusedDay.year &&
                            date.month == _focusedDay.month &&
                            date.day == _focusedDay.day;

                        return Container(
                          margin: const EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                            color: isToday ? const Color(0x75FF8702) : null,
                            borderRadius: BorderRadius.circular(90),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            date.day.toString(),
                            style: const TextStyle(
                              fontFamily: FontFamily.nunito,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
