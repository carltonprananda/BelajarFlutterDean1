part of 'pages.dart';

class MainMenu extends StatefulWidget {
  MainMenu({Key key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[AddPage(),DataPage(),AccountPage()];

  void _onItemtapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
         child: _widgetOptions.elementAt(_selectedIndex),
       ),
       bottomNavigationBar:BottomNavigationBar( 
        items: const <BottomNavigationBarItem>[
           BottomNavigationBarItem(
             icon: Icon(Icons.add_circle_outline_rounded),
             label: 'Add Data'),
           BottomNavigationBarItem(
             icon: Icon(Icons.add_circle_outline_rounded),
             label: 'List Data'),
           BottomNavigationBarItem(
             icon: Icon(Icons.add_circle_outline_rounded),
             label: 'My Data'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.blue,
        onTap: _onItemtapped,
          ),
    );
  }
}