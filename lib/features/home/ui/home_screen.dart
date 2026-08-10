import 'package:doctor_app/core/helpers/spacing.dart';
import 'package:doctor_app/features/home/data/models/specializations_response_model.dart';
import 'package:doctor_app/features/home/logic/home_cubit.dart';
import 'package:doctor_app/features/home/logic/home_state.dart';
import 'package:doctor_app/features/home/ui/widgets/doctors_blue_container.dart';
import 'package:doctor_app/features/home/ui/widgets/doctors_list_view.dart';
import 'package:doctor_app/features/home/ui/widgets/doctors_speciality_and_see_all.dart';
import 'package:doctor_app/features/home/ui/widgets/doctors_speciality_list_view.dart';
import 'package:doctor_app/features/home/ui/widgets/home_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              verticalSpace(16.h),
              const DoctorsSpecialityAndSeeAll(),
              verticalSpace(16.h),
              BlocBuilder<HomeCubit, HomeState>(
                buildWhen: (previous, current) =>
                    current is SpecializationsLoading ||
                    current is SpecializationsSuccess ||
                    current is SpecializationsError,
                builder: (context, state) {
                  return state.maybeWhen(
                    specializationsLoading: () {
                      return const SizedBox(
                        height: 100,
                        child: Center(child: CircularProgressIndicator()),
                      );
                    },
                    specializationsSuccess: (specializationsResponseModel) {
                      final specializationsList =
                          specializationsResponseModel.specializationDataList
                                  ?.whereType<SpecializationsData>()
                                  .toList() ??
                              const <SpecializationsData>[];
                      return Expanded(
                        child: Column(
                          children: [
                            DoctorsSpecialityListView(
                              specializationsDataList: specializationsList,
                            ),
                            verticalSpace(8.h),
                            const DoctorsListView(),
                          ],
                        ),
                      );
                    },
                    specializationsError: (error) {
                      return SizedBox.shrink();
                    },
                    orElse: () => SizedBox.shrink(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
