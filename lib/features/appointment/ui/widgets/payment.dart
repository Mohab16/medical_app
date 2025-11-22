import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medical_app/core/helpers/spacing.dart';
import 'package:medical_app/core/themes/styles.dart';

class Payment extends StatefulWidget {
  final Function(String) onOptionChanged;
  const Payment({super.key, required this.onOptionChanged});

  @override
  State<Payment> createState() => _PaymentState();
}

final List paymentOptions = [
  "Credit card",
  "Bank transfer",
  "Paypal",
  "Pay at appointment",

];

class _PaymentState extends State<Payment> {
    String selectedPaymentOption = '';
@override
  void initState() {
    super.initState();
WidgetsBinding.instance.addPostFrameCallback((_) {
  widget.onOptionChanged(selectedPaymentOption);
});  }
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
              groupValue: selectedPaymentOption,
              onChanged: (value) {
                if (index < 3) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    
                  SnackBar(
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    duration: Duration(seconds: 2),
                    
                    content: Text("Coming Soon!"))
                 );
                } else {
                  setState(() {
                    
                    selectedPaymentOption = value as String;
                  });
                  widget.onOptionChanged(selectedPaymentOption);
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
