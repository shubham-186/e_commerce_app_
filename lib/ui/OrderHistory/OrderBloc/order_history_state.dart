import 'package:e_commerce_app/data/remote/model/order_model.dart';

abstract class OrderHistoryState{}
class OrderInitialState extends OrderHistoryState{}
class OrderHistoryLoadingState extends OrderHistoryState{}
class OrderHistoryLoadedState extends OrderHistoryState{
  OrdersDataModel getOrders;
  OrderHistoryLoadedState({required this.getOrders});
}
class OrderHistoryFailiurState extends OrderHistoryState{
    String errorMsg;
    OrderHistoryFailiurState({required this.errorMsg});
}