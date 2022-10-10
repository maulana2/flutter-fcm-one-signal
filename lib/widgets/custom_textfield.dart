import 'package:flutter/material.dart';
import 'package:part3/widgets/theme.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: defaultMarginn),
      height: 81,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: primaryTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 56,
            width: double.infinity,
            decoration: BoxDecoration(
              color: bgGrey,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextFormField(
              autocorrect: false,
            ),
          ),
        ],
      ),
    );
  }
}
