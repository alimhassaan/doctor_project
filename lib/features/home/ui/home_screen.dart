
import 'package:doctor_app/features/home/ui/widgets/doctors_list/doctors_bloc_builder.dart';

import '../../../core/helpers/spacing.dart';
import 'widgets/doctors_blue_container.dart';
import 'widgets/doctors_speciality_and_see_all.dart';
import 'widgets/home_top_bar.dart';
import 'widgets/specializations_bloc_builder.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(20, 16, 20, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTopBar(),
              const DoctorsBlueContainer(),
              verticalSpace(16),
              const DoctorsSpecialityAndSeeAll(),
              verticalSpace(16),
             SpecializationsBlocBuilder(),
              verticalSpace(8),
              const DoctorsBlocBuilder(),

            ],
          ),
        ),
      ),
    );
  }
}





