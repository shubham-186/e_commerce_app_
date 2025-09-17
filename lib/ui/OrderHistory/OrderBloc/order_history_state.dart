import 'package:e_commerce_app/data/remote/model/order_model.dart';

abstract class MyOrderHistoryState{}
class OrderInitialState extends MyOrderHistoryState{}
class OrderHistoryLoadingState extends MyOrderHistoryState{}
class OrderHistoryLoadedState extends MyOrderHistoryState{
  OrdersDataModel getOrders;
  OrderHistoryLoadedState({required this.getOrders});
}
class OrderHistoryFailiurState extends MyOrderHistoryState{
    String errorMsg;
    OrderHistoryFailiurState({required this.errorMsg});
}