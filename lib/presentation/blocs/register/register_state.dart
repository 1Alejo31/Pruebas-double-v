part of 'register_bloc.dart';

enum FormStatus { initial, posting, success, failure }

class RegisterFormState extends Equatable {
  final String userName;
  final String userLastName;
  final String userDate;
  final List<String> userDirections;
  final FormStatus formStatus;
  final bool statusData;

  const RegisterFormState({
    this.userName = '',
    this.userLastName = '',
    this.userDate = '',
    this.userDirections = const [],
    this.formStatus = FormStatus.initial,
    this.statusData = false,
  });

  RegisterFormState copyWith({
    String? userName,
    String? userLastName,
    String? userDate,
    List<String>? userDirections,
    FormStatus? formStatus,
    bool? statusData,
  }) {
    return RegisterFormState(
      userName: userName ?? this.userName,
      userLastName: userLastName ?? this.userLastName,
      userDate: userDate ?? this.userDate,
      userDirections: userDirections ?? this.userDirections,
      formStatus: formStatus ?? this.formStatus,
      statusData: statusData ?? this.statusData,
    );
  }

  @override
  List<Object> get props => [
        userName,
        userLastName,
        userDate,
        userDirections,
        formStatus,
        statusData
      ];
}

class RegisterInitial extends RegisterFormState {}
