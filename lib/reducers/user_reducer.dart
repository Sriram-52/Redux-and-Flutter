import 'dart:convert';
import 'package:paginate_data/actions/action_types.dart';
import 'package:paginate_data/models/users/user.dart';
import 'package:paginate_data/models/users/user_state.dart';

UserState userReducer(UserState state, dynamic action) {
  UserState newState = state;

  switch (action.type) {
    case ActionTypes.LIST_USERS_REQUEST:
      newState.list.error = null;
      newState.list.loading = true;
      newState.list.data = null;
      return newState;

    case ActionTypes.LIST_USERS_SUCCESS:
      newState.list.error = null;
      newState.list.loading = false;
      newState.list.data = usersFromJSONStr(action.payload);
      return newState;

    case ActionTypes.LIST_USERS_FAILURE:
      newState.list.error = action.payload;
      newState.list.loading = false;
      newState.list.data = null;
      return newState;

    case ActionTypes.GET_USER_DETAILS_REQUEST:
      newState.details.error = null;
      newState.details.loading = true;
      newState.details.data = null;
      return newState;

    case ActionTypes.GET_USER_DETAILS_SUCCESS:
      newState.details.error = null;
      newState.details.loading = false;
      newState.details.data = userFromJSONStr(action.payload);
      return newState;

    case ActionTypes.GET_USER_DETAILS_FAILURE:
      newState.details.error = action.payload;
      newState.details.loading = false;
      newState.details.data = null;
      return newState;

    default:
      return newState;
  }
}

List<User> usersFromJSONStr(dynamic payload) {
  Iterable jsonArray = json.decode(payload);
  return jsonArray.map((j) => User.fromJSON(j)).toList();
}

UserDetails userFromJSONStr(dynamic payload) {
  return UserDetails.fromJSON(json.decode(payload));
}
