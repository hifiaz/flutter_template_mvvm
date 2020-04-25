import 'package:flutter/material.dart';
import 'package:flutter_template_mvvm/providers/home_view_model.dart';
import 'package:stacked/stacked.dart';

class Home extends StatelessWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onModelReady: (model) => model.initial(),
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${model.isBusy ? 'Loading...' : model.counter}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => model.incrementCounter(),
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          );
        });
  }
}
