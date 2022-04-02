import 'package:flutter/material.dart';

import 'hideAndSeek.dart';
import 'iceCream.dart';
import 'stickers.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Uncomment when possible, current problem with visibility
        // height: double.infinity,
        // width: double.infinity,
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage("assets/images/watercolor-cotton-candy-colors.jpg"),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HideAndSeek()),
                  );
                },
                child: Text("Hide and Seek"),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => IceCream()),
                  );
                },
                child: Text("Ice Cream"),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Stickers()),
                  );
                },
                child: Text("Stickers"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}