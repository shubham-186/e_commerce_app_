abstract class OrderState{}
class InitialOrderState extends OrderState{}
class OrderSucceedState extends OrderState{
  String suceedMsg;
  OrderSucceedState({required this.suceedMsg});
}
class UserLoadingState extends OrderState{}
class OrderFailureState extends OrderState{
  String errorMsg;
  OrderFailureState({required this.errorMsg});
}
