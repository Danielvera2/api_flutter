import 'package:api_rick/rick_and_morty_api_service.dart';
import 'package:flutter/material.dart';

class CharacterDetailsPage extends StatefulWidget {
  final int id;

  const CharacterDetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  _CharacterDetailsPageState createState() => _CharacterDetailsPageState();
}

class _CharacterDetailsPageState extends State<CharacterDetailsPage> {
  final RickAndMortyApiService _rickAndMortyApiService = RickAndMortyApiService();
  Map<String, dynamic> _character = {};

  @override
  void initState() {
    super.initState();
    _getCharacterDetails();
  }

  Future<void> _getCharacterDetails() async {
    final data = await _rickAndMortyApiService.get('/character/${widget.id}');
    setState(() {
      _character = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_character['name'] ?? ''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(_character['image'] ?? ''),
            SizedBox(height: 16.0),
            Text('Name: ${_character['name'] ?? ''}'),
            Text('Status: ${_character['status'] ?? ''}'),
            Text('Species: ${_character['species'] ?? ''}'),
            Text('Gender: ${_character['gender'] ?? ''}'),
            Text('Origin: ${_character['origin']['name'] ?? ''}'),
            Text('Location: ${_character['location']['name'] ?? ''}'),
            SizedBox(height: 16.0),
            
          ],
        ),
      ),
    );
  }
}