import 'package:flutter/material.dart';

class TabBarContainer extends StatelessWidget {
  const TabBarContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Colors.orange[300],
        borderRadius: BorderRadius.circular(25.0),
        border: Border.all(
          color: Colors.black,
          width: 1.0,
        ),
      ),
      child: TabBar(
        indicator: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(25.0),
        ),
        labelColor: Colors.white,
        unselectedLabelColor: Colors.black,
        tabs: const [
          Tab(
            text: 'Popular',
          ),
          Tab(
            text: 'Upcoming',
          ),
          Tab(
            text: 'Top Rated',
          ),
        ],
      ),
    );
  }
}
