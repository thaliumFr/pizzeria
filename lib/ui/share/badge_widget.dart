import 'package:flutter/material.dart';

class BadgeWidget extends StatelessWidget {
  final double top, right;
  final Widget child;
  final int value;
  final Color? color;
  const BadgeWidget({
    required this.child,
    required this.value,
    required this.top,
    required this.right,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        value == 0
            ? Container()
            : Positioned(
                right: right,
                top: top,
                child: Container(
                  padding: EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: color ?? Colors.red),
                  child: Text(
                    value.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
      ],
    );
  }
}
