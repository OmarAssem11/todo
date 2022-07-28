import 'package:flutter/material.dart';
import 'package:todo/core/presentation/resources/color_manager.dart';
import 'package:todo/core/presentation/resources/values_manager.dart';

class ColorDropDownButton extends StatefulWidget {
  const ColorDropDownButton({required this.onChanged});

  final Function(Color) onChanged;

  @override
  State<ColorDropDownButton> createState() => _ColorDropDownButtonState();
}

class _ColorDropDownButtonState extends State<ColorDropDownButton> {
  final colors = [
    ColorManager.red,
    ColorManager.orange,
    ColorManager.yellow,
    ColorManager.blue,
  ];
  Color value = ColorManager.red;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      padding: const EdgeInsets.all(Insets.i8),
      child: DropdownButton<Color>(
        items: colors
            .map(
              (color) => DropdownMenuItem<Color>(
                value: color,
                child: Container(
                  height: AppSize.s30,
                  width: AppSize.s30,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(Insets.i8)),
                  ),
                ),
              ),
            )
            .toList(),
        value: value,
        onChanged: (selectedValue) {
          if (selectedValue != null) {
            value = selectedValue;
            setState(() => widget.onChanged(value));
          }
        },
        icon: const Icon(
          Icons.keyboard_arrow_down,
          color: ColorManager.lightGrey,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(Insets.i16)),
        underline: const SizedBox(),
        dropdownColor: ColorManager.offWhite,
      ),
    );
  }
}
