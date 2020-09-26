import 'package:flutter/material.dart';

class Filtering extends StatefulWidget {
  Filtering({Key key}) : super(key: key);

  @override
  _FilteringState createState() => _FilteringState();
}

class _FilteringState extends State<Filtering> {
  @override
  build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth - screenWidth * 0.05 * 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FilterCard(
            screenHeight: screenHeight,
            screenWidth: screenWidth,
            color: Colors.black,
            text: 'Salads',
          ),
          FilterCard(
            screenHeight: screenHeight,
            screenWidth: screenWidth,
            color: Colors.grey.withOpacity(0.2),
            text: 'Soups',
          ),
          FilterCard(
            screenHeight: screenHeight,
            screenWidth: screenWidth,
            color: Colors.grey.withOpacity(0.2),
            text: 'Grilled',
          ),
          Icon(Icons.filter_list),
        ],
      ),
    );
  }
}

class FilterCard extends StatelessWidget {
  const FilterCard({
    Key key,
    @required this.color,
    @required this.screenHeight,
    @required this.screenWidth,
    @required this.text,
  }) : super(key: key);

  final double screenHeight;
  final double screenWidth;
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.05,
      width: screenWidth * 0.25,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(50),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: color == Colors.black ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
