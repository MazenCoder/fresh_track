import 'package:fresh_track/features/login/models/login_model.dart';
import 'package:fresh_track/core/usecases/constants.dart';
import '../../../../../core/error/failures.dart';
import 'package:injectable/injectable.dart';
import '../../models/login_params.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:get/get.dart';

part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {

  LoginBloc() : super(const LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is GetLoginEvent) {
        try {
          emit(const LoginLoading());
          Either<Failure, LoginModel> either = await loginLogic.lgoin(event.params);
          either.fold((failure) {
            final msg = failure.props.elementAt(0) ?? 'error_wrong'.tr;
            emit(LoginError(message: '$msg'));
          }, (values) {
            emit(LoginLoaded(entity: values));
          });
        } catch (e) {
          emit(LoginError(message: e.toString()));
        }
      }
    });
  }
}
