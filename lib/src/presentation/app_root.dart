import 'package:calendar/src/presentation/pages/mood_diary/view/mood_diary_page.dart';
import 'package:calendar/src/presentation/utils/theme/theme_manager.dart';
import 'package:flutter/material.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('ru', 'RU'), 
      theme: ThemeEnum.common.generateTheme,
      home: const MoodDiaryPage(),
    );
  }
}