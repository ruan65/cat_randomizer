import 'package:cat_randomizer/network/cat_service.dart';
import 'package:flutter/material.dart';

import 'cat_detailed_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Cat A List'),
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
  List<String> catalinks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//      ),
      body: ListView.builder(
        itemCount: catalinks.length,
        itemBuilder: (BuildContext ctx, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CatDetailedScreen(catalinks[index]),
                ),
              );
            },
            child: Image.network(catalinks[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () async {
          List<String> cLinks = await fetchCatListLinks();
          setState(() {
            catalinks.clear();
            catalinks.addAll(cLinks);

            print(catalinks);
          });
        },
        child: Icon(Icons.sync),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
