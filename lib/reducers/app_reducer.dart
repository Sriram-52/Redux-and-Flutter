import 'package:paginate_data/actions/people_actions.dart';
import 'package:paginate_data/models/app_state.dart';

AppState appReducer(AppState prevState, dynamic action) {
  AppState newState = AppState.fromAppState(prevState);
  if (action is GetPeopleReq) {
    newState.isLoading = true;
    newState.people = [];
    newState.error = "";
  } else if (action is GetPeopleSuccess) {
    newState.isLoading = false;
    newState.people = action.payload["data"];
    newState.page = action.payload["page"];
    newState.error = "";
  } else if (action is GetPeopleFailure) {
    newState.isLoading = false;
    newState.people = [];
    newState.error = action.payload;
  }

  return newState;
}
