import 'package:scoped_model/scoped_model.dart';

class CountModel extends Model {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  //重写of方法，次rebuildOnChange需要置为true，不然数据不会刷新
  static CountModel of(context) {
    return ScopedModel.of<CountModel>(context, rebuildOnChange: true);
  }
}
