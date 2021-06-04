import 'package:flutter/material.dart';
import 'package:paginate_data/components/users/user_details_screen.dart';
import 'package:paginate_data/components/users/users_screen.dart';
import 'package:paginate_data/logger.dart';
import 'package:paginate_data/models/app_state.dart';
import 'package:paginate_data/reducers/app_reducer.dart';
import 'package:paginate_data/routes.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main() {
  final _initialState = AppState();
  final Store<AppState> _store = Store<AppState>(appReducer,
      initialState: _initialState, middleware: [thunkMiddleware, loggingMiddleware]);

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
        routes: {
          AppRoutes.users: (context) => UsersScreen(),
          AppRoutes.userDetails: (context) => UserDetailsScreen(),
        },
      ),
    );
  }
}
