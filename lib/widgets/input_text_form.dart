/*
 * Copyright (c) 2023 Biwesh Shrestha
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following
 * conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 */

import 'package:flutter/material.dart';
import 'package:awesome_icons/awesome_icons.dart';

class InputFormWidget extends StatefulWidget {
  const InputFormWidget({
    Key? key,
    required this.initialValue,
    this.label,
    this.hint,
    this.node,
    this.nextNode,
    this.isPassword = false,
    this.inputType,
    this.inputAction,
    required this.validateField,
    required this.onChangedInput,
  }) : super(key: key);

  final String initialValue;

  /// Optional text that describes the input field.
  final String? label;

  /// Text that suggests what sort of input the field accepts.
  final String? hint;
  final FocusNode? node;
  final bool isPassword;
  final FocusNode? nextNode;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final String? Function(String) validateField;
  final ValueChanged<String> onChangedInput;

  @override
  State<InputFormWidget> createState() => _InputFormWidgetState();
}

class _InputFormWidgetState extends State<InputFormWidget> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      child: TextFormField(
        focusNode: widget.node ?? FocusNode(),
        initialValue: widget.initialValue,
        textInputAction: widget.inputAction ?? TextInputAction.go,
        keyboardType: widget.inputType ?? TextInputType.text,
        obscureText: widget.isPassword ? isObscure : false,
        showCursor: true,
        validator: (value) => widget.validateField(value!),
        onChanged: widget.onChangedInput,
        onFieldSubmitted: (value) {
          widget.onChangedInput(value);
          if (widget.nextNode != null) {
            FocusScope.of(context).requestFocus(widget.nextNode);
          }
        },
        decoration: widget.label == null
            ? hintDecoration(context)
            : labelDecoration(context),
      ),
    );
  }

  InputDecoration labelDecoration(BuildContext context) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 10.0,
      ),
      labelText: widget.label ?? '',
      labelStyle: Theme.of(context).textTheme.bodyMedium,
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      disabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      suffixIcon: widget.isPassword
          ? InkWell(
              onTap: () => setState(() => isObscure = !isObscure),
              child: Icon(
                isObscure ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
                color: Theme.of(context).primaryColor,
                size: 20.0,
              ),
            )
          : const SizedBox(width: 0.0),
    );
  }

  InputDecoration hintDecoration(BuildContext context) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 10.0,
      ),
      hintText: widget.hint ?? '',
      hintStyle: Theme.of(context).textTheme.bodyMedium,
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      disabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      suffixIcon: widget.isPassword
          ? InkWell(
              onTap: () => setState(() => isObscure = !isObscure),
              child: Icon(
                isObscure ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
                color: Theme.of(context).primaryColor,
                size: 20.0,
              ),
            )
          : const SizedBox(width: 0.0),
    );
  }
}
