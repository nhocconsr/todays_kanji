import 'package:flutter/material.dart';

class Preference extends StatelessWidget {
  final String name;
  final Widget child;
  Preference({this.name, this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Builder(
        builder: (context) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(name),
              ),
              child,
            ],
          );
        },
      ),
    );
  }
}
