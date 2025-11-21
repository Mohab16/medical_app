import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medical_app/core/helpers/spacing.dart';
import 'package:medical_app/core/themes/styles.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

final List paymentOptions = [
  "Credit card",
  "Bank transfer",
  "Paypal",
  "Pay at appointment",
];
String selectedOption = '';

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Payment options", style: TextStyles.font16DarkBlueSemiBold),
        verticalSpacing(20),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: paymentOptions.length,
          itemBuilder: (context, index) {
            return RadioListTile(
              contentPadding: EdgeInsets.zero,
              value: paymentOptions[index],
              groupValue: selectedOption,
              onChanged: (value) {
                if (index < 3) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    
                  SnackBar(
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(12)),
                    duration: Duration(seconds: 2),
                    
                    content: Text("Coming Soon!"))
                 );
                } else {
                  setState(() {
                    selectedOption = value as String;
                  });
                }
              },
              title: Text(
                paymentOptions[index],
                style: TextStyles.font14DarkBlueSemiBold,
              ),
            );
          },
        ),
      ],
    );
  }
}
