import 'package:flutter/material.dart';
import 'package:lovepet/widgets/bottomnavigationbar_widget.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  int $selectedIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;


    return Scaffold(
      appBar: AppBar(
        title: const Text("LovePet"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/', (route) => false);
            },
            icon: const Icon(Icons.exit_to_app),
          )
        ],
      ),
      bottomNavigationBar: WgBottomNavigationBar(
        selectedIndex: $selectedIndex,
        tapFunction: (valorSeleccionado) {
          setState(() {
            $selectedIndex = valorSeleccionado;
          });
        },
        listElements: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: colors.secondary,
            ),
            activeIcon: Icon(
              Icons.ac_unit,
              color: colors.primary,
            ),
            label: "Home",
            backgroundColor: colors.inversePrimary,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.hail_outlined,
              color: colors.secondary,
            ),
            activeIcon: Icon(
              Icons.hail,
              color: colors.primary,
            ),
            label: "Dates",
            backgroundColor: colors.inversePrimary,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.map_outlined,
              color: colors.secondary,
            ),
            activeIcon: Icon(
              Icons.map,
              color: colors.primary,
            ),
            label: "Maps",
            backgroundColor: colors.inversePrimary,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              color: colors.secondary,
            ),
            activeIcon: Icon(
              Icons.add,
              color: colors.primary,
            ),
            label: "Add publication",
            backgroundColor: colors.inversePrimary,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_home_outlined,
              color: colors.secondary,
            ),
            activeIcon: Icon(
              Icons.add_home,
              color: colors.primary,
            ),
            label: "Adoption",
            backgroundColor: colors.inversePrimary,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.my_location_outlined,
              color: colors.secondary,
            ),
            activeIcon: Icon(
              Icons.my_location,
              color: colors.primary,
            ),
            label: "Location",
            backgroundColor: colors.inversePrimary,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.perm_contact_cal_outlined,
              color: colors.secondary,
            ),
            activeIcon: Icon(
              Icons.perm_contact_cal,
              color: colors.primary,
            ),
            label: "Perfil",
            backgroundColor: colors.inversePrimary,
          ),
        ],
      ),
    );
  }
}
