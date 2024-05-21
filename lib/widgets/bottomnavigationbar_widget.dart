import 'package:flutter/material.dart';

class WgBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final List<BottomNavigationBarItem> listElements;
  final Function(int)? tapFunction;
  const WgBottomNavigationBar({
    super.key,
    this.selectedIndex = 0,
    this.tapFunction,
    this.listElements = const [],
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      type: BottomNavigationBarType.shifting,
      onTap: tapFunction,
      items: listElements,
    );
  }
}
