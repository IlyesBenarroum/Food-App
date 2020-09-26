import 'package:flutter/material.dart';
import 'package:page_view_indicator/page_view_indicator.dart';

class DisplayPageIndicator extends StatelessWidget {
  final int length;
  final ValueNotifier<int> pageViewNotifier;
  const DisplayPageIndicator({
    @required this.length,
    @required this.pageViewNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return PageViewIndicator(
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Container(
          width: 12.0,
          height: 4.0,
          decoration: BoxDecoration(
            color: Colors.black45,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      pageIndexNotifier: pageViewNotifier,
      length: length,
      normalBuilder: (animationController, index) => Container(
        width: 12.0,
        height: 4.0,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
