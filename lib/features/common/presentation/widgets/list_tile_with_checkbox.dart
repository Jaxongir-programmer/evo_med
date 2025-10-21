import 'package:flutter/material.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';

import 'custom_checkbox.dart';

class ListTileWithCheckBox extends StatefulWidget {
  const ListTileWithCheckBox({
    super.key,
    required this.title,
    required this.isChecked,
    required this.checkboxChanged,
    this.direction = TextDirection.ltr,
    this.height = 56,
  });

  final String title;
  final bool isChecked;
  final TextDirection direction;
  final double height;

  final Function(bool value) checkboxChanged;

  @override
  State<ListTileWithCheckBox> createState() => _ListTileWithCheckBoxState();
}

class _ListTileWithCheckBoxState extends State<ListTileWithCheckBox> {
  late final ValueNotifier<bool> _isChecked;

  @override
  void initState() {
    _isChecked = ValueNotifier(widget.isChecked);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: widget.direction,
      child: GestureDetector(
        onTap: () {
          _isChecked.value = !_isChecked.value;
          widget.checkboxChanged(_isChecked.value);
        },
        behavior: HitTestBehavior.opaque,
        child: SizedBox(
          height: widget.height,
          child: Row(
            spacing: 8,
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  style: context.textTheme.bodyLarge,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              ValueListenableBuilder(
                valueListenable: _isChecked,
                builder: (context, value, child) => CustomCheckBox(value: value && widget.isChecked),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
