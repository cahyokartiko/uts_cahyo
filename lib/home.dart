import 'package:flutter/material.dart';
import 'detail.dart';
class Komponen {
  final String type;
  final String desc;
  final String syntax;
  final String url;

  // construktor
  Komponen({this.type,this.desc,this.syntax,this.url});
}

class Home extends StatelessWidget {
  // isi komponen dengan array
  final List<Komponen> pages = <Komponen> [
    Komponen(type: 'INTERNAL CSS',desc: 'CSS internal digunakan untuk menentukan gaya suatu halaman HTML.\nCSS internal didefenisikan di bagian <head> dalam HTML, didala elemen <style>',syntax: '<!DOCTYPE html>\n<html>\n  <head>\n    <style>\n   p {color: red}\n    </style>\n  </head>\n <body>\n  <p>Pemrograman Perangkat Bergerak</p>\n </body>\n</html>',url: 'https://www.w3schools.com/html/tryit.asp?filename=tryhtml_css_internal'),
    Komponen(type: 'EXTERNAL CSS',desc: 'Lembar gaya eksternal digunakan untuk menentukan gaya banyak halaman HTML.\n Dengan style sheet eksternal, ANda dapat mengubah tampilan seluruh situs web, sengan mengubah satu file!\n Untuk menggunakan style sheet eksternal, tambahkan tautan ke dana di bagian <head> dari halaman HTML',syntax: '<!DOCTYPE html>\n<html>\n  <head>\n    <link href="style.css"/>\n <body>\n  <p>Pemrograman Perangkat Bergerak</p>\n </body>\n</html>',url: 'https://www.w3schools.com/css/css_howto.asp'),
    Komponen(type: 'CSS FONT',desc: 'Properti font-family CSS mendefenisikan font yang akan digunakan\nProperti ukuran font CSS mendefenisikan ukuran tes yang akan digunakan',syntax: '<!DOCTYPE html><html><head><style>p{color:red;font-size: "courier";font-size: 20px;}</style></head><body><p>Pemrograman Perangkat Bergerak</p></body></html>',url: 'https://www.w3schools.com/css/css_font.asp'),
    Komponen(type: 'CSS BORDER',desc: 'The CSS border properties allow you to specify the style, width, and color of an elements border.',syntax: 'p.dotted {border-style: dotted;}',url: 'https://www.w3schools.com/css/css_border.asp'),
    Komponen(type: 'CSS PADDING',desc: 'The CSS padding properties are used to generate space around an elements content, inside of any defined borders.',syntax: 'p {margin-top: 100px;margin-bottom: 100px;margin-right: 150px;margin-left: 80px;}',url: 'https://www.w3schools.com/css/css_margin.asp'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('UTS'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(  
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child:  ListView.builder(
                  shrinkWrap: true,
                  itemCount: pages.length,
                  itemBuilder: (context, idx){
                    return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: RaisedButton(
                      child: Text(pages[idx].type, style: TextStyle(color: Colors.white),),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Detail(pages: pages[idx],)));
                      },
                      color: Colors.blue[300],
                    ),
                  );
                },
              ),
            ),
            FloatingActionButton(
              backgroundColor: Colors.blue[200],
              elevation: 0,
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: Text('HOME'),
            )
          ],
        ),
      )
    );
  }
}