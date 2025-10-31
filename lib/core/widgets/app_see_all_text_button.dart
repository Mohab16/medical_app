import 'package:flutter/material.dart';
import 'package:medical_app/core/themes/styles.dart';

class AppSeeAllTextButton extends StatelessWidget {
  const AppSeeAllTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text("See All", style: TextStyles.font12MainBlueRegular),
    );
  }
}
