import 'package:flutter/material.dart';

class LeagueContainer extends StatelessWidget {
  final String image;
  const LeagueContainer({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Image.asset(image),
    );
  }
}
