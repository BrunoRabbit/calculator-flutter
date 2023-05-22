import 'package:calculator/controllers/calculator_controller.dart';
import 'package:calculator/controllers/theme_controller.dart';
import 'package:calculator/screens/home_page.dart';
import 'package:calculator/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void application() {
  runApp(const Application());
}

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CalculatorController>(
          create: (context) => CalculatorController(),
        ),
        ChangeNotifierProvider<ThemeController>(
          create: (context) => ThemeController(),
        ),
      ],
      child: Consumer<ThemeController>(
        builder: (context, value, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('pt', 'BR'),
            ],
            theme: value.isThemeChanged
                ? ActualTheme.themeDark
                : ActualTheme.themeLight,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
