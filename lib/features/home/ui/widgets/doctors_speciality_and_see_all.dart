import 'package:doctor_app/core/theming/styles.dart';
import 'package:flutter/material.dart';

class DoctorsSpecialityAndSeeAll extends StatelessWidget {
  const DoctorsSpecialityAndSeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Doctors Speciality', style: TextStyles.font18DarkBlueSemiBold),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: Text('See All', style: TextStyles.font12BlueRegular),
        ),
      ],
    );
  }
}
