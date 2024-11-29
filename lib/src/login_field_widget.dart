import 'package:flutter/material.dart';
import 'package:login_widget/src/login_widget.dart';

/// Single text field for use with [LoginWidget].
class LoginFieldWidget extends StatefulWidget {
  /// Create a new [LoginFieldWidget] given a [controller] to attach.
  /// The [TextEditingController] to assign this field to.
  final TextEditingController controller;

  /// An optional function to check whether the input string is valid or not.
  ///
  /// Should return an error message, or null if the input is accepted.
  final String? Function(String? input)? validator;

  /// The hint text to show when no input is given.
  final String hintText;

  /// Hides the input from the user.
  final bool obscureText;

  /// Enable input
  final bool enabled;

  /// Automatically focus on this element when the widget is rendered.
  final bool autofocus;

  const LoginFieldWidget(
      {super.key,
      required this.controller,
      this.validator,
      this.hintText = '',
      this.enabled = true,
      this.obscureText = false,
      this.autofocus = false});

  @override
  _LoginFieldWidgetState createState() => _LoginFieldWidgetState();
}

class _LoginFieldWidgetState extends State<LoginFieldWidget> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState;
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: TextFormField(
        enabled: widget.enabled,
        autofocus: widget.autofocus,
        controller: widget.controller,
        decoration: InputDecoration(
            hintText: widget.hintText,
            border: const OutlineInputBorder(),
            suffixIcon: widget.obscureText
                ? InkWell(
                    child: Icon(Icons.remove_red_eye),
                    onTap: () => setState(() {
                          _obscureText = !_obscureText;
                        }))
                : null),
        obscureText: _obscureText,
        textInputAction: TextInputAction.next,
        validator: widget.validator,
      ),
    );
  }
}
