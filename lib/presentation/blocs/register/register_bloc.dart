import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterFormState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<UserNameChanged>(userNameChange);
    on<UserLastNameChanged>(userLastNameChange);
    on<UserDateChanged>(userDateChange);
    on<UserDirectionChanged>(userDirectionChange);
    on<FormSubmitted>(onSubmit);
  }

  void userNameChange(UserNameChanged event, Emitter<RegisterFormState> emit) {
    emit(state.copyWith(userName: event.userName));
  }

  void userLastNameChange(
      UserLastNameChanged event, Emitter<RegisterFormState> emit) {
    emit(state.copyWith(userLastName: event.userLastName));
  }

  void userDateChange(UserDateChanged event, Emitter<RegisterFormState> emit) {
    emit(state.copyWith(userDate: event.userDate));
  }

  void userDirectionChange(
      UserDirectionChanged event, Emitter<RegisterFormState> emit) {
    emit(state.copyWith(userDirections: event.userDirections));
  }

  void onSubmit(FormSubmitted event, Emitter<RegisterFormState> emit) {
    emit(state.copyWith(formStatus: FormStatus.posting));
    print('Submit: $state');
  }
}
