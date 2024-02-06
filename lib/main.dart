import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_sharepreferance/pages/controllers/note_controller.dart';
import 'package:provider_with_sharepreferance/pages/controllers/theme_controller.dart';
import 'package:provider_with_sharepreferance/pages/view/home/home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NoteController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeController(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: Provider.of<ThemeController>(context).currentTheme,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}
