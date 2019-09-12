import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Main(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {

  var moviePhotos = [
    AssetImage("images/pic1.jpg"),
    AssetImage("images/pic2.jpg"),
    AssetImage("images/pic3.jpg"),
    AssetImage("images/pic4.jpg"),
    AssetImage("images/pic5.jpg"),
    AssetImage("images/pic6.jpg"),
  ];

  Timer timer;
  int _pos = 0;

  @override
  void initState() {
    super.initState();
    timer = new Timer.periodic(new Duration(seconds: 3), (Timer timer) async {
      this.setState(() {
        _pos = (_pos + 1) % moviePhotos.length;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: new Stack(
              children: <Widget>[
                new Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: new Image(
                      image: moviePhotos[_pos],
                      fit: BoxFit.cover
                  ),
                ),
                new Positioned(
                  top: 40,
                  left: 25,
                  child: new Text("Hi.", style: new TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold)),
                ),
                new Positioned(
                  top: 90,
                  left: 25,
                  child: new Text("Strive", style: new TextStyle(color: Colors.white, fontSize: 25)),
                ),
                new Positioned(
                  top: 160,
                  left: 25,
                  child: new Text("Here is the waterfall paradise\nwelcome your arrivalwe have\nprepared a scene for you", style: new TextStyle(color: Colors.white, fontSize: 22)),
                ),
                new Positioned(
                    top: 285,
                    left: 25,
                    child: new Container(
                      height: 325,
                      width: MediaQuery.of(context).size.width,
                      child: new ListView(
                        scrollDirection: Axis.horizontal,
                        padding: new EdgeInsets.only(top: 20, right: 45, bottom: 10),
                        children: <Widget>[
                          listItem("Niagara Falls", "images/pic3.jpg"),
                          new SizedBox(width: 30),
                          listItem("Angel Falls", "images/pic1.jpg"),
                          new SizedBox(width: 30),
                          listItem("Victoria Falls", "images/pic4.jpg"),
                          new SizedBox(width: 30),
                          listItem("Yosemite Falls", "images/pic2.jpg"),
                          new SizedBox(width: 30),
                          listItem("Sutherland Falls", "images/pic6.jpg"),
                          new SizedBox(width: 30),
                          listItem("Tugela Falls", "images/pic5.jpg")
                        ],
                      ),
                    )
                ),
                new Positioned(
                    top: 600,
                    left: 25,
                    child: new Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Opacity(
                          opacity: 0.9,
                          child: new Container(
                              width: 40,
                              height: 40,
                              decoration: new BoxDecoration(
                                  borderRadius: new BorderRadius.circular(10),
                                  color: Colors.grey
                              ),
                              child: new Icon(Icons.arrow_back, color: Colors.white)
                          ),
                        ),
                        new SizedBox(width: MediaQuery.of(context).size.width - 205),
                        new Container(
                          height: 65,
                          width: 120,
                          decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.circular(15),
                              color: Color(0xFF0dccdb)
                          ),
                          child: new Center(
                            child: new Text("Let's Go", style: new TextStyle(color: Colors.white, fontSize: 20)),
                          ),
                        )
                      ],
                    )
                )
              ],
            )
        );
  }

  Widget listItem(String txt, String imgPath){
    return new Column(
      children: <Widget>[
        new Text(txt, style: new TextStyle(color: Colors.white, fontSize: 16), textAlign: TextAlign.center),
        new SizedBox(height: 22),
        new Hero(
          tag: imgPath,
          child: new GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Second(img: imgPath)
              ));
            },
            child: new Container(
              width: 125,
              height: 225,
              decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(15),
                  image: new DecorationImage(
                      image: new AssetImage(imgPath),
                      fit: BoxFit.cover
                  )
              ),
            ),
          )
        ),
      ],
    );
  }
}

class Second extends StatefulWidget {

