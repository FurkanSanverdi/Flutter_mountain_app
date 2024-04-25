import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State
{
  TextEditingController _searchController = TextEditingController();
  List<String> _places = [
    "Paris",
    "New York",
    "London",
    "Tokyo",
    "Rome",
    "Istanbul",
    "Sydney",
    "Dubai",
    "Barcelona",
    "Berlin",
    "Amsterdam",
    "Rio de Janeiro",
  ];
  List<String> _filteredPlaces = [];

  @override
  void initState() {
    super.initState();
    _filteredPlaces.addAll(_places);
  }

  void _filterPlaces(String query) {
    query = query.toLowerCase();
    setState(() {
      _filteredPlaces = _places.where((place) => place.toLowerCase().contains(query)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: _filterPlaces,
              decoration: InputDecoration(
                labelText: "Search",
                hintText: "Search for a place...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredPlaces.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_filteredPlaces[index]),
                  onTap: () {
                    // Handle tap on the searched place
                    // For example, you can navigate to the details page of the place
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
