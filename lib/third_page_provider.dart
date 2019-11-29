import 'package:flutter/material.dart';
import 'package:flutter_app/provider_model/provider_model.dart';
import 'package:provider/provider.dart';

class ThirdProviderPage extends StatefulWidget {
  @override
  _ThirdProviderPageState createState() => _ThirdProviderPageState();
}

class _ThirdProviderPageState extends State<ThirdProviderPage> {
  @override
  Widget build(BuildContext context) {
    print('provider的build');// 点击按钮该界面会重复调用build

    final providerModel = Provider.of<ProviderModel>(context, listen: true);

    print('provider的build1');// 点击按钮该界面会重复调用build


    final count = Provider.of<ProviderModel>(context, listen: true).count;

    print('provider的build2');// 点击按钮该界面会重复调用build


    return Scaffold(
      appBar: AppBar(
        title: Text('Provider第三个界面'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              child: Text(
                'Provider第三个界面',
              ),
              onTap: () {
                setState(() {});
              },
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
          providerModel.increment();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), //
    );
  }
}
