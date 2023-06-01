import 'package:flutter/material.dart';
import 'package:responsi_123200146/model/model_data.dart';
import 'package:responsi_123200146/service/base_network.dart';
import 'package:responsi_123200146/pages/detail_data_all.dart';

class DetailNasional extends StatefulWidget {
  @override
  _NasionalState createState() => _NasionalState();
}

class _NasionalState extends State<DetailNasional> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CNN NASIONAL'),
      ),
      body: Container(
        child: FutureBuilder(
          future: BaseNetwork.get('nasional'),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              ListNewsModel berita = ListNewsModel.fromJson(snapshot.data);
              return ListView.builder(
                itemCount: berita.data!.posts!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailBerita(
                                title: berita.data!.posts![index].title!,
                                pubDate: berita.data!.posts![index].pubDate!,
                                thumbnail:
                                    berita.data!.posts![index].thumbnail!,
                                description:
                                    berita.data!.posts![index].description!,
                                link: berita.data!.posts![index].link!,
                              ),
                            ));
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            '${berita.data!.posts![index].thumbnail!.toLowerCase()}',
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.error),
                          ),
                          Expanded(
                            child: Container(
                                padding:
                                    EdgeInsets.only(left: 7, right: 7, top: 10),
                                child: Text(
                                  berita.data!.posts![index].title!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                )),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Container(
                child: Center(
                  child: Text('Data tidak ditemukan'),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
