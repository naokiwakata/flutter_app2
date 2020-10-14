import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app2/book_list_page.dart';
import 'package:flutter_app2/main_model.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: ChangeNotifierProvider<MainModel>(
        create: (_) => MainModel(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('vababa'),
          ),
          body:  Consumer<MainModel>(builder: (context, model,child) {
              return Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      model.BananaText,
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    RaisedButton(
                      child: Text('button'),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BookListPage()),
                        );
                      },
                    )
                  ],
                ),
              );
            }
          ),
        ),
      ),
    );
  }

}


