import '../../domain/entities/signup_entity.dart';

class SignUpModel extends SignUpEntity {

  SignUpModel({
    required String id,
  }) : super(id: id);


factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
    'id': id,
    };
  }

}