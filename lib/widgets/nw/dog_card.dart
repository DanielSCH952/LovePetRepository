import 'package:flutter/material.dart';
import 'package:lovepet/widgets/nw/text_big.dart';
import 'package:lovepet/widgets/nw/text_median.dart';
import 'package:lovepet/widgets/wg/profile_avatar.dart';

class DogCard extends StatefulWidget {
  final String dogName;
  final String dogBreed;
  final String dogAge;
  final String dogGender;
  final String dogImage;
  final String userName;
  final String userImage;

  const DogCard({
    Key? key,
    required this.dogName,
    required this.dogBreed,
    required this.dogAge,
    required this.dogGender,
    required this.dogImage,
    required this.userName,
    required this.userImage,
  }) : super(key: key);

  @override
  _DogCardState createState() => _DogCardState();
}

class _DogCardState extends State<DogCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        //margin: EdgeInsets.all(16.0),
        child: Container(
          width: 380,
          height: 750,
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                child: Image.asset(
                  widget.dogImage,
                  height: 300.0,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextBig(text: widget.dogName),
                    SizedBox(height: 8.0),
                    TextMedian(text: widget.dogBreed),
                    SizedBox(height: 8.0),
                    TextMedian(text: '${widget.dogAge} años'),
                    SizedBox(height: 8.0),
                    TextMedian(text: widget.dogGender),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        ProfileAvatar(),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "nombre",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(20),
                          ),
                          onPressed: () {
                            // Acción del botón rojo
                          },
                          child: Icon(Icons.close, color: Colors.white),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(20),
                          ),
                          onPressed: () {
                            // Acción del botón verde
                          },
                          child: Icon(Icons.favorite, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
