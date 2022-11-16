abstract class LogInEvent {}

class LogInTextChangeEvent extends LogInEvent {
  final String emailValue;
  final String passwordValue;
  LogInTextChangeEvent(this.emailValue, this.passwordValue);
}

class LogInSubmittedEvent extends LogInEvent {
  final String email;
  final String password;
  LogInSubmittedEvent(this.email, this.password);
}
