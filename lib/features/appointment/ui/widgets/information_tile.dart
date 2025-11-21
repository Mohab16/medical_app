import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/helpers/spacing.dart';
import 'package:medical_app/core/themes/colors.dart';
import 'package:medical_app/core/themes/styles.dart';

class InformationTile extends StatelessWidget {
  final String img;
  final String label;
  final String information_1;
  final String? information_2;
  const InformationTile({
    super.key, required this.img, required this.label, required this.information_1, this.information_2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Image.asset(img,
          width: 40.w,
          height: 40.h,
          ),
          horizontalSpacing(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: TextStyles.font14DarkBlueSemiBold,textAlign:TextAlign.start ,),
              verticalSpacing(8),
              Text(information_1,style: TextStyles.font12GrayRegular,textAlign:TextAlign.start  ),
              if(information_2!=null)...[
                
              verticalSpacing(8),
              Text(information_2!,style: TextStyles.font12GrayRegular,textAlign:TextAlign.start  )
          
              ]
            ],
          )
        
          ],
        ),
        verticalSpacing(20),
        Container(
          width: double.infinity,
          height: 1,
          color: ColorsManager.lighterGray,
        )
      ],
    );
  }
}