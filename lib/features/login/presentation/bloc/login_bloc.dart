import '../../../../../core/error/failures.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/usecases/get_login.dart';
import '../../data/models/login_params.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'dart:async';

part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final GetLogin getLogin;
  LoginBloc({required this.getLogin}) : super(const LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is GetLoginEvent) {
        try {
          emit(const LoginLoading());
          Either<Failure, LoginEntity> either =
              await getLogin.call(event.params);
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
