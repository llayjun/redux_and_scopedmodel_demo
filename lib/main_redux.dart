import 'package:flutter/material.dart';
import 'package:flutter_app/model/count_model.dart';
import 'package:flutter_app/second_page_redux.dart';
import 'package:flutter_app/state/count_state.dart';
import 'package:flutter_app/state/count_state.dart' as prefix0;
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  final store =
      Store<CountState>(reducer, initialState: CountState.initState());
  runApp(MyApp(store));
}

class MyApp extends StatelessWidget {
  final Store<CountState> store;
  CountModel countModel = CountModel();

  MyApp(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
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
    return StoreConnector<CountState, int>(
      converter: (store) {
        return store.state.count;
      },
      builder: (context, count) {
        return Scaffold(
          appBar: AppBar(
            title: Text('redux第一个界面'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  child: Text(
                    '去redux第二个界面',
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SecondPageRedux();
                    }));
                  },
                ),
                Text(
                  count.toString(),
                  style: Theme.of(context).textTheme.display1,
                ),
              ],
            ),
          ),
          floatingActionButton: StoreConnector<CountState, VoidCallback>(
              builder: (context, callBack) {
            return FloatingActionButton(
              onPressed: callBack,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            );
          }, converter: (store) {
            return () => store.dispatch(prefix0.Action.increment);
          }),
        );
      },
    );
  }
}
