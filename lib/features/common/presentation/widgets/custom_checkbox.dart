import 'package:flutter/material.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';

class CustomCheckBoxClickable extends StatefulWidget {
  const CustomCheckBoxClickable({
    super.key,
    required this.value,
    required this.onChange,
    this.isError = false,
  });

  final bool value;
  final bool isError;
  final Function(bool value) onChange;

  @override
  State<CustomCheckBoxClickable> createState() => _CustomCheckBoxClickableState();
}

class _CustomCheckBoxClickableState extends State<CustomCheckBoxClickable> {
  late final ValueNotifier<bool> _value = ValueNotifier(widget.value);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _value,
      builder: (context, value, _) => GestureDetector(
        onTap: () {
          _value.value = !_value.value;
          widget.onChange(_value.value);
        },
        behavior: HitTestBehavior.opaque,
        child: SizedBox(
          width: 24,
          height: 24,
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child: value
                ? AppIcons.checked.toSVGWidget()
                : AppIcons.unChecked.toSVGWidget(
                    color: widget.isError ? AppColors.error : null,
                  ),
          ),
        ),
      ),
    );
  }
}

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.value,
    this.isError = false,
  });

  final bool value;
  final bool isError;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: value
            ? AppIcons.checked.toSVGWidget()
            : AppIcons.unChecked.toSVGWidget(
                color: isError ? AppColors.error : null,
              ),
      ),
    );
  }
}
