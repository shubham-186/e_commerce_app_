import 'package:e_commerce_app/data/remote/model/order_model.dart';
import 'package:e_commerce_app/ui/OrderHistory/OrderBloc/order_history_event.dart';
import 'package:e_commerce_app/ui/OrderHistory/OrderBloc/order_history_state.dart';
import 'package:e_commerce_app/ui/OrderHistory/order_history_repo/order_history_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderHistoryBloc extends Bloc<OrderHistoryEvent,MyOrderHistoryState>{
  OrderHistoryRepo orderHistoryRepo;
  OrderHistoryBloc({required this.orderHistoryRepo}):super(OrderInitialState()){
    on<OrderHistoryFetchEvent>((event,emit)async{
      try{
        emit(OrderHistoryLoadingState());
        dynamic getOrders = await orderHistoryRepo.getOrders_api();
        var orderDetails = OrdersDataModel.fromJson(getOrders);
        if(getOrders["status"]){
          emit(OrderHistoryLoadedState(getOrders: orderDetails));
          print('success Status: ${getOrders["status"]}');
        }

      }catch(e){
        emit(OrderHistoryFailiurState(errorMsg: e.toString()));
      }
    });
  }
}