import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:wisata_candi_celline/models/candi.dart';

class DetailScreen extends StatelessWidget {
  final Candi candi;
  const DetailScreen({super.key, required this.candi});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          //DetailHeader
          //DetailInfo
          //DetailGallery
        ],
      )
    );
  }
}