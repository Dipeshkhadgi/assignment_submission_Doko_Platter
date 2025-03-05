import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doko_platter/app/di/di.dart';
import 'package:doko_platter/feature/auth/presentation/view/loginscreen_view.dart';
import 'package:doko_platter/feature/auth/presentation/view_model/login/bloc/login_bloc.dart';
import 'package:doko_platter/feature/home/presentation/view_model/home_state.dart';

class OnboardingCubit extends Cubit<HomeState> {
  OnboardingCubit() : super(HomeState.initial());

  void onTabTapped(int index) {
    emit(state.copyWith(selectedIndex: index));
  }

  void goToLogin(BuildContext context) {
    Future.delayed(const Duration(seconds: 0), () async {
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: getIt<LoginBloc>(),
              child: const LoginscreenView(),
            ),
          ),
        );
      }
    });
  }
}
