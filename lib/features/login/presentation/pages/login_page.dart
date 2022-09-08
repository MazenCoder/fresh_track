import '../../../../../core/widget_helper/responsive_safe_area.dart';
import '../../../../../core/injection/injection.dart';
import '../../../../../core/widget_helper/error_app.dart';
import '../../../../../core/widget_helper/loading_app.dart';
import '../widgets/login_initial_widget.dart';
import '../widgets/login_loaded_widget.dart';
import '../../data/models/login_params.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/login_bloc.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSafeArea(
      builder: (_) {
        return Scaffold(
          body: BlocProvider(
            create: (_) => getIt<LoginBloc>(),
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                if (state is LoginInitial) {
                  return const LoginInitialWidget();
                } else if (state is LoginLoading) {
                  return const LoadingApp();
                } else if (state is LoginLoaded) {
                  return LoginLoadedWidget(entity: state.entity);
                } else if (state is LoginError) {
                  return const LoginInitialWidget();
                } else {
                  return const ErrorApp();
                }
              },
            ),
          ),
        );
      },
    );
  }
}
