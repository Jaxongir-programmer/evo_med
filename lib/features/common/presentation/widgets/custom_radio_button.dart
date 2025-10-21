import 'package:flutter/material.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';

class CustomRadioButton extends StatefulWidget {
  const CustomRadioButton({
    super.key,
    required this.value,
    required this.onChanged,
    this.text = "",
  });

  final bool value;
  final Function(bool value) onChanged;
  final String text;

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  late final ValueNotifier<bool> _isSelected;

  @override
  void initState() {
    super.initState();
    _isSelected = ValueNotifier(widget.value);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _isSelected.value = !_isSelected.value;
        widget.onChanged(_isSelected.value);
      },
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 8,
          children: [
            if (widget.text.isNotEmpty)
              Text(
                widget.text,
                style: context.textTheme.bodyLarge,
              ),
            ValueListenableBuilder(
              valueListenable: _isSelected,
              builder: (context, value, child) => AnimatedContainer(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: (value && widget.value) ? AppColors.primaryColor : AppColors.borderColor,
                    width: (value && widget.value) ? 8 : 1,
                  ),
                ),
                duration: Duration(milliseconds: 200),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
