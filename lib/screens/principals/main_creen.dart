import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lovepet/constants.dart';
import 'package:lovepet/screens/principals/adopciones_screen.dart';
import 'package:lovepet/screens/principals/consejos_screen.dart';
import 'package:lovepet/screens/principals/extravio_screen.dart';
import 'package:lovepet/screens/principals/home_screen.dart';
import 'package:badges/badges.dart' as badges;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  int myCurrentIndex = 0;

  late PageController _pageViewController;
  late TabController _tabController;

  // Lista de paginas
  final List<Widget> pages = [
    const Home(),
    Container(color: Colors.red),
    Container(color: Colors.purple),
    Container(color: Colors.orange),
    const Extravio(),
    const Adopciones(),
    const Consejos(),
  ];

  // Lista de títulos
  final List<String> titles = [
    'Home',
    'Match',
    'Mapa',
    'Publicar',
    'Extravios',
    'Adopciones',
    'Consejos'
  ];
  @override
  void initState() {
    _pageViewController = PageController(
      initialPage: 0,
    );

    _tabController = TabController(
      length: pages.length,
      vsync: this,
      initialIndex: myCurrentIndex,
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  void _handlePageViewChanged(int? currentPageIndex) {
    if (currentPageIndex == null) return;
    if (!(currentPageIndex < pages.length)) return;
    setState(() {
      _tabController.index = currentPageIndex;
      myCurrentIndex = currentPageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leadingWidth: 55,
          bottomOpacity: 0.45,
          backgroundColor: Theme.of(context).colorScheme.onSecondary,
          leading: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
            child: Container(
              margin: EdgeInsets.all(10),
              child: Image.network(
                "https://cdn-icons-png.flaticon.com/512/3541/3541871.png",
                width: 30,
                height: 30,
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            titles[myCurrentIndex],
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: kPrimaryColor,
            ),
          ),
          centerTitle: true,
          actions: [
            badges.Badge(
              position: badges.BadgePosition.topEnd(top: 0, end: 3),
              badgeStyle: badges.BadgeStyle(
                badgeColor: Colors.red,
                padding: EdgeInsets.all(5),
                borderRadius: BorderRadius.circular(12),
              ),
              badgeContent: const Text(
                "3",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                ),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.notifications_none_outlined,
                  color: kPrimaryColor,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/carritoProductos");
                },
              ),
            ),
          ],
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageViewController,
          onPageChanged: _handlePageViewChanged,
          children: pages,
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.black38, blurRadius: 30, offset: Offset(0, 20)),
          ]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BottomNavigationBar(
              selectedItemColor: kPrimaryColor,
              unselectedItemColor: Colors.grey,
              currentIndex: myCurrentIndex,
              iconSize: 30,
              selectedFontSize: 12,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              items: [
                const BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined), label: 'Home'),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_border), label: 'Match'),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.place_outlined), label: 'Mapa'),
                BottomNavigationBarItem(
                  icon: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(CupertinoIcons.plus,
                        size: 30, color: kPrimaryColor),
                  ),
                  label: 'Publicar',
                  activeIcon: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(CupertinoIcons.plus,
                        size: 35, color: kPrimaryColor),
                  ),
                ),
                const BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.map_pin_ellipse),
                    label: 'Extravios'),
                const BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.paw), label: 'Adopciones'),
                const BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.lightbulb), label: 'Consejos'),
              ],
              onTap: (myNewCurrent) {
                setState(() {
                  myCurrentIndex = myNewCurrent;
                  _pageViewController.animateToPage(
                    myNewCurrent,
                    duration: Duration(seconds: 1),
                    curve: Curves.decelerate,
                  );
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
