

import 'package:flutter/material.dart';

class NoDataBody extends StatelessWidget {
  const NoDataBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("There is no Weather Data Start ",style: TextStyle(fontSize: 25),),

          Text("Searching Now",style: TextStyle(fontSize: 25),)
        ],
      ),
    );
  }
}
