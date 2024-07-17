import 'dart:async';

import 'package:myutils/base/view_model/base_view_model.dart';

class GtdRadioRowViewModel<T> extends BaseViewModel {
  T? groupValue;
  StreamController<T?> groupValueController = StreamController();
  GtdRadioRowViewModel({this.groupValue}) {
    // if (groupValue != null) {
    //   groupValueController.sink.add(groupValue as T);
    // }
  }
}
