import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Flare and ListView',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'ListView animation'),
    );
  }
}

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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: ListView.separated(
            itemCount: 10,
            separatorBuilder: (BuildContext context, int index) => SizedBox(
                  height: 10.0,
                ),
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  elevation: 10.0,
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Stack(
                    children: <Widget>[
                      Container(
                          alignment: Alignment.bottomRight,
                          height: 100.0,
                          child: FlareActor(
                            "animations/moonlight.flr",
                            animation: "Untitled",
                            fit: BoxFit.cover,
                          )),
                      Positioned(
                        top: 0.0,
                        child: Container(
                            decoration: BoxDecoration(
                                //  color: Colors.lightGreen.withOpacity(0.5)
                                ),
                            margin: EdgeInsets.only(left: 10.0, right: 10.0),
                            alignment: Alignment.centerLeft,
                            height: 100.0,
                            child: Text(
                              "${index + 1}",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            )),
                      )
                    ],
                  ));
            }),
      ),
    );
  }
}
