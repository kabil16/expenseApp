import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_pade.dart';
// import 'package:google_fonts/google_fonts.dart';

//Light and dark theme setup
var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker',
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kDarkColorScheme.primaryContainer,
              foregroundColor: kDarkColorScheme.onPrimaryContainer),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: GoogleFonts.rajdhani(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: kDarkColorScheme.onSecondaryContainer,
                ),
              ),
              bodyLarge: GoogleFonts.rajdhani(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: kDarkColorScheme.onSecondaryContainer,
                ),
              ),
              
            ),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: GoogleFonts.rajdhani(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: kColorScheme.onSecondaryContainer,
                ),
              ),
            ),        
      ),
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}
