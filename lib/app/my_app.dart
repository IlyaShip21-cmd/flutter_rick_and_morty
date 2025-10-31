import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty/view/bottom_navigation_bar.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        colorScheme: ColorScheme.light(
          primary: Colors.black,
          onPrimary: Colors.white,
          onSurface: Colors.black,
          onSurfaceVariant: Colors.grey,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        colorScheme: ColorScheme.dark(
          primary: Colors.white,
          onPrimary: Colors.black,
          onSurface: Colors.white,
          onSurfaceVariant: Colors.grey,
        ),
      ),
      themeMode: ThemeMode.system,
      title: 'Ricl and Morty',
      home: BottomNavigationBarView(),
    );
  }
}
