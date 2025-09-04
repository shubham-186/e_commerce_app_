import 'package:e_commerce_app/data/remote/model/order_model.dart';
import 'package:e_commerce_app/ui/OrderHistory/OrderBloc/order_history_event.dart';
import 'package:e_commerce_app/ui/OrderHistory/OrderBloc/order_history_state.dart';
import 'package:e_commerce_app/ui/OrderHistory/order_history_repo/order_history_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderHistoryBloc extends Bloc<OrderHistoryEvent,OrderHistoryState>{
  OrderHistoryRepo orderHistoryRepo;
  OrderHistoryBloc({required this.orderHistoryRepo}):super(OrderInitialState()){
    on<OrderHistoryFetchEvent>((event,emit){
      try{
        emit(OrderHistoryLoadingState());
        var getOrders = orderHistoryRepo.getOrders_api();
        var orderDetails = OrdersDataModel.fromJson(getOrders);
        if(getOrders["status"] == true){
          emit(OrderHistoryLoadedState(getOrders: orderDetails));
        }

      }catch(e){
        emit(OrderHistoryFailiurState(errorMsg: ''));
      }
    });
  }
}