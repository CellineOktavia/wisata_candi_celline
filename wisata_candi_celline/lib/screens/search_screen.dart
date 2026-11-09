import 'package:flutter/material.dart';
import 'package:wisata_candi_celline/data/candi_data.dart';
import 'package:wisata_candi_celline/models/candi.dart';
import 'package:wisata_candi_celline/screens/detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // TODO 1. Deklarasikan variabel yang dibutuhkan
  List<Candi> _filterCandis = candiList;
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO 2. Buat appbar dengan judul Pencarian Candi
      appBar: AppBar(title: const Text('Pencarian Candi')),

      // TODO 3. Buat body berupa column
      body: Column(
        children: [
          // TODO 4. Buat TextField pencarian sebagai anak dari column
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple[50],
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: TextField(
                controller: _searchController,
                autofocus: false,
                // TODO 6. Implementasi fitur pencarian
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                    _filterCandis = candiList
                        .where(
                          (candi) =>
                              candi.name.toLowerCase().contains(
                                _searchQuery.toLowerCase(),
                              ) ||
                              candi.location.toLowerCase().contains(
                                _searchQuery.toLowerCase(),
                              ),
                        )
                        .toList();
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Cari Candi',
                  prefixIcon: const Icon(Icons.search),

                  // TODO 7. Implementasi pengosongan input
                  suffixIcon: IconButton(
                    onPressed: () {
                      _searchController.clear();
                      setState(() {
                        _searchQuery = '';
                        _filterCandis = candiList;
                      });
                    },
                    icon: const Icon(Icons.clear),
                  ),

                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.deepPurple),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12.0,
                  ),
                ),
              ),
            ),
          ),

          // TODO 5. Buat ListView hasil pencarian sebagai anak dari column
          Expanded(
            child: ListView.builder(
              itemCount: _filterCandis.length,
              itemBuilder: (context, index) {
                final candi = _filterCandis[index];
                
                // TODO 8. Implementasi GestureDetector dan Hero Animation
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(candi: candi),
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 4,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 1. Anak pertama Row: Container membungkus Hero, ClipRRect dan Image.asset
                        Container(
                          padding: const EdgeInsets.all(8),
                          width: 100,
                          height: 100,
                          child: Hero(
                            tag: candi.imageAsset, // Tag unik Hero Animation
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                candi.imageAsset,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),

                        // 2. Anak kedua Row: Column untuk teks informasi Candi
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  candi.name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  candi.location,
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
