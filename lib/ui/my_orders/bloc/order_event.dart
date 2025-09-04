abstract class OrderEvent{}
class CreateOrderEvent extends OrderEvent{
  List<int> cart_id;
  CreateOrderEvent({required this.cart_id});
}
class OrderSucceedEvent extends OrderEvent{}
class OrderFailed extends OrderEvent{
  String errorMsg;
  OrderFailed({required this.errorMsg});
}