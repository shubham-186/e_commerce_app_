abstract class UserState{}
class GetInitialState extends UserState{}
class UserLoadingState extends UserState{}
class UserSuccessState extends UserState{}
class UserFailiurState extends UserState{
  String errorMsg;
  UserFailiurState({required this.errorMsg});
}
