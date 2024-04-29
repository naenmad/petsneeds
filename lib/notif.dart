import 'package:flutter/material.dart';
import 'color.dart';
import 'home.dart';
import 'official.dart';
import 'cart.dart';

class Notif extends StatefulWidget {
  const Notif({Key? key}) : super(key: key);

  @override
  _OfficialState createState() => _OfficialState();
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 170,
            child: DrawerHeader(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(
                        'https://popularbio.com/wp-content/uploads/2020/05/Johnny-Sins.jpg'), // replace with your image URL
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Ahmad Zulkarnaen',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors
                                    .white)), // replace with your username
                        Text('Rp 690.000,00',
                            style: TextStyle(
                                fontSize: 14,
                                color:
                                    Colors.white)), // replace with your balance
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {
                      // Handle your settings button tap here.
                    },
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: tdBlue,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Pesanan Saya'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Daftar Keinginan'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Bantuan dan Dukungan'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class _OfficialState extends State<Notif> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: tdBgColor,
        appBar: TopNav(),
        body: ListView(
          children: <Widget>[
            NotifText(),
          ],
        ),
        bottomNavigationBar: BotNavNotif(),
      ),
    );
  }

  Padding NotifText() {
    return Padding(
      padding: EdgeInsets.only(top: 10, left: 10),
      child: Text(
        "Notification Page",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Padding BotNavNotif() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0),
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });

          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Official()),
              );
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Cart()),
              );
              break;
            // Add more cases for other navbar items if needed
          }
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: tdBlue,
        unselectedItemColor: tdGrey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 25),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box_rounded, size: 25),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, size: 25),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, size: 25),
            label: '',
          ),
        ],
      ),
    );
  }

  AppBar TopNav() {
    return AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              size: 30,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),
      backgroundColor: tdBgColor,
      title: Expanded(
        child: Container(
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              hintText: 'Cari disini',
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
