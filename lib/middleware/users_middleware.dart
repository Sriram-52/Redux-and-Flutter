import 'package:paginate_data/actions/user_actions.dart';
import 'package:paginate_data/models/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:http/http.dart' as http;

ThunkAction<AppState> getUsers() {
  return (Store<AppState> store) async {
    store.dispatch(GetUserReq());
    var url = Uri.parse("http://jsonplaceholder.typicode.com/users");
    try {
      var response = await http.get(url);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    } catch (e) {
      print(e.toString());
      store.dispatch(GetUserFailure(e));
    }
  };
}

ThunkAction<AppState> getUserDetails(int id) {
  return (Store<AppState> store) async {
    store.dispatch(GetUserDetailsReq());
    var url = Uri.parse('http://jsonplaceholder.typicode.com/users/$id');
    try {
      var response = await http.get(url);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    } catch (e) {
      print(e.toString());
      store.dispatch(GetUserDetailsFailure(e));
    }
  };
}

// ThunkAction<AppState> getUsers() => (Store<AppState> store) => {};
// ThunkAction<AppState> getUserDetails(int id) => (Store<AppState> store) => {};
