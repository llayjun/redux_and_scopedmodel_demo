import 'package:flutter/material.dart';
import 'package:flutter_app/model/count_model.dart';
import 'package:flutter_app/second_page.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  CountModel countModel = CountModel();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: countModel,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage();

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant < CountModel > (
        builder: (context, child, model)
    {
      return Scaffold(
        appBar: AppBar(
          title: Text('ScopedModel第一个界面'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                child: Text(
                  '去ScopedModel第二个界面',
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return SecondPage();
                      }));
                },
              ),
              Text(
                model.count.toString(),
                style: Theme
                    .of(context)
                    .textTheme
                    .display1,
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
    },);
  }

}
