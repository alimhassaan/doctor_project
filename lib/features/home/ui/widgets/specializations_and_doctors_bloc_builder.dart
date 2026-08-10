import 'package:doctor_app/core/helpers/spacing.dart';
import 'package:doctor_app/core/networking/api_error_handler.dart';
import 'package:doctor_app/features/home/data/models/specializations_response_model.dart';
import 'package:doctor_app/features/home/logic/home_cubit.dart';
import 'package:doctor_app/features/home/logic/home_state.dart';
import 'package:doctor_app/features/home/ui/widgets/doctors_list_view.dart';
import 'package:doctor_app/features/home/ui/widgets/doctors_speciality_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecializationsAndDoctorsBlocBuilder extends StatelessWidget {
  const SpecializationsAndDoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SpecializationsLoading ||
          current is SpecializationsSuccess ||
          current is SpecializationsError,
      builder: (context, state) {
        return state.maybeWhen(
          specializationsLoading: () {
            return setupLoading();
          },
          specializationsSuccess: (specializationsResponseModel) {
           
            return setupSuccess(specializationsResponseModel,specializationsResponseModel);
          },
          specializationsError: (errorHandler)=>setupError(errorHandler),
          orElse: () => SizedBox.shrink(),
        );
      },
    );
  }
  Widget setupLoading() {
  return const SizedBox(
    height: 100,
    child: Center(child: CircularProgressIndicator()),
  );
}
Widget setupError(ErrorHandler errorHandler) {
  return SizedBox.shrink();
}
// ignore: strict_top_level_inference
Widget setupSuccess(specializationsList,specializationsResponseModel) {
   final specializationsList =
                specializationsResponseModel.specializationDataList
                    ?.whereType<SpecializationsData>()
                    .toList() ??
                const <SpecializationsData>[];
            final doctorsList = specializationsList.isNotEmpty
                ? specializationsList.first.doctorsList
                          ?.whereType<Doctors>()
                          .toList() ??
                      const <Doctors>[]
                : const <Doctors>[];
  return Expanded(
              child: Column(
                children: [
                  DoctorsSpecialityListView(
                    specializationsDataList: specializationsList,
                  ),
                  verticalSpace(8.h),
                  DoctorsListView(doctorList: doctorsList),
                ],
              ),
            );
}

}

