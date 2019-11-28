import 'package:flutter/material.dart';
import 'package:flutter_app/third_page.dart';
import 'package:scoped_model/scoped_model.dart';

import 'model/count_model.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CountModel>(
      builder: (context, child, model) {
        return Scaffold(
          appBar: AppBar(
            title: Text('ScopedModel第二个界面'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  child: Text(
                    '去ScopedModel第三个界面',
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return ThirdPage();
                        }));
                  },
                ),
                Text(
                  model.count.toString(),
                  style: Theme.of(context).textTheme.display1,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              model.increment();
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
