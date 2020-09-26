import 'package:flutter/material.dart';

class SaladCard extends StatefulWidget {
  @override
  _SaladCardState createState() => _SaladCardState();
}

class _SaladCardState extends State<SaladCard> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _imgAnim;
  @override
  void initState() {
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    _imgAnim = CurvedAnimation(
      parent: _controller,
      curve: Curves.ease,
    );
    _controller.addListener(() {
      setState(() {});
    });
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenHeight * 0.3,
      width: screenWidth * 0.3,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(screenWidth),
      ),
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            height: screenHeight * 0.3,
            width: screenWidth * 0.3,
            color: Colors.transparent,
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              child: AnimatedBuilder(
                animation: _imgAnim,
                builder: (context, snapshot) {
                  return Transform.translate(
                    offset:
                        Offset(0, screenHeight * 0.3 * (1 - _imgAnim.value)),
                    child: Image.asset('assets/images/mixed.png'),
                  );
                },
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.175,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      'Mixed Salad',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      'Mix Vegetables',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      '\$24.00',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: -5,
            left: 0,
            right: 0,
            child: Container(
              height: screenWidth * 0.07,
              width: screenWidth * 0.07,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
