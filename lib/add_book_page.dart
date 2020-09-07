import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app2/add_book_model.dart';
import 'file:///C:/Users/rockw/AndroidStudioProjects/flutter_app2/lib/book_list_model.dart';
import 'package:provider/provider.dart';

class AddBookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddBookModel>(
      create: (_) => AddBookModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('バナナを追加'),
        ),
        body: Consumer<AddBookModel>(
          builder: (context, model,child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    onChanged: (text){
                      model.bookTitle=text;
                    },
                  ),
                  RaisedButton(
                    child: Text('通知するで'),
                      onPressed: () async{
                        //firestorenituika
                        try{
                          await model.addBookToFirebase();
                          await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('保存したんご'),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('ＯＫ'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                          await Navigator.of(context).pop();
                        } catch(e){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(e.toString()),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('ＯＫ'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                    ),
                  ],
                ),
              );
            },
         ),
      ),
    );
  }
}