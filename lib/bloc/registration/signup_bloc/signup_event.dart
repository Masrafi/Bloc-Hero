abstract class SignUpEvent {}

class SignUpTextSubmitEvent extends SignUpEvent {
  final String name;
  final String designation;
  final String organization;
  final String phone;
  final String email;
  final String password;
  final String group;
  final List category;

  SignUpTextSubmitEvent({
    required this.name,
    required this.designation,
    required this.organization,
    required this.phone,
    required this.email,
    required this.password,
    required this.group,
    required this.category,
  });
}
