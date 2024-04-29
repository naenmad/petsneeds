import 'package:flutter/material.dart';
import 'package:petsneeds/color.dart';
import 'package:petsneeds/official.dart';
import 'package:petsneeds/notif.dart';
import 'package:petsneeds/cart.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
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

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  int sisaBarang = 20;
  int totalBarang = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBgColor,
      appBar: TopNav(),
      drawer: AppDrawer(),
      body: ListView(
        children: <Widget>[
          HelloName(),
          TodayNeeds(),
          HeroBanner(),
          FlashsaleBanner(),
          Product()
        ],
      ),
      bottomNavigationBar: BotNavHome(),
    );
  }

  Row FlashsaleBanner() {
    return Row(
      children: [
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(top: 10, left: 10),
            child: Text("FLASHSALE",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
        Spacer(), // Menambahkan Spacer di sini
        Align(
          alignment: Alignment.center,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: tdRed, // Warna background merah
              borderRadius: BorderRadius.circular(10), // Membuat sudut bulat
            ),
            child: Text(
              "00:00:00", // Waktu flashsale
              style: TextStyle(
                color: Colors.white, // Warna teks putih
              ),
            ),
          ),
        ),
        Spacer(), // Menambahkan Spacer di sini
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(top: 10, right: 10),
            child: Text("Lihat Semua",
                style: TextStyle(
                  fontSize: 15,
                  color: tdBlue,
                )),
          ),
        ),
      ],
    );
  }

  Widget Product() {
    return Container(
      height: 260,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              width: 150,
              child: Column(
                children: <Widget>[
                  Image.network(
                    'https://wagtailpetsupplies-static.myshopblocks.com/images/2019/01/contain/2048x2048/656ac5add0cfbb6a66df86bb838f0605.jpg',
                    width: 150,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Whiskas',
                        style: TextStyle(
                          color: tdBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5,
                        ),
                        decoration: BoxDecoration(
                          color: tdRed,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          'Diskon 50%',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    child: Text(
                      'Makanan Kucing',
                      style: TextStyle(
                        color: tdGrey,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Text(
                    'Rp50.000,00',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    'Rp75.000,00',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: tdGrey,
                      decoration: TextDecoration.lineThrough,
                      fontSize: 10,
                    ),
                  ),
                  LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Stack(
                          children: <Widget>[
                            SizedBox(
                              width: constraints.maxWidth *
                                  0.8, // 80% of maximum width
                              child: LinearProgressIndicator(
                                value: sisaBarang /
                                    totalBarang, // replace with actual value
                                backgroundColor: tdGrey,
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(tdRed),
                              ),
                            ),
                            // Text widget has been removed
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Padding BotNavHome() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0),
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });

          switch (index) {
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Official()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Notif()),
              );
              break;
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

  Container HeroBanner() {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image.asset('assets/images/banner.png'),
      ),
    );
  }

  Padding TodayNeeds() {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Text(
        "Butuh apa anabulmu?",
        style: TextStyle(
          fontSize: 17,
        ),
      ),
    );
  }

  Padding HelloName() {
    return Padding(
      padding: EdgeInsets.only(top: 10, left: 10),
      child: Text(
        "Halo Zulkarnaen,",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
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
