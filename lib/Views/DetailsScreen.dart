import 'package:flutter/material.dart';
import '../Models/Post.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatelessWidget {
  final Post post;
  DetailsScreen({required this.post});

  var imageURL = '';
  // find character and set URL of image to be loaded
  _getImage() {
    var character = post.name;
    switch (character) {
      case 'Luke Skywalker':
        imageURL =
            'https://static.wikia.nocookie.net/disney/images/f/fb/Profile_-_Luke_Skywalker.png/revision/latest?cb=20190313094501';
      case 'C-3PO':
        imageURL =
            'https://static.wikia.nocookie.net/disney/images/c/cc/Profile_-_C-3PO.jpg/revision/latest?cb=20200418144012';
      case 'R2-D2':
        imageURL =
            'https://static.wikia.nocookie.net/disney/images/e/e9/Profile_-_R2-D2.jpg/revision/latest?cb=20200418144202';
      case 'Darth Vader':
        imageURL =
            'https://static.wikia.nocookie.net/disney/images/8/80/Profile_-_Darth_Vader.png/revision/latest?cb=20231007104715';
      case 'Leia Organa':
        imageURL =
            'https://static.wikia.nocookie.net/disney/images/0/07/Profile_-_Leia_Organa.png/revision/latest?cb=20190313132336';
      case 'Owen Lars':
        imageURL =
            'https://static.wikia.nocookie.net/disney/images/1/12/Uncle_Owen.jpg/revision/latest/scale-to-width-down/1032?cb=20190728034150';
      case 'Beru Whitesun lars':
        imageURL =
            'https://static.wikia.nocookie.net/disney/images/9/9b/Berulars.jpg/revision/latest?cb=20191024001044';
      case 'R5-D4':
        imageURL =
            'https://static.wikia.nocookie.net/starwars/images/3/3f/R5D4-AG.png/revision/latest?cb=20230317020800';
      case 'Biggs Darklighter':
        imageURL =
            'https://static.wikia.nocookie.net/starwars/images/0/00/BiggsHS-ANH.png/revision/latest?cb=20130305010406';
      case 'Obi-Wan Kenobi':
        imageURL =
            'https://static.wikia.nocookie.net/disney/images/e/eb/Profile_-_Obi-Wan_Kenobi.jpg/revision/latest?cb=20220611143255';
      default:
        imageURL =
            'https://static.wikia.nocookie.net/disney/images/3/31/Star_Wars_Logo.svg.png/revision/latest?cb=20130609183807';
    }
  }

  @override
  Widget build(BuildContext context) {
    _getImage();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text(post.name),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.lightBlue, Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 400,
                width: double.infinity,
                child: Image.network(
                  imageURL,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 10),
              Text(
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  '${post.name}'),
              Text(style: TextStyle(fontSize: 14), 'Gender: ${post.gender}'),
              Text(
                  style: TextStyle(fontSize: 14),
                  'Height (cm): ${post.height}'),
              Text(style: TextStyle(fontSize: 14), 'Mass (kg): ${post.mass}'),
              Text(
                  style: TextStyle(fontSize: 14),
                  'Skin Color: ${post.skinColor}'),
              Text(
                  style: TextStyle(fontSize: 14),
                  'Hair Color: ${post.hairColor}'),
              Text(
                  style: TextStyle(fontSize: 14),
                  'Eye Color: ${post.eyeColor}'),
              Text(
                  style: TextStyle(fontSize: 14),
                  'Birth Year: ${post.birthYear}'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Return to items list'),
        ),
      ),
    );
  }
}
