import 'package:flutter/material.dart';
import '../../../theme/theme_model.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ThemeModel themeNotifier;

  const CustomAppBar({
    Key? key,
    required this.themeNotifier,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        title: const Text(
          'Movies',
          style: TextStyle(
            fontSize: 26.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            onPressed: () {
              themeNotifier.isDark = !themeNotifier.isDark;
            },
            icon: Icon(
              themeNotifier.isDark ? Icons.nightlight_round : Icons.wb_sunny,
              color: Colors.black,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
