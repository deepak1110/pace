import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pace_pro/feature/tab/app_tab_bar.dart';
import 'package:pace_pro/utls/color_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.manropeTextTheme(textTheme).copyWith(
          bodyMedium: GoogleFonts.manrope(textStyle: textTheme.bodyMedium),
        ),
        scaffoldBackgroundColor: ColorConstants.bgColor,
        colorScheme:
            ColorScheme.fromSeed(seedColor: ColorConstants.primaryColor),
        useMaterial3: true,
      ),
      home: const AppTabBar(),
    );
  }
}