  final img;
  Second({this.img});

  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          new Hero(
              tag: widget.img,
              child: new Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.img), fit: BoxFit.cover
                    )
                ),
              )
          ),
          new Positioned(
              top: 40,
              left: 25,
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Opacity(
                    opacity: 0.9,
                    child: new GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: new Container(
                          width: 40,
                          height: 40,
                          decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.circular(10),
                              color: Colors.grey
                          ),
                          child: new Icon(Icons.arrow_back, color: Colors.white)
                      ),
                    )
                  ),
                  new SizedBox(width: MediaQuery.of(context).size.width - 130),
                  new Container(
                    height: 40,
                    width: 40,
                    decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(10),
                        color: Color(0xFF0dccdb)
                    ),
                    child: new Center(
                      child: new Icon(Icons.star, color: Colors.white),
                    ),
                  )
                ],
              )
          ),
          new Positioned(
              top: 175,
              left: 25,
              child: new Text("Africa", style: new TextStyle(color: Colors.white, fontSize: 31, fontWeight: FontWeight.bold),)
          ),
          new Positioned(
              top: 230,
              left: 25,
              child: new Container(
                width: 25,
                height: 5,
                color: Colors.white,
              )
          ),
          new Positioned(
              top: 280,
              left: 25,
              child: new Text("Victoria Falls", style: new TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)
          ),
          new Positioned(
              top: 310,
              left: 25,
              child: new Text("Located in the middle reaches of the zambezi river\nin Africa, Zambia and Zimbabwe border.", style: new TextStyle(color: Colors.white, fontSize: 15),)
          ),
          new Positioned(
              top: 360,
              child: new Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 360,
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.only(
                    topLeft: Radius.circular(37),
                    topRight: Radius.circular(37),
                  ),
                  color: Colors.white
                ),
                child: new Padding(
                  padding: new EdgeInsets.all(25),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          new Text("Number", style: new TextStyle(color: Color(0xFF0dccdb), fontSize: 26, fontWeight: FontWeight.bold)),
                          new SizedBox(width: 115),
                          new Row(
                            children: <Widget>[
                              new Container(
                                width: 36,
                                height: 26,
                                decoration: new BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xFFf2f4f4)
                                ),
                                child: new Center(
                                  child: new Text("1", style:new TextStyle(fontWeight: FontWeight.bold)),
                                ),
                              ),
                              new SizedBox(width: 20),
                              new Container(
                                width: 36,
                                height: 26,
                                decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(0xFF001e26)
                                ),
                                child: new Center(
                                  child: new Text("2", style:new TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                ),
                              ),
                              new SizedBox(width: 20),
                              new Container(
                                width: 36,
                                height: 26,
                                decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(0xFFf2f4f4)
                                ),
                                child: new Center(
                                  child: new Text("3", style:new TextStyle(fontWeight: FontWeight.bold)),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      new SizedBox(height: 15),
                      new Text("Parameter", style: new TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      new SizedBox(height: 15),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Container(
                            height: 70,
                            width: 85,
                            decoration: new BoxDecoration(
                              border: Border.all(color: Color(0xFFf7f8f8), width: 1),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 11.0,
                                  color: Colors.black.withOpacity(.2),
                                  offset: Offset(1.0, 6.0),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white
                            ),
                            child: new Column(
                              children: <Widget>[
                                new SizedBox(height: 12),
                                new Text("920", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 18), textAlign: TextAlign.center),
                                new SizedBox(height: 5),
                                new Text("Wide", style: new TextStyle(color: Color(0xFFb7bfc1), fontSize: 14), textAlign: TextAlign.center)
                              ],
                            ),
                          ),
                          new Container(
                            height: 70,
                            width: 85,
                            decoration: new BoxDecoration(
                                border: Border.all(color: Color(0xFFf7f8f8), width: 1),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 11.0,
                                    color: Colors.black.withOpacity(.2),
                                    offset: Offset(1.0, 6.0),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white
                            ),
                            child: new Column(
                              children: <Widget>[
                                new SizedBox(height: 12),
                                new Text("153", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 18), textAlign: TextAlign.center),
                                new SizedBox(height: 5),
                                new Text("Long", style: new TextStyle(color: Color(0xFFb7bfc1), fontSize: 14), textAlign: TextAlign.center)
                              ],
                            ),
                          ),
                          new Container(
                            height: 70,
                            width: 85,
                            decoration: new BoxDecoration(
                                border: Border.all(color: Color(0xFFf7f8f8), width: 1),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 11.0,
                                    color: Colors.black.withOpacity(.2),
                                    offset: Offset(1.0, 6.0),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white
                            ),
                            child: new Column(
                              children: <Widget>[
                                new SizedBox(height: 12),
                                new Text("840", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 18), textAlign: TextAlign.center),
                                new SizedBox(height: 5),
                                new Text("Water", style: new TextStyle(color: Color(0xFFb7bfc1), fontSize: 14), textAlign: TextAlign.center)
                              ],
                            ),
                          )
                        ],
                      ),
                      new SizedBox(height: 15),
                      new Text("Located on the zambezi river, the waterfall is the lar\ngest waterfall in Africa and one of the largest, most\nbeautiful and spectacular waterfalls in the world.", style: new TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF90989a))),
                    ],
                  ),
                )
              )
          ),
          new Positioned(
            top: 610,
              child: new Container(
                height: 75,
                width: MediaQuery.of(context).size.width,
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)
                  ),
                  color: Color(0xFF001e26),
                ),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new SizedBox(width: 25),
                    new Container(
                      height: 28,
                      width: 28,
                      decoration: new BoxDecoration(
                        border: Border.all(
                          color: Color(0xFF3c555c),
                        ),
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: new Center(
                        child: new Icon(Icons.remove, color: Colors.white, size: 20),
                      ),
                    ),
                    new SizedBox(width: 20),
                    new Text('\$1288', style: new TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
                    new SizedBox(width: 20),
                    new Container(
                      height: 28,
                      width: 28,
                      decoration: new BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF3c555c),
                          ),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: new Center(
                        child: new Icon(Icons.add, color: Colors.white, size: 20),
                      ),
                    ),
                    new SizedBox(width: 75),
                    new Container(
                      width: 120,
                      height: 50,
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xFF196b81)
                      ),
                      child: new Center(
                        child: new Text("Pay For", style: new TextStyle(color: Color(0xFFe8f0f2), fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                    )
                  ],
                ),
              )
          )
        ],
      )
    );
  }
}


