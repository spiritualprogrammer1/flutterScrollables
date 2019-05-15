import 'package:flutter/material.dart';
/******permet de donner un etat lorsqu'on change de device********/
import 'package:flutter/services.dart';

void main() {
//  SystemChrome.setPreferredOrientations([
//    /*******donne une orientation dans un seul sens*****/
////    DeviceOrientation.portraitUp
//  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  List<Activite> mesActivites = [
    new Activite("kouadio", Icons.add),
    new Activite("fleury", Icons.access_alarms),
    new Activite("geoffroy", Icons.report_problem),
    new Activite("ulrich", Icons.wallpaper),
    new Activite("kouadio", Icons.add),
    new Activite("fleury", Icons.access_alarms),
    new Activite("geoffroy", Icons.report_problem),
    new Activite("ulrich", Icons.wallpaper),
    new Activite("kouadio", Icons.add),
    new Activite("fleury", Icons.access_alarms),
    new Activite("geoffroy", Icons.report_problem),
    new Activite("ulrich", Icons.wallpaper),
    new Activite("kouadio", Icons.add),
    new Activite("fleury", Icons.access_alarms),
    new Activite("geoffroy", Icons.report_problem),
    new Activite("ulrich", Icons.wallpaper),
    new Activite("kouadio", Icons.add),
    new Activite("fleury", Icons.access_alarms),
    new Activite("geoffroy", Icons.report_problem),
    new Activite("ulrich", Icons.wallpaper),
    new Activite("kouadio", Icons.add),
    new Activite("fleury", Icons.access_alarms),
    new Activite("geoffroy", Icons.report_problem),
    new Activite("ulrich", Icons.wallpaper),
    new Activite("kouadio", Icons.add),
    new Activite("fleury", Icons.access_alarms),
    new Activite("geoffroy", Icons.report_problem),
    new Activite("ulrich", Icons.wallpaper),
  ];

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    /****creer une variable orientation**/
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: new Center(
           /****change en fonction du portait******/
        child: (orientation == Orientation.portrait ) ? Liste() : grille()
      )

      /***le singleChildScrollVIew******/

//      body: new SingleChildScrollView(
//        // Center is a layout widget. It takes a single child and positions it
//        // in the middle of the parent.
//        child: Column(
//
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            new Container(height: 100.0,color: Colors.red),
//            new Container(height: 100.0,color: Colors.yellow),
//            new Container(height: 100.0,color: Colors.blue),
//            new Container(height: 100.0,color: Colors.red),
//            new Container(height: 100.0,color: Colors.greenAccent),
//            new Container(height: 100.0,color: Colors.grey),
//            new Container(height: 100.0,color: Colors.deepOrange),
//            new Container(height: 100.0,color: Colors.blue),
//            new Container(height: 100.0,color: Colors.red),
//          ],
//        ),
//      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget grille()
  {
    /******le gridview permet de faire des grid *******/
    return new GridView.builder(
      /*****le nombre d'element dans la ligne de maniere fixe*******/
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemCount: mesActivites.length,
        itemBuilder: (context,i){
          return new Container(
            margin: EdgeInsets.all(2.5),
            child: new Card(
              elevation: 10.0,
              child:  new InkWell(
                onTap: (()=>print('tap grille')),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Text('activite', style :new TextStyle(color: Colors.teal, fontSize: 15.0)),
                    new Icon(mesActivites[i].icon,color:Colors.teal, size:40.0),
                    new Text(mesActivites[i].nom, style: new TextStyle(color: Colors.teal,fontSize: 20, fontStyle: FontStyle.italic))
                  ],
                ),
              )
              ,
            ),
          );
        });
  }

  Widget Liste() {
  return  new ListView.builder(
        itemCount: mesActivites.length,
        itemBuilder: (context,i) {
          Activite activite = mesActivites[i];
          String key =  activite.nom;
          return  new Dismissible(key: new Key(key),
            child: new Container(
              padding: EdgeInsets.all(5.0),
              height: 125,
              child: new Card(
                  elevation:7.5,
                  child: new InkWell(
                      onTap: (()=> print("appuyer")),
                      onLongPress: (()=>print("appuyer longtemps")),
                      onDoubleTap: (()=> print("appuyer deux fois")),
                      child: new Container(
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            new Icon(activite.icon, color: Colors.grey,size: 75.0,),
                            new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text("activite", style: new TextStyle(color: Colors.teal,fontSize: 20.0),),
                                new Text(activite.nom,style: new TextStyle(color: Colors.teal[700], fontSize: 30.0))
                              ],
                            )
                          ],
                        ),)
                  )
              ),
            ),
            /**exemple avec un ListTile*/
//                child: new ListTile(
//                  title: new Text("Activite: ${activite.nom}"),
//                  trailing: new Icon(activite.icon),
//                  leading: new Icon(activite.icon),
//                ),
            background: new Container(
              padding: EdgeInsets.only(right: 20.0),
              color : Colors.red,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new Text("Supprimer ",style: new TextStyle(color: Colors.white),),
                  new Icon(Icons.delete)
                ],
              ),
            ),
            onDismissed: (direction) {
              setState(() {
                print(activite.nom);
                mesActivites.removeAt(i);
              });
            },
          );
        }) ;
  }
}


class Activite {
  String nom;
  IconData icon;
  Activite(String nom, IconData icon) {
    this.nom = nom;
    this.icon = icon ;
  }
}
