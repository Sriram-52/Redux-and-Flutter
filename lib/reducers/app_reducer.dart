import 'package:paginate_data/models/app_state.dart';
import 'package:paginate_data/reducers/user_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    user: userReducer(state.user, action),
  );
}
