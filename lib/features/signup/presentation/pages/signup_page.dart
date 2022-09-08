import '../../../../../core/widget_helper/responsive_safe_area.dart';
import '../../../../../core/widget_helper/loading_app.dart';
import '../../../../../core/widget_helper/error_app.dart';
import '../../../../../core/injection/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/signup_initial_widget.dart';
import '../widgets/signup_loaded_widget.dart';
import 'package:flutter/material.dart';
import '../bloc/signup_bloc.dart';



class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSafeArea(
      withBackground: true,
      builder: (_) {
        return Scaffold(
          body: BlocProvider(
            create: (_) => getIt<SignUpBloc>(),
            // ..add(GetSignUpEvent(params: SignUpParams())),
            child: BlocBuilder<SignUpBloc, SignUpState>(
              builder: (context, state) {
                if (state is SignUpInitial) {
                  return const SignUpInitialWidget();
                } else if (state is SignUpLoading) {
                  return const LoadingApp();
                } else if (state is SignUpLoaded) {
                  return SignUpLoadedWidget(entity: state.entity);
                } else if (state is SignUpError) {
                  return ErrorApp(message: state.message);
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
