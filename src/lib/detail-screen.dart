import 'package:flutter/material.dart';
import 'card-page.dart';
import 'diplay-page-indicator.dart';
import 'name-and-count.dart';
import 'package:auto_size_text/auto_size_text.dart';

class DetailScreen extends StatefulWidget {
  final String image;
  final String title;
  final String price;

  const DetailScreen({
    this.image,
    this.title,
    this.price,
  });

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with TickerProviderStateMixin {
  ValueNotifier<int> _pageViewNotifier = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            overflow: Overflow.visible,
            children: [
              Container(
                height: screenHeight,
                width: screenWidth,
                color: Colors.white,
              ),
              //menu icon
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.05),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.arrow_back)),
                ),
              ),
              //... icon
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.05),
                  child: Icon(Icons.more_vert),
                ),
              ),
              Positioned(
                top: screenHeight * 0.06,
                child: SingleChildScrollView(
                  child: Stack(
                    children: [
                      Container(
                        height: screenHeight,
                        width: screenWidth,
                        color: Colors.transparent,
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        left: 0,
                        child: CardPage(
                          pageViewNotifier: _pageViewNotifier,
                          image: widget.image,
                        ),
                      ),
                      Positioned(
                        top: screenWidth * 0.85,
                        right: 0,
                        left: 0,
                        child: DisplayPageIndicator(
                          length: 3,
                          pageViewNotifier: _pageViewNotifier,
                        ),
                      ),
                      Positioned(
                          right: screenWidth * 0.05,
                          left: screenWidth * 0.05,
                          top: screenWidth + screenWidth * 0.05,
                          child: NameAndCount(title: widget.title)),
                      Positioned(
                        left: screenWidth * 0.05,
                        right: screenWidth * 0.05,
                        top: screenWidth + screenHeight * 0.1,
                        child: Container(
                          height: screenHeight * 0.15,
                          child: AutoSizeText(
                            'Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test TestTest Test Test Test Test TestTest Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test.',
                            style: TextStyle(
                              height: 1.5,
                              color: Colors.grey[700],
                            ),
                            maxLines: 4,
                          ),
                        ),
                      ),
                      Positioned(
                        top: screenWidth + screenHeight * 0.225,
                        left: screenWidth * 0.05,
                        child: Container(
                          width: screenWidth * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: screenHeight * 0.02,
                                child: FittedBox(
                                  fit: BoxFit.fitHeight,
                                  child: Text(
                                    'Delivery Time',
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Icon(
                                Icons.timer,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: screenHeight * 0.02,
                                child: FittedBox(
                                  child: Text(
                                    '25 Mins',
                                    style: TextStyle(
                                      color: Colors.black,
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
                        top: screenWidth + screenHeight * 0.25,
                        left: screenWidth * 0.05,
                        right: screenWidth * 0.05,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Total Price',
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.01,
                                  ),
                                  Text(
                                    '\$${widget.price}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              Stack(
                                children: [
                                  Container(
                                    height: screenHeight * 0.09,
                                    width: screenHeight * 0.09,
                                    child: Image.asset(
                                        'assets/images/rectangle.png'),
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        width: screenHeight * 0.09,
                                        height: screenHeight * 0.09,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Icon(
                                            Icons.shopping_cart,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: screenHeight * 0.025,
                                        right: screenHeight * 0.025,
                                        child: Container(
                                          width: 12,
                                          height: 12,
                                          decoration: BoxDecoration(
                                            color: Colors.deepOrange,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: Text(
                                              '1',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 8,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
