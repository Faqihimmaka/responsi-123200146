import 'package:flutter/material.dart';
import 'package:responsi_123200146/model/model_terbaru.dart';
import 'package:responsi_123200146/service/base_network.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Terbaru extends StatefulWidget {
  String title;
  Terbaru({Key? key, required this.title}) : super(key: key);

  @override
  State<Terbaru> createState() => _TerbaruPageState();
}

class _TerbaruPageState extends State<Terbaru> {
  Future<void> _setLastOpen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('last_open', widget.title);
    prefs.setString('code', 'characters');
  }

  @override
  void initState() {
    super.initState();
    _setLastOpen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text(
              "Detail ${widget.title[0].toUpperCase()}${widget.title.substring(1).toLowerCase()}"),
        ),
        body: FutureBuilder(
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (!snapshot.hasData) {
              return Container(
                child: Center(
                  child: Text("Tidak ada data"),
                ),
              );
            } else {
              ListNewsModel karakter = snapshot.data;
              return SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://api-berita-indonesia.vercel.app/cnn/terbaru'),
                                fit: BoxFit.cover)),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 3,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'hhttps://api-berita-indonesia.vercel.app/cnn'),
                                  fit: BoxFit.cover),
                            ),
                            height: 50,
                            width: 50,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ));
  }
}
