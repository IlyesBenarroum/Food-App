import 'package:flutter/material.dart';

class TopHeader extends StatelessWidget {
  const TopHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: screenWidth * 0.5,
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              'Delicious Salads',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Container(
          width: screenWidth * 0.475,
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: Text(
              'We make fresh and Healthy food',
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
