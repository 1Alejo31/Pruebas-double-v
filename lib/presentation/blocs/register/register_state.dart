part of 'register_bloc.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable {
  final FormStatus formStatus;
  final String userName;
  final String userLastName;
  final String userDate;
  final String userDirection;

  const RegisterFormState({
    this.formStatus = FormStatus.invalid,
    this.userName = '',
    this.userLastName = '',
    this.userDate = '',
    this.userDirection = '',
  });

  //Crear el copiwith para crear nuevo estado
  RegisterFormState copyWith({
    FormStatus? formStatus,
    String? userName,
    String? userLastName,
    String? userDate,
    String? userDirection,
  }) {
    return RegisterFormState(
      formStatus: formStatus ?? this.formStatus,
      userName: userName ?? this.userName,
      userLastName: userLastName ?? this.userLastName,
      userDate: userDate ?? this.userDate,
      userDirection: userDirection ?? this.userDirection,
    );
  }

  //validamos si el estado es igual para no redibujar
  @override
  List<Object> get props => [
        formStatus,
        userName,
        userLastName,
        userDate,
        userDirection,
      ];
}

final class RegisterInitial extends RegisterFormState {}
