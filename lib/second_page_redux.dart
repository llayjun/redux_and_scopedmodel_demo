import 'package:flutter/material.dart';
import 'package:flutter_app/state/count_state.dart';
import 'package:flutter_app/state/count_state.dart' as prefix0;
import 'package:flutter_app/third_page_redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class SecondPageRedux extends StatefulWidget {
  @override
  _SecondPageReduxState createState() => _SecondPageReduxState();
}

class _SecondPageReduxState extends State<SecondPageRedux> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<CountState,int>(builder: (context,count){
      return Scaffold(
        appBar: AppBar(
          title: Text('redux第二个界面'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                child: Text(
                  '去redux第三个界面，使用StoreConnector',
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ThirdPageRedux();
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
        floatingActionButton: StoreConnector<CountState,VoidCallback>(builder: (context,callBack){
          return FloatingActionButton(
            onPressed: callBack,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          );
        }, converter:(store){
          return () => store.dispatch(prefix0.Action.increment);
        }),
      );
    }, converter: (store){return store.state.count;});
  }
}
