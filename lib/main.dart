import 'package:flutter/material.dart';
import 'package:paginate_data/components/people/people.dart';
import 'package:paginate_data/models/app_state.dart';
import 'package:paginate_data/reducers/app_reducer.dart';
import 'package:paginate_data/routes.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

void main() {
  final _initialState = AppState();
  final Store<AppState> _store =
      Store<AppState>(appReducer, initialState: _initialState, middleware: [thunkMiddleware]);

  runApp(MyApp(store: _store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp({this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        initialRoute: '/',
        routes: {AppRoutes.people: (context) => PeopleScreen()},
      ),
    );
  }
}
