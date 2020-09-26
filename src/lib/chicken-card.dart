import 'package:flutter/material.dart';

import 'detail-screen.dart';

class ChickenCard extends StatefulWidget {
  final String title;
  final String sub;
  final String img;
  final double price;
  final Function onTap;
  ChickenCard(
      {@required this.title,
      @required this.sub,
      @required this.price,
      @required this.onTap,
      @required this.img});

  @override
  _ChickenCardState createState() => _ChickenCardState();
}

class _ChickenCardState extends State<ChickenCard>
    with TickerProviderStateMixin {
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              image: 'assets/images/chicken.png',
              title: 'Chicken Salad',
              price: "30",
            ),
          ),
        );
      },
      child: Container(
        height: screenHeight * 0.18,
        width: screenWidth * 0.95,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(screenWidth),
        ),
        child: Stack(
          overflow: Overflow.visible,
          children: [
            //image
            Positioned(
              left: -screenWidth * 0.175,
              top: -screenHeight * 0.032,
              child: Container(
                height: screenHeight * 0.25,
                width: screenHeight * 0.25,
                child: AnimatedBuilder(
                  animation: _imgAnim,
                  builder: (context, snapshot) {
                    return Transform.translate(
                      offset: Offset(screenWidth * (1 - _imgAnim.value), 0),
                      child: Hero(
                        tag: 'img',
                        child: Image.asset(
                          '${widget.img}',
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            //text column
            Positioned(
              top: (screenHeight * 0.18) * 0.25,
              left: screenWidth * 0.95 * 0.38,
              child: Container(
                height: (screenHeight * 0.18) / 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: screenWidth * 0.95 * 0.3,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          '${widget.title}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: screenWidth * 0.95 * 0.35,
                      child: FittedBox(
                        child: Text(
                          '${widget.sub}',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: screenWidth * 0.95 * 0.125,
                      child: FittedBox(
                        child: Text(
                          '\$${widget.price}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: screenWidth * 0.025,
              top: 0,
              bottom: 0,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: screenWidth * 0.07,
                  width: screenWidth * 0.07,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                      child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
