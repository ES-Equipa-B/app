import 'package:app_sys_eng/colors.dart';
import 'package:flutter/material.dart';

class SettingsOptions extends StatelessWidget {
  const SettingsOptions({super.key});

  Widget customSwitch(
      String text, String def, bool val, Function onChangedMethod) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                Text(
                  def,
                  style:
                      const TextStyle(color: Color(0xff534341), fontSize: 12),
                ),
              ],
            ),
            const Spacer(),
            Switch(
                activeColor: AppColors.primary,
                value: val,
                onChanged: (newValue) {
                  onChangedMethod(newValue);
                }),
          ]),
    );
  }

  Widget dropDown(String text, int? unit, Function onChangedMethod) {
    return DropdownButtonHideUnderline(
        child: DropdownButton(
      isExpanded: true,
      hint: Text(
        text,
        style: const TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.normal),
      ),
      items: const [
        DropdownMenuItem(
          value: 1,
          child: Text('Metric'),
        ),
        DropdownMenuItem(
          value: 2,
          child: Text('Imperial'),
        ),
      ],
      onChanged: (newValue) {
        onChangedMethod(newValue);
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
