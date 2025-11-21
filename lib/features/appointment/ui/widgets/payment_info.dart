import 'package:flutter/widgets.dart';
import 'package:medical_app/core/helpers/spacing.dart';
import 'package:medical_app/core/themes/styles.dart';

class PaymentInfo extends StatelessWidget {
  final String appointmentType;
  final String price;
  const PaymentInfo({super.key, required this.appointmentType, required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Payment information", style: TextStyles.font16DarkBlueSemiBold,),
        verticalSpacing(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Appointment type",style: TextStyles.font14GrayRegular,),
                verticalSpacing(10),
                Text("Subtotal", style: TextStyles.font14GrayRegular,),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(appointmentType, style: TextStyles.font14DarkBlueSemiBold,),
                verticalSpacing(10),
                Text(price, style: TextStyles.font14DarkBlueSemiBold,),
              ],
            )
          ],
        )
      ],
    );
  }
}