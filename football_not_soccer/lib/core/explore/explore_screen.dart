import 'package:flutter/material.dart';
import 'package:football_not_soccer/config/icons/app_icons_icons.dart';
import 'package:football_not_soccer/constants/strings.dart';

class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, i) {
            return ListTile(
              title:
                  Text('Roumor Has It: Lampard’s position under threat, ...'),
              subtitle: Text('04 JAN 2021, 14:06'),
              trailing: Icon(AppIcons.bookmark),
            );
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
