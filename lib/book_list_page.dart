import 'package:flutter/material.dart';
import 'package:flutter_app2/add_book_page.dart';
import 'file:///C:/Users/rockw/AndroidStudioProjects/flutter_app2/lib/book_list_model.dart';
import 'package:provider/provider.dart';

class BookListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BookListModel>(
      create: (_) => BookListModel()..fetchBooks(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('バナ'),
        ),
        body: Consumer<BookListModel>(
            builder: (context, model,child) {
              final books = model.books;
              final listTiles = books
                  .map(
                      (book) => ListTile(
                        title: Text(book.title),
                        trailing: IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: ()async{
                            await Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => BookListPage(
                                  book: book,
                                ),
                                fullscreenDialog: true,
                            ),
                            );
                            model.fetchBooks();
                          },
                        ),
                      ),
              )
              .toList();
              return ListView(
              children: listTiles,
              );
          },
        ),
        floatingActionButton: Consumer<BookListModel>(
            builder: (context, model,child) {
            return FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () async{
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookListPage(),
                  fullscreenDialog: true,
                  ),
                );
                model.fetchBooks();
              },
            );
          }
        ),
      ),
    );
  }
}