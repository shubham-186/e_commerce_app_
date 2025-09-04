import 'package:e_commerce_app/ui/my_orders/order_repo/OrderRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'order_event.dart';
import 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent,OrderState>{
  OrderRepository orderRepo;
  Map<String,dynamic>? orderStatus;
  OrderBloc({required this.orderRepo}):super(InitialOrderState()){
    on<CreateOrderEvent>((event,emit)async{
      try{
        orderStatus = await orderRepo.createOrder(cart_id: event.cart_id);
        if(orderStatus?["status"]){
          emit(UserLoadingState());
          emit(OrderSucceedState(suceedMsg: orderStatus?["message"]));
          print("Order Status: ${orderStatus?["message"]}");
        }
      }catch(e){
        emit(OrderFailureState(errorMsg: "${orderStatus?["message"]}"));
        print("Order Status: ${orderStatus?["message"]}");
      }
    });
  }
}