import 'package:flutter/material.dart';
import 'package:lovepet/constants.dart';
import 'package:lovepet/services/router.dart';

import 'establecimientos_card.dart';
import 'protectoras_card.dart';

class AccounsScreen extends StatefulWidget {
  const AccounsScreen({super.key});

  @override
  State<AccounsScreen> createState() => _AccounsScreenState();
}

class _AccounsScreenState extends State<AccounsScreen> {
  @override
  Widget build(BuildContext context) {
    AnimateRouter $route = AnimateRouter();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tipo de cuenta',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: kPrimaryColor,
          ),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                $route.createRoute("/login"), (route) => false);
          },
        ),
      ),
      backgroundColor: Color(0xFFEDECF2),
      body: Container(
        padding: const EdgeInsets.only(top: 5),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EstablecimientoCard(),
              ProtectoraCard(),
            ],
          ),
        ),
      ),
    );
  }
}
