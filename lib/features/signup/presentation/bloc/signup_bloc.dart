import 'package:flutter/foundation.dart';

import '../../../../../core/error/failures.dart';
import '../../domain/entities/signup_entity.dart';
import '../../domain/usecases/get_signup.dart';
import '../../data/models/signup_params.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'dart:async';

part 'signup_event.dart';
part 'signup_state.dart';

@injectable
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final GetSignUp getSignUp;
  SignUpBloc({required this.getSignUp}) : super(const SignUpInitial()) {
    on<SignUpEvent>((event, emit) async {
      if (event is GetSignUpEvent) {
        try {
          emit(const SignUpLoading());
          Either<Failure, SignUpEntity> either =
              await getSignUp.call(event.params);
          either.fold((failure) {
            final msg = failure.props.elementAt(0) ?? 'error_wrong'.tr;
            emit(SignUpError(message: '$msg'));
          }, (values) {
            emit(SignUpLoaded(entity: values));
          });
        } catch (e) {
          emit(SignUpError(message: e.toString()));
        }
      }
    });
  }
}
