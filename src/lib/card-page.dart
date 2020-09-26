import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  final ValueNotifier<int> pageViewNotifier;
  final String image;
  CardPage({
    @required this.pageViewNotifier,
    @required this.image,
  });
  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> with TickerProviderStateMixin {
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
      curve: Curves.easeOutBack,
    );
    _controller.addListener(() {
      setState(() {});
    });
    _controller.forward();
    _pageController = PageController(viewportFraction: 1);
    _pageController.addListener(() {
      setState(() {
        pageOffset = _pageController.page;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();
    super.dispose();
  }

  PageController _pageController;
  double pageOffset = 0;
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.white,
      height: screenWidth ,
      width: screenWidth,
      child: PageView.builder(
          onPageChanged: (index) {
            widget.pageViewNotifier.value = index;
          },
          controller: _pageController,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                left: screenWidth * 0.05,
                right: screenWidth * 0.05,
              ),
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      height: screenWidth * 0.8,
                      width: screenWidth * 0.8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[200],
                            blurRadius: 20,
                            offset: Offset(0, 15),
                          ),
                        ],
                      ),
                      child: AnimatedBuilder(
                        animation: _imgAnim,
                        builder: (context, snapshot) => Transform.translate(
                          offset: Offset(-200 * (1 - _imgAnim.value), 0),
                          child: Hero(
                            tag: 'img',
                            child: Image.asset(
                              widget.image,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: screenWidth * 0.8 * 0.09,
                    right: screenWidth * 0.8 * 0.09,
                    child: AnimatedBuilder(
                      animation: _imgAnim,
                      builder: (context, snapshot) => Transform.translate(
                        offset: Offset(200 * (1 - _imgAnim.value), 0),
                        child: Image.asset(
                          'assets/images/tommato.png',
                          width: screenWidth * 0.1,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 00,
                    right: -screenWidth * 0.1,
                    child: AnimatedBuilder(
                      animation: _imgAnim,
                      builder: (context, snapshot) => Transform.translate(
                        offset: Offset(-200 * (1 - _imgAnim.value), 0),
                        child: Image.asset(
                          'assets/images/geenleaf.png',
                          width: screenWidth * 0.8,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: screenWidth * 0.8 * 0.75,
                    right: screenWidth * 0.8 * 0.9,
                    child: AnimatedBuilder(
                      animation: _imgAnim,
                      builder: (context, snapshot) => Transform.translate(
                        offset: Offset(-500 * (1 - _imgAnim.value), 0),
                        child: Image.asset(
                          'assets/images/tommato.png',
                          width: screenWidth * 0.1,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: screenWidth * 0.23,
                    right: screenWidth * 0.3,
                    child: AnimatedBuilder(
                      animation: _imgAnim,
                      builder: (context, snapshot) => Transform.translate(
                        offset: Offset(-500 * (1 - _imgAnim.value), 0),
                        child: Image.asset(
                          'assets/images/geenleaf.png',
                          width: screenWidth * 0.8,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
