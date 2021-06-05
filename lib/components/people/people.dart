import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:paginate_data/components/people/people_card.dart';
import 'package:paginate_data/middleware/people_middleware.dart';
import 'package:paginate_data/models/app_state.dart';

class PeopleScreen extends StatefulWidget {
  @override
  _PeopleScreenState createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      onInitialBuild: (AppState state) {
        return StoreProvider.of<AppState>(context).dispatch(getPeople());
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("People"),
          ),
          body: Container(child: _buildVisible(state)),
          // floatingActionButton: Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: [
          //       FloatingActionButton(
          //         onPressed: () {
          //           if (state.page != 0)
          //             return StoreProvider.of<AppState>(context)
          //                 .dispatch(getPeople(page: state.page - 1));
          //           return null;
          //         },
          //         child: Icon(Icons.skip_previous_sharp),
          //       ),
          //       FloatingActionButton(
          //         onPressed: () {
          //           if (state.page != 0) {
          //             return StoreProvider.of<AppState>(context)
          //                 .dispatch(getPeople(page: state.page + 1));
          //           }
          //           return null;
          //         },
          //         child: Icon(Icons.skip_next),
          //       ),
          //     ],
          //   ),
          // ),
        );
      },
    );
  }
}

Widget _buildVisible(AppState state) {
  if (state.isLoading) {
    return Center(child: CircularProgressIndicator());
  } else if (state.error.isNotEmpty) {
    return Text(state.error);
  } else {
    return ListView.builder(
      itemCount: state.people.length,
      itemBuilder: (context, index) {
        return PeopleCard(
          people: state.people[index],
        );
      },
    );
  }
}
