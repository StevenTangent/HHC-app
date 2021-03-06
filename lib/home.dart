import 'package:demo/AssessmentPage.dart';
import 'package:demo/MailPage.dart';
import 'package:demo/MePage.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = 'demo';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: _title,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  //boolean health from Submitted widget
  final bool isHealth;

  Home({Key key,this.isHealth}) : super (key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  String titleName = "Assessment";
  static var healthStatus = 'Unknown';

  List createList() {
    //Check if user has submitted an assessment
    if(widget.isHealth != null){//If there is data
      widget.isHealth? healthStatus ='Healthy' : healthStatus = 'Unhealthy';
    }
    //List of pages from bottom navigation bar
    var _page = [new AssessmentPage(healthStatus: healthStatus),
      new mailPage(),
      new MePage()];
    return _page;
  }
  //List of pages from bottom navigation bar
  var _page = [new AssessmentPage(),new mailPage(),new MePage()];

  //Tapped on bottom navigation bar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body:createList()[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment,size: 40,),
            title: Text('assessment'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_outline,size: 40,),
            title: Text('mail'),

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline,size: 40,),
            title: Text('person'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}