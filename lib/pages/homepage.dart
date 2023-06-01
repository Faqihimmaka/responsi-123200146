import 'package:flutter/material.dart';
import 'package:responsi_123200146/pages/detail_terbaru.dart';
import 'package:responsi_123200146/pages/detail_olahraga.dart';
import 'package:responsi_123200146/pages/detail_teknologi.dart';
import 'package:responsi_123200146/pages/detail_nasional.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              child: Image.network(
                'https://cdn.cnnindonesia.com/cnnid/images/logo_cnn_fav.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 4,
                  height: 25,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailTerbaru()));
                      },
                      child: Text('TERBARU')),
                ),
                SizedBox(width: 20),
                Container(
                  width: MediaQuery.of(context).size.width / 4,
                  height: 25,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailNasional()));
                      },
                      child: Text('NASIONAL')),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 4,
                  height: 25,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailOlahraga()));
                      },
                      child: Text('OLAHRAGA')),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 4,
                  height: 25,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailTeknologi()));
                      },
                      child: Text(
                        'TEKNOLOGI',
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
