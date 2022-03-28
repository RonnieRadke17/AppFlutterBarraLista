import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawer and Navigation',
      theme: ThemeData(backgroundColor: Colors.red, primarySwatch: Colors.red //color iconos

          ),
      home: MyHomePage(),
    );
  }
}

final List<Widget> widgets = [
  ListTile(
    title: Text("hola"),
  ),
  Text("valor 1"),
  Text("valor 2")
];
final List<String> materias = [
  "Español",
  "Matematicas",
  "Ciencias",
  "Historia",
  "Geografia",
  "Fisica",
  "Base de datos",
  "P orientada a eventos",
  "Frontend"
];
final List<String> calificaciones = [
  "Español: 10",
  "Matematicas: 9",
  "Ciencias: 8",
  "Historia: 7",
  "Geografia: 8",
  "Fisica: 7",
  "Base de datos: 10",
  "P orientada a eventos: 10",
  "Frontend: 10"
];
final List<String> asistencias = [
  "Español: 20/20",
  "Matematicas: 19/20",
  "Ciencias: 8/10",
  "Historia: 4/6",
  "Geografia: 12/14",
  "Fisica: 7/10",
  "Base de datos: 10/10",
  "P orientada a eventos: 10/10",
  "Frontend: 10/10"
];
final List<String> observaciones = [
  "Español: Exelente!!",
  "Matematicas: Muy bien!!",
  "Ciencias: Bien!!",
  "Historia: Bien!!",
  "Geografia: Bien!!",
  "Fisica: Regular",
  "Base de datos: Exelente!!",
  "Poe Exelente!!",
  "Frontend: Exelente!!"
];

class MyHomePage extends StatefulWidget {
  final List<Page> _pages = [
    Page('Materias', materias, Icons.home),
    Page('Calificaciones', calificaciones, Icons.feedback),
    Page('Asistencias', asistencias, Icons.person_outline),
    Page('Observaciones', observaciones, Icons.person_outline)
  ];

  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //codigo de la barra
  int _currentPageIndex = 0;

  void _openPage(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerItemWidgets = widget._pages
        .asMap()
        .map((int index, Page page) => MapEntry<int, Widget>(
            index,
            ListTile(
              title: Text(page.title),
              leading: Icon(page.iconData),
              selected: _currentPageIndex == index,
              onTap: () {
                _openPage(index);
                Navigator.pop(context);
              },
            )))
        .values
        .toList();
    drawerItemWidgets.insert(
      0,
      DrawerHeader(
        child: Text('Drawer Header'),
        decoration: BoxDecoration(
          color: Colors.red,
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Navigation Bar and Drawer Page"),
      ),
      //body: Center(//body del archivo siuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu
      //child: Text(widget._pages[_currentPageIndex].ejemplo),
      //),//desde aqui va el codigo
      body: Container(
        child: ListView.builder(
          itemBuilder: (_, index) => listDataItem(widget._pages[_currentPageIndex].prueba[index]),
          itemCount: widget._pages[_currentPageIndex].prueba.length,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: drawerItemWidgets,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        items: widget._pages
            .map((Page page) => BottomNavigationBarItem(
                  icon: Icon(page.iconData),
                  label: page.title, //barra de navegacion
                  backgroundColor: Colors.red,
                ))
            .toList(),
        onTap: _openPage,
      ),
    );
  }
}

class Page {
  final String title;
  //List<Widget> widgets;
  List<String> prueba;
  final IconData iconData;
  Page(this.title, this.prueba, this.iconData);
}

class listDataItem extends StatelessWidget {
  String itemName;
  listDataItem(this.itemName);

  @override
  Widget build(BuildContext context) {
    return new Card(
      elevation: 6.0,
      child: new Container(
        margin: EdgeInsets.all(7.0),
        padding: EdgeInsets.all(6.0),
        child: new Row(
          children: <Widget>[
            new CircleAvatar(
              //esto pone la letra de color azul
              child: new Text(itemName[0]),
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
            ),
            new Padding(padding: EdgeInsets.all(8.0)),
            new Text(
              itemName,
              style: TextStyle(fontSize: 20.0),
            )
          ],
        ),
      ),
    );
  }
}

//código después el de la lista
class lista extends State<MyHomePage> {
  int _currentPageIndex = 0;

  void _openPage(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerItemWidgets = widget._pages
        .asMap()
        .map((int index, Page page) => MapEntry<int, Widget>(
            index,
            ListTile(
              title: Text(page.title),
              leading: Icon(page.iconData),
              selected: _currentPageIndex == index,
              onTap: () {
                _openPage(index);
                Navigator.pop(context);
              },
            )))
        .values
        .toList();
    drawerItemWidgets.insert(
      0,
      DrawerHeader(
        child: Text('Drawer Header'),
        decoration: BoxDecoration(
          color: Colors.red,
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Navigation Bar and Drawer Page"),
      ),
      body: Center(
        child: Text(widget._pages[_currentPageIndex].title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: drawerItemWidgets,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        items: widget._pages
            .map((Page page) => BottomNavigationBarItem(
                  icon: Icon(page.iconData),
                  label: page.title,
                  //label: page.ejemplo,
                  backgroundColor: Colors.red,
                ))
            .toList(),
        onTap: _openPage,
      ),
    );
  }
}

//codigo de resplado
//body: Container(
//      child: ListView(
//      children: widget._pages[_currentPageIndex].widgets,

//  ),
// ),
