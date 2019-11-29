import 'package:flutter/material.dart';
import 'package:flutter_app/state/count_state.dart';
import 'package:flutter_app/state/count_state.dart' as prefix0;
import 'package:flutter_redux/flutter_redux.dart';

class ThirdPageRedux extends StatefulWidget {
  @override
  _ThirdPageReduxState createState() => _ThirdPageReduxState();
}

class _ThirdPageReduxState extends State<ThirdPageRedux> {
  @override
  Widget build(BuildContext context) {
    print('redux的build');
    /// 使用StoreBuilder
    return StoreBuilder<CountState>(builder: (context, count) {
      return Scaffold(
        appBar: AppBar(
          title: Text('redux第三个界面'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                child: Text(
                  'redux第三个界面，使用StoreBuilder',
                ),
                onTap: () {

                },
              ),
              Text(
                count.state.count.toString(),
                style: Theme.of(context).textTheme.display1,
              ),
            ],
          ),
        ),
        /// 使用StoreConnector来建立链接
        floatingActionButton: StoreConnector<CountState, VoidCallback>(
          builder: (context, callBack) {
            return FloatingActionButton(
              onPressed: callBack,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            );
          },
          converter: (store) {
            return () => store.dispatch(prefix0.Action.increment);
          },
        ),
      );
    });
  }
}
