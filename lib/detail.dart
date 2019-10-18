import 'package:flutter/material.dart';
import 'package:uts_cahyo/home.dart';
import 'package:url_launcher/url_launcher.dart';
_launchURL(String url) async {
  if(await canLaunch(url)) {
    await launch(url);
  }else{
    print('Tidak bisa mengubungkan ke ${url}');
  }
}
class Detail extends StatelessWidget {
  final Komponen pages;
  Detail({Key key,this.pages}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(pages.type),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Text(pages.type,textAlign: TextAlign.left, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Text(pages.desc),
                ),
                RaisedButton(
                  onPressed: (){
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Center(child: Text("Contoh Syntax ${pages.type}")),
                          content: Text(pages.syntax),
                          actions: <Widget>[
                            new RaisedButton(
                                child: Text("BACK",style: TextStyle(color: Colors.white),),
                                color: Colors.greenAccent,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                textColor: Colors.black,
                            ),
                          ],
                      )
                    );
                  },
                  child: Row( 
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Syntax',)]
                  ),
                ),
                RaisedButton(
                  onPressed: (){
                    _launchURL(pages.url);
                  },
                  child: Row( 
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Link Materi',)]
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}