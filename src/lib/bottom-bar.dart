import 'package:flutter/material.dart';

class BottonBar extends StatelessWidget {
  const BottonBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenHeight * 0.075,
      width: screenWidth * 0.8,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(screenWidth),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[600],
            offset: Offset(0, 10),
            blurRadius: 30,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: screenHeight * 0.03,
            child: Image.asset(
              'assets/images/home.png',
              fit: BoxFit.scaleDown,
            ),
          ),
          Container(
            height: screenHeight * 0.03,
            child: Image.asset(
              'assets/images/wallet.png',
              fit: BoxFit.scaleDown,
            ),
          ),
          Container(
            height: screenHeight * 0.03,
            child: Image.asset(
              'assets/images/chat.png',
              fit: BoxFit.scaleDown,
            ),
          ),
          Icon(
            Icons.person_outline,
            color: Colors.white,
            size: screenHeight * 0.03,
          ),
        ],
      ),
    );
  }
}
