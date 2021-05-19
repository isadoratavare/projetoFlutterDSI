import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class pageEdit extends StatefulWidget {
  WordPair oldPair;
  pageEdit(oldPair);

  @override
  _pageEditState createState() => _pageEditState();
}

class _pageEditState extends State<pageEdit> {
  final myController = TextEditingController();
  final myController2 = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    myController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Página de edição'),
        ),
        body: _formEdit(context));
  }

  _formEdit(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                    controller: myController,
                    decoration: InputDecoration(
                        labelText: 'Nome:', border: OutlineInputBorder())),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: myController2,
                  decoration: InputDecoration(
                      labelText: 'Sobrenome:', border: OutlineInputBorder()),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: RaisedButton(
                      onPressed: () {
                        if (myController.value.text != null &&
                            myController2.text != null) {
                          Navigator.pop(
                              context, [myController.text, myController2.text]);
                        }
                      },
                      child: Text('Editar')),
                ),
              ],
            )));
  }
}
