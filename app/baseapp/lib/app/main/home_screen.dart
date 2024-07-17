
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myutils/data/configuration/color_config/app_color.dart';
import 'package:myutils/helpers/extension/image_extension.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Home Screen'),
            CupertinoButton(
              child: const Text('Details'),
              onPressed: () => context.push('/details/123'),
            ),
          ],
        ),
      )
    );
  }
}
