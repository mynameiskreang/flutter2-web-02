import 'package:flutter/cupertino.dart';
import 'package:flutter_web_02/constants.dart';

class Option extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          border: Border.all(color: kGrayColor),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Text(
            "1. Test",
            style: TextStyle(color: kGrayColor, fontSize: 16),
          ),
          Spacer(),
          Container(
            height: 26,
            width: 26,
            decoration: BoxDecoration(
                border: Border.all(color: kGrayColor),
                borderRadius: BorderRadius.circular(50)),
          )
        ],
      ),
    );
  }
}
