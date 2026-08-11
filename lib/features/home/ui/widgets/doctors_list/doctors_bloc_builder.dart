import 'package:doctor_app/features/home/ui/widgets/doctors_list/doctors_list_view.dart';

import '../../../logic/home_cubit.dart';
import '../../../logic/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class DoctorsBlocBuilder extends StatelessWidget {
  const DoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is DoctorsSuccess || current is DoctorsError,
      builder: (context, state) {
        return state.maybeWhen(
          doctorsSuccess: (doctorsList) {
            return setupSuccess(doctorsList);
          },
          doctorsError: () => setupError(),
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }

  // ignore: strict_top_level_inference
  Widget setupSuccess(doctorsList) {
    return DoctorsListView(
      doctorList: doctorsList,
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}