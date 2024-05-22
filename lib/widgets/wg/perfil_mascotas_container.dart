import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lovepet/constants.dart';
import 'package:lovepet/screens/principals/perfil_mascota.dart';
import 'package:lovepet/services/router.dart';

class PerfilMascotaContainer extends StatelessWidget {
  const PerfilMascotaContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            height: 160,
            width: 160,
            margin: EdgeInsets.only(right: 15),
            child: Image.asset("assets/raccoon.png"),
          ),
          const Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Nombre del animal",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Edad: 2 años",
                    style: TextStyle(
                      fontSize: 16,
                      color: kPrimaryColor,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Género: Macho",
                    style: TextStyle(
                      fontSize: 16,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: kPrimaryColor,
              ),
              onPressed: () {
                AnimateRouter $rt = AnimateRouter();
                Navigator.of(context).push($rt.createRoute("/perfilMascota"));
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => PerfilMascota()),
                // );
              },
            ),
          ),
        ],
      ),
    );
  }
}
