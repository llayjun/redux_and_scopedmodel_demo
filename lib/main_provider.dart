import 'package:flutter/material.dart';
import 'package:flutter_app/provider_model/provider_model.dart';
import 'package:flutter_app/second_page_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  ProviderModel providerModel = ProviderModel();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print('main');
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: providerModel)],
      child: MaterialApp(
        title: 'Flutter Demo11',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('home');
    return Consumer<ProviderModel>(builder: (context, model, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Provider第一个界面'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                child: Text(
                  '去Provider第二个界面',
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SecondProviderPage();
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
    });
  }
}
