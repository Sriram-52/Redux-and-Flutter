import 'dart:convert';
import 'package:paginate_data/actions/people_actions.dart';
import 'package:paginate_data/models/app_state.dart';
import 'package:paginate_data/models/people_state.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux/redux.dart';
import 'package:http/http.dart' as http;

ThunkAction<AppState> getPeople({int page = 3}) {
  return (Store<AppState> store) async {
    store.dispatch(GetPeopleReq());
    try {
      var url = Uri.parse('https://swapi.dev/api/people/?page=$page');
      var response = await http.get(url);
      var decodedData = jsonDecode(response.body);
      List<dynamic> data =
          decodedData["results"].map((json) => PeopleModel.fromJson(json)).toList();
      store.dispatch(GetPeopleSuccess({"data": data, page: page}));
    } catch (e) {
      print(e);
      store.dispatch(GetPeopleFailure(e.toString()));
    }
  };
}
