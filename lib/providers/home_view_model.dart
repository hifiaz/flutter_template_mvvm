import 'package:stacked/_base_viewmodels.dart';

class HomeViewModel extends BaseViewModel {
  int _counter = 0;

  int get counter => _counter;

  void initial() {
    _counter = 2;
    notifyListeners();
  }

  void incrementCounter() async {
    setBusy(true);
    await Future.delayed(const Duration(seconds: 2));
    _counter++;
    setBusy(false);
    notifyListeners();
  }
}
