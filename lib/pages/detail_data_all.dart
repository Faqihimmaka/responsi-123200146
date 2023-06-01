import 'package:flutter/material.dart';
import 'package:responsi_123200146/service/base_network.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailBerita extends StatefulWidget {
  final String title;
  final String pubDate;
  final String thumbnail;
  final String description;
  final String link;
  const DetailBerita(
      {super.key,
      required this.title,
      required this.pubDate,
      required this.thumbnail,
      required this.description,
      required this.link});

  @override
  State<DetailBerita> createState() => _DetailBeritaState();
}

class _DetailBeritaState extends State<DetailBerita> {
  late String Date;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Date = widget.pubDate;
  }

  String changeDate(String date) {
    String newDate = date.substring(0, 10) + ' ' + date.substring(11, 23);
    return newDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CNN News'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: BaseNetwork.get('posts'),
          builder: (context, AsyncSnapshot snapshot) {
            return Container(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      DateFormat("EEEE, d MMMM y")
                          .format(DateTime.parse(changeDate(Date))),
                      style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(
                          widget.thumbnail,
                          fit: BoxFit.cover,
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Text(widget.description),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () async {
                          String url = widget.link;
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: Text(
                          'Baca Selengkapnya...',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  void UrlLaunch() {}
}
