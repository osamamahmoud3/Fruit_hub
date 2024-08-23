import 'package:flutter/material.dart';

import '../../../../../core/styles/app_colors.dart';
import '../../../../../core/styles/styles.dart';
import 'custom_check_box.dart';

class TermsAndConditionsWidget extends StatefulWidget {
  const TermsAndConditionsWidget({
    super.key,
  });

  @override
  State<TermsAndConditionsWidget> createState() =>
      _TermsAndConditionsWidgetState();
}

class _TermsAndConditionsWidgetState extends State<TermsAndConditionsWidget> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckbox(
            isChecked: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value!;
              });
            }),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
                text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                style: AppTextStyles.font13SemiBold.copyWith(
                    color: const Color(
                      0XFF949D9E,
                    ),
                    fontFamily: 'Cairo')),
            TextSpan(
                text: ' الشروط والأحكام الخاصة بنا',
                style: AppTextStyles.font13SemiBold.copyWith(
                    color: AppColors.lightPrimaryColor, fontFamily: 'Cairo'))
          ])),
        )
      ],
    );
  }
}
