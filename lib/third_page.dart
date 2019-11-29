import 'package:flutter/material.dart';

import 'model/count_model.dart';

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    print('ScopedModel的build');// 点击按钮该界面会重复调用build

    final countModel = CountModel.of(context);

    final count = CountModel.of(context).count;

    return Scaffold(
      appBar: AppBar(
        title: Text('ScopedModel第三个界面'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              child: Text(
                'ScopedModel第三个界面',
              ),
              onTap: () {},
            ),
            Text(
              count.toString(),
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countModel.increment();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), //
    );
  }
}
