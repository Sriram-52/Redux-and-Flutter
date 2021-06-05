import 'package:flutter/material.dart';
import 'package:paginate_data/models/people_state.dart';

class PeopleCard extends StatelessWidget {
  final PeopleModel people;
  PeopleCard({this.people});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  people.name,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
