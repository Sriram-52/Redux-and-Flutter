import 'package:redux/redux.dart';

void loggingMiddleware<State>(
  Store<State> store,
  dynamic action,
  NextDispatcher next,
) {
  if (action) {
    print('{');
    print('  Action: ${action.type}');

    if (action.payload != null) {
      print('  Payload: ${action.payload}');
    }

    print('}');
  }

  next(action);
}
