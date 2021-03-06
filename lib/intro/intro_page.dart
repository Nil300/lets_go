import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lets_go/models/Trip.dart';
import 'package:lets_go/views/homeView.dart';
import 'package:lets_go/views/profile_deatils.dart';

var color1 = Color(0xff0204b2);
var color2 = Color(0xfff0195e);
var color3 = Color(0xffff8903);

List<String> image = [
  'assets/images/img1.png',
  'assets/images/img2.png',
  'assets/images/img3.png'
];

List<String> title = [
  'Available\nscooters',
  'Always full\ncharged',
  'Enjoy your\nride!',
];

List<String> text = [
  'Search for available scooters\naround you on a handy\ninteractive map',
  'You don\'t need to worry about\nthe scooter charging',
  'You can play for rent after\nfinishing your ride'
];

class Intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SlidePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SlidePage extends StatefulWidget {
  @override
  _SlidePageState createState() => _SlidePageState();
}

class _SlidePageState extends State<SlidePage> {
  CarouselSlider carouselSlider;
  int carouselIndex = 0;

  @override
  Widget build(BuildContext context) {
    carouselSlider = CarouselSlider(
      viewportFraction: 1.0,
      enableInfiniteScroll: false,
      onPageChanged: (index) {
        setState(() {
          carouselIndex = index;
        });
      },
      height: MediaQuery.of(context).size.height,
      items: <Widget>[
        CarouselComponent(
          col1: color1,
          col2: color2,
          imgUrl: image[0],
          ttl: title[0],
          txt: text[0],
        ),
        CarouselComponent(
          col1: color2,
          col2: color3,
          imgUrl: image[1],
          ttl: title[1],
          txt: text[1],
        ),
        CarouselComponent(
          col1: color3,
          col2: color3,
          imgUrl: image[2],
          ttl: title[2],
          txt: text[2],
        ),
      ],
    );

    return Scaffold(
      floatingActionButton: carouselIndex == 2
          ? Container()
          : IconButton(
              icon: Icon(
                Icons.chevron_right,
                size: 30,
                color: Colors.white,
              ),
              onPressed: () {
                carouselSlider.nextPage(
                    duration: Duration(milliseconds: 500), curve: Curves.ease);
              }),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          carouselSlider,
          carouselIndex == 2
              ? Positioned(
                  bottom: 40,
                  child: FlatButton(
                    padding: EdgeInsets.only(
                        top: 20.0, left: 40.0, right: 40.0, bottom: 20.0),
                    color: color1,
                    child: Text(
                      'READY TO GO',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeView()),
                      );
                    },
                  ),
                )
              : Positioned(
                  bottom: 60,
                  child: Row(
                    children: <Widget>[
                      Indicator(
                        carouselIndex: carouselIndex,
                        indicatorIndex: 0,
                      ),
                      Indicator(
                        carouselIndex: carouselIndex,
                        indicatorIndex: 1,
                      ),
                      Indicator(
                        carouselIndex: carouselIndex,
                        indicatorIndex: 2,
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}

class CarouselComponent extends StatelessWidget {
  final col1, col2, imgUrl, ttl, txt;

  CarouselComponent({this.col1, this.col2, this.imgUrl, this.ttl, this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(right: 20),
      color: col2,
      child: Container(
        decoration: BoxDecoration(
          color: col1,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(180),
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Image.asset('assets/images/ logo.png'),
            SizedBox(
              height: 80,
            ),
            Image.asset(
              imgUrl,
              height: 300,
            ),
            SizedBox(
              height: 100,
            ),
            Text(
              ttl,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 36,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              txt,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final carouselIndex, indicatorIndex;

  Indicator({this.carouselIndex, this.indicatorIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: 8,
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: carouselIndex == indicatorIndex ? Colors.white : Colors.grey,
      ),
    );
  }
}
