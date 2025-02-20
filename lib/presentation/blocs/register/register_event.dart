part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class UserNameChanged extends RegisterEvent {
  final String userName;
  const UserNameChanged(this.userName);

  @override
  List<Object> get props => [userName];
}

class UserLastNameChanged extends RegisterEvent {
  final String userLastName;
  const UserLastNameChanged(this.userLastName);

  @override
  List<Object> get props => [userLastName];
}

class UserDateChanged extends RegisterEvent {
  final String userDate;
  const UserDateChanged(this.userDate);

  @override
  List<Object> get props => [userDate];
}

class UserDirectionChanged extends RegisterEvent {
  final String userDirection;
  const UserDirectionChanged(this.userDirection);

  @override
  List<Object> get props => [userDirection];
}

class FormSubmitted extends RegisterEvent {}
