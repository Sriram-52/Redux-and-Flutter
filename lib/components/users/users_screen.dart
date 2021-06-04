import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:paginate_data/middleware/users_middleware.dart';
import 'package:paginate_data/models/app_state.dart';
import 'package:paginate_data/models/users/user.dart';
import 'package:paginate_data/models/users/user_state.dart';
import 'package:paginate_data/routes.dart';
import 'package:redux/redux.dart';

class UsersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      onInitialBuild: StoreProvider.of<AppState>(context).dispatch(getUsers()),
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Users"),
          ),
        );
      },
    );
  }
}
