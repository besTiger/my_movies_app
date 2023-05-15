import 'package:custom_line_indicator_bottom_navbar/custom_line_indicator_bottom_navbar.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomLineIndicatorBottomNavbar(
      selectedColor: Colors.black,
      // Modified selected color
      unSelectedColor: Colors.black,
      // Modified unselected color
      backgroundColor: Colors.orange,
      currentIndex: selectedIndex,
      unselectedIconSize: 28,
      selectedIconSize: 33,
      enableLineIndicator: true,
      lineIndicatorWidth: 3,
      indicatorType: IndicatorType.Top,
      customBottomBarItems: [
        CustomBottomBarItems(
          label: 'Movies',
          icon: Icons.movie,
        ),
        CustomBottomBarItems(
          label: 'Search',
          icon: Icons.search,
        ),
        CustomBottomBarItems(
          label: 'Favorites',
          icon: Icons.favorite,
        ),
      ],
      onTap: onTap,
    );
  }
}