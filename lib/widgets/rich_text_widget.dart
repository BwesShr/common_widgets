import 'package:flutter/material.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({
    Key? key,
    required this.texts,
    this.textStyle,
  }) : super(key: key);

  final List<String> texts;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
        children: texts.map((e) => TextSpan(text: '$e ')).toList(),
      ),
    );
  }
}
