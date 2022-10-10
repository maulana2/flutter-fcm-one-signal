import 'package:flutter/material.dart';
import 'package:part3/widgets/theme.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {Key? key, required this.title, required this.color, required this.onTap})
      : super(key: key);
  final String title;
  final Color color;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMarginn),
        padding: EdgeInsets.symmetric(horizontal: defaultMarginn),
        height: 56,
        width: double.infinity,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey,
              offset: Offset(1.0, 2.0),
              blurRadius: 8.0,
              spreadRadius: 2.0)
        ], color: color, borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Image.asset('assets/plus_icon.png'),
            SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
