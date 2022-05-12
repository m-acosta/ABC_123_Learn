import 'dart:async';

import 'package:flutter/material.dart';

import 'home.dart';

class Splash extends StatefulWidget {
  Splash({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 3)
    );
    animation = CurvedAnimation(
        parent: controller,
        curve: Curves.easeIn);
    controller.repeat();
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route () {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage())
    );
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/watercolor-cotton-candy-colors.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
                    'ABC 123 Learn',
                    style: TextStyle(
                      fontSize: 20,
                    )
                )
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: RotationTransition(
                turns: animation,
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset(
                    'assets/images/transparent-color-wheel.png',
                  )
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Special thanks to Daisy May Edwards for use of her artwork!"),
            Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset(
                'assets/images/icon/transparent icon.png',
                scale: 5,
              ),
            ),
          ]
        ),
      )
    );
  }
}