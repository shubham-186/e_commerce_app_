abstract class UserEvent{}
class UserRegistrationEvent extends UserEvent{
  String email;
  String pass;
  String name;
  String phone;
  UserRegistrationEvent({
    required  this.email,
    required this.pass,
    required this.name,
    required this.phone
  });
}
class UserLoginEvent extends UserEvent{
  String email;
  String pass;
  UserLoginEvent({required this.email,required this.pass});
}
