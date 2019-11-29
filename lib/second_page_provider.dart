import 'package:flutter/material.dart';
import 'package:flutter_app/provider_model/provider_model.dart';
import 'package:flutter_app/third_page_provider.dart';
import 'package:provider/provider.dart';

class SecondProviderPage extends StatefulWidget {
  @override
  _SecondProviderPageState createState() => _SecondProviderPageState();
}

class _SecondProviderPageState extends State<SecondProviderPage> {
  @override
  Widget build(BuildContext context) {
    print('provider的build');// 点击按钮该界面不会重复调用build
    return Consumer<ProviderModel>(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Provider第二个界面'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  child: Text(
                    '去Provider第三个界面',
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ThirdProviderPage();
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
