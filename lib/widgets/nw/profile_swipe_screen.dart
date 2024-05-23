import 'package:flutter/material.dart';
import 'package:lovepet/widgets/nw/dog_card.dart';
class ProfileSwipeScreen extends StatefulWidget {
  @override
  _ProfileSwipeScreenState createState() => _ProfileSwipeScreenState();
}

class _ProfileSwipeScreenState extends State<ProfileSwipeScreen> {
  List<Dog> dogs = [  // Cambia el tipo de dato de String a Dog
    Dog(
      dogName: 'Fido',
      dogBreed: 'Golden Retriever',
      dogAge: '3',
      dogGender: 'Masculino',
      dogImage: 'assets/protectora2.jpg',
      userName: 'Karla',
      userImage: 'assets/shop.jpg',
    ),
    Dog(
      dogName: 'Rex',
      dogBreed: 'Labrador',
      dogAge: '5',
      dogGender: 'Masculino',
      dogImage: 'assets/login.png',
      userName: 'Daniel',
      userImage: 'assets/shop.jpg',
    ),
    // Agrega más objetos Dog según sea necesario
  ];
  Color? overlayColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Color overlay
          if (overlayColor != null)
            Positioned.fill(
              child: Container(
                color: overlayColor,
              ),
            ),
          // Draggable dog cards
          dogs.isEmpty
              ? Center(child: Text('No hay más perros')) // Actualiza el mensaje
              : Stack(
                  children: dogs.map((dog) {
                    return Draggable(
                      key: Key(dog.dogName), // Usa el nombre del perro como clave
                      child: DogCard(  // Usa DogCard en lugar de ProfileCard
                        dogName: dog.dogName,
                        dogBreed: dog.dogBreed,
                        dogAge: dog.dogAge,
                        dogGender: dog.dogGender,
                        dogImage: dog.dogImage,
                        userName: dog.userName,
                        userImage: dog.userImage,
                      ),
                      feedback: Material(
                        type: MaterialType.transparency,
                        child: DogCard(  // También aquí
                          dogName: dog.dogName,
                          dogBreed: dog.dogBreed,
                          dogAge: dog.dogAge,
                          dogGender: dog.dogGender,
                          dogImage: dog.dogImage,
                          userName: dog.userName,
                          userImage: dog.userImage,
                        ),
                      ),
                      childWhenDragging: Container(),
                      onDragUpdate: (details) {
                        setState(() {
                          if (details.delta.dx > 0) {
                            overlayColor = Colors.green.withOpacity(0.8);
                          } else {
                            overlayColor = Colors.red.withOpacity(0.8);
                          }
                        });
                      },
                      onDragEnd: (details) {
                        setState(() {
                          if (details.offset.dx > 0) {
                            // Deslizó a la derecha
                            print('Matched: ${dog.dogName}');
                          } else {
                            // Deslizó a la izquierda
                            print('Rejected: ${dog.dogName}');
                          }
                          dogs.remove(dog);
                          overlayColor = null;
                        });
                      },
                    );
                  }).toList(),
                ),
        ],
      ),
    );
  }
}

class Dog {  // Define la clase Dog
  final String dogName;
  final String dogBreed;
  final String dogAge;
  final String dogGender;
  final String dogImage;
  final String userName;
  final String userImage;

  Dog({
    required this.dogName,
    required this.dogBreed,
    required this.dogAge,
    required this.dogGender,
    required this.dogImage,
    required this.userName,
    required this.userImage,
  });
}
