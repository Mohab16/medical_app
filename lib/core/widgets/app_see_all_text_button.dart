// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:medical_app/core/themes/styles.dart';

// ignore: must_be_immutable
class AppSeeAllTextButton extends StatelessWidget {
  Function? onPressed;
   AppSeeAllTextButton({
    Key? key,
     this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed?.call();
      },
      child: Text("See All", style: TextStyles.font12MainBlueRegular),
    );
  }
}
