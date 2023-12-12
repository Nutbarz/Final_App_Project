import 'package:flutter/material.dart';
import 'package:mobile_final/main.dart';
import '../ApiService.dart';
import '../Models/Post.dart';
import 'DetailsScreen.dart';

class StarWarsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Final Part 2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StarWarsHomePage(),
    );
  }
}

class StarWarsHomePage extends StatefulWidget {
  @override
  _StarWarsHomePageState createState() => _StarWarsHomePageState();
}

class _StarWarsHomePageState extends State<StarWarsHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ApiService apiService =
      ApiService(apiUrl: 'https://swapi.dev/api/people/');
  late Future<List<Post>> futurePosts;

  @override
  void initState() {
    super.initState();
    futurePosts = apiService.getPosts();
  }

  void _reloadData() {
    setState(() {
      futurePosts = apiService.getPosts();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Items reloaded'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('Star Wars Characters'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (BuildContext context) => MyApp()),
              (Route<dynamic> route) => false,
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh_outlined),
            onPressed: () {
              _reloadData();
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade800, Colors.blue.shade300],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<List<Post>>(
                future: futurePosts,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    List<Post> posts = snapshot.data!;
                    return ListView.builder(
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            _navigateToDetailsPage(context, posts[index]);
                          },
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            padding: EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: Colors.lightBlueAccent,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: ListTile(
                              title: Text(
                                  style: TextStyle(fontSize: 20),
                                  posts[index].name),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Gender: ${posts[index].gender}'),
                                  Text('Skin Color: ${posts[index].skinColor}'),
                                  Text('Hair Color: ${posts[index].hairColor}'),
                                  Text('Eye Color: ${posts[index].eyeColor}'),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // navigate to details screen
  void _navigateToDetailsPage(BuildContext context, Post post) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DetailsScreen(post: post),
      ),
    );
  }
}
