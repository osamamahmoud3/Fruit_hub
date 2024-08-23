import 'package:flutter/material.dart';

import '../../../../../core/styles/app_colors.dart';
import '../../../../../core/styles/styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            child: Divider(
          color: Color(0XFFDDDFDF),
          thickness: 1,
        )),
        const SizedBox(
          width: 18,
        ),
        const Text(
          'أو',
          style: AppTextStyles.font16SemiBold,
        ),
        const SizedBox(
          width: 18,
        ),
        const Expanded(
            child: Divider(
          color: Color(0XFFDDDFDF),
          thickness: 1,
        )),
       
      ],
    );
  }
}
