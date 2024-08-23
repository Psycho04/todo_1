import 'package:flutter/material.dart';
import 'package:todo_1/core/themes/light.dart';

// ignore: must_be_immutable
class HeaderWidget extends StatelessWidget {
  String title;
  HeaderWidget({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.infinity,
              color: MyLightTheme.primaryblue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.12,
                    ),
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}