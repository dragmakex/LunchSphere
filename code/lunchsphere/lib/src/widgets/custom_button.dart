import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lunchsphere/src/util/style_consts.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color color;
  final double borderRadius;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry padding;

  final BoxBorder? border;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.color = StyleConsts.purplePrimary,
    this.borderRadius = 5,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    this.border,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onPressed: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
            border: border),
        padding: padding,
        child: child,
      ),
    );
  }
}

class TouchableOpacity extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;

  const TouchableOpacity({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  State<TouchableOpacity> createState() => _TouchableOpacityState();
}

class _TouchableOpacityState extends State<TouchableOpacity> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onPressed,
      child: AnimatedOpacity(
          duration: const Duration(milliseconds: 150),
          opacity: _isPressed ? 0.5 : 1,
          child: widget.child),
    );
  }
}
