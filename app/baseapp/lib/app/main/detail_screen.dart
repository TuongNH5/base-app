import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailsScreen extends StatelessWidget {
   final String id;
  const DetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Detail Screen'),
            Text('ID: $id'),
            CupertinoButton(
              child: const Text('Back'),
              onPressed: () => context.pop(),
            ),
          ],
        ),
      )
    );
  }
}
