///Assalamualaikum vaiay here is my code ,I am using here Wrap widget ,buttons, images, and captions and network image etc more
import 'package:flutter/material.dart';

void main() {
  runApp(PhotoGalleryApp());
}

class PhotoGalleryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Gallery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: PhotoGalleryPage(),
    );
  }
}

class PhotoGalleryPage extends StatelessWidget {
  final List<String> samplePhotos = [
    'https://www.gardaoto.com/wp-content/uploads/2022/06/Mengenal-Mobil-BMW-Beserta-Jenis-dan-Spesifikasinya.jpg',
    'https://play-lh.googleusercontent.com/ahRgGiY0KWSE36ivzs7U642H8wxmZt5qsXa7Utr5am_VTtpHSChWH6URzDetDhRI7zU',
    'https://wallpaperaccess.com/full/1601064.jpg',
    'https://cdn.wallpapersafari.com/99/50/XTomrZ.jpg',
    'https://static.carthrottle.com/workspace/uploads/posts/2015/08/48b93271-b023-498d-8318-312bf7d1e49b.jpg',
    'https://e1.pxfuel.com/desktop-wallpaper/205/680/desktop-wallpaper-bmw-e30-m3-backgrounds-e30-aesthetic.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: const Text(
                'Welcome to My Photo Gallery!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: const TextField(
                decoration: InputDecoration(
                  labelText: 'Search',
                  hintText: 'Enter search term',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: samplePhotos.map((photoUrl) {
                return ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Clicked on image!')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(photoUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.black54,
                        child: const Text(
                          'Caption',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                ListTile(
                  leading: Icon(Icons.photo),
                  title: Text(' Photo 1'),
                  subtitle: Text(' Car Logo'),
                ),
                ListTile(
                  leading: Icon(Icons.photo),
                  title: Text(' Photo 2'),
                  subtitle: Text('Drift car'),
                ),
                ListTile(
                  leading: Icon(Icons.photo),
                  title: Text(' Photo 3'),
                  subtitle: Text('Racing car'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Photos Uploaded Successfully!')),
          );
        },
        child: const Icon(Icons.cloud_upload),
      ),
    );
  }
}
///May allah bless you Ameen^^
