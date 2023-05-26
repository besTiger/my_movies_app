import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_movies_app/screens/bottom_bar_screen/bottom_bar_screen.dart';
import 'package:my_movies_app/theme/theme_model.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MyApp()));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: Consumer(builder: (context, ThemeModel themeNotifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeNotifier.isDark ? ThemeData.dark() : ThemeData.light(),
          home: const BottomBarScreen(),
        );
      }),
    );
  }
}