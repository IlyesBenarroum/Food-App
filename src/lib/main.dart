import 'package:flutter/material.dart';
import 'filtering.dart';
import 'top-header.dart';
import 'bottom-bar.dart';
import 'chicken-card.dart';
import 'salad-card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
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
                child: Icon(Icons.menu),
              ),
            ),
            //search icon
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.05),
                child: Icon(Icons.search),
              ),
            ),
            //header text
            Positioned(
              top: screenHeight * 0.1,
              left: screenWidth * 0.05,
              child: TopHeader(),
            ),
            //filtering
            Positioned(
              top: screenHeight * 0.18,
              left: screenWidth * 0.05,
              child: Filtering(),
            ),
            //ChickenCard
            Positioned(
              top: screenHeight * 0.275,
              child: ChickenCard(
                title: 'Chicken Salad',
                sub: 'Chicken with Avocado',
                price: 30.00,
                img: 'assets/images/chicken.png',
                onTap: () {},
              ),
            ),
            //SaladCard row
            Positioned(
              top: screenHeight * 0.5,
              width: screenWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SaladCard(),
                  SaladCard(),
                ],
              ),
            ),
            Positioned(
              bottom: screenHeight * 0.025,
              left: screenWidth * 0.1,
              child: BottonBar(),
            ),
          ],
        ),
      ),
    );
  }
}
