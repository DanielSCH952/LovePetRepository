import 'package:flutter/material.dart';
import 'package:lovepet/widgets/wg/extravio_container.dart';

class Extravio extends StatelessWidget {
  const Extravio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 15),
        // decoration: const BoxDecoration(
        //   color: Color(0xFFEDECF2),
        // ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ExtravioContainer(),
              ExtravioContainer(),
              // ExtravioContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
