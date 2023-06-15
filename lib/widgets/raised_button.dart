import 'package:flutter/material.dart';

class RaisedButton extends StatelessWidget {
  const RaisedButton({
    Key? key,
    required this.title,
    this.color,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final Color? color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          color ?? Theme.of(context).primaryColor,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            side: BorderSide(
              color: color ?? Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
      child: Text(
        title,
        style: Theme.of(context).primaryTextTheme.labelLarge,
      ),
    );
  }
}
