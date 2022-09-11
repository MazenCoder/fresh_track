import '../../../../../core/widget_helper/responsive_safe_area.dart';
import '../../../../../core/widget_helper/loading_app.dart';
import '../../../../../core/widget_helper/error_app.dart';
import '../../../../../core/injection/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/login_initial_widget.dart';
import '../widgets/login_loaded_widget.dart';
import 'package:flutter/material.dart';
import '../bloc/login_bloc.dart';



class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    return ResponsiveSafeArea(
      withBackground: true,
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: BlocProvider(
            create: (_) => getIt<LoginBloc>(),
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                if (state is LoginInitial) {
                  return LoginInitialWidget(
                    keyboardVisible: keyboardVisible,
                  );
                } else if (state is LoginLoading) {
                  return const LoadingApp();
                } else if (state is LoginLoaded) {
                  return LoginLoadedWidget(entity: state.entity);
                } else if (state is LoginError) {
                  return LoginInitialWidget(
                    keyboardVisible: keyboardVisible,
                  );
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
