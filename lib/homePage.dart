import 'package:flutter/material.dart';
import 'package:api_rick/rick_and_morty_api_service.dart';

import 'details.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final RickAndMortyApiService _rickAndMortyApiService = RickAndMortyApiService();
  List<dynamic> _characters = [];

  @override
  void initState() {
    super.initState();
    _getCharacters();
  }

  Future<void> _getCharacters() async {
    final data = await _rickAndMortyApiService.get('/character');
    setState(() {
      _characters = data['results'];
    });
  }

  void _showCharacterDetails(int id) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CharacterDetailsPage(id: id),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rick and Morty App'),
      ),
      body: ListView.builder(
        itemCount: _characters.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Image.network(_characters[index]['image']),
            title: Text(_characters[index]['name']),
            subtitle: Text(_characters[index]['status']),
            onTap: () => _showCharacterDetails(_characters[index]['id']),
          );
        },
      ),
    );
  }
}