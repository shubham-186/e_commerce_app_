import 'package:e_commerce_app/data/remote/model/cart_model.dart';
import 'package:e_commerce_app/data/remote/repository/cart_repository.dart';
import 'package:e_commerce_app/ui/my_cart/bloc/cart_event.dart';
import 'package:e_commerce_app/ui/my_cart/bloc/cart_state.dart';
import 'package:e_commerce_app/utlils/constants/app_urls.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent,CartState>{
  CartRepository cartRepo;
  dynamic proRes;

  CartBloc({required this.cartRepo}):super(CartInitialState()){
    on<AddToCartEvent>((event,emit) async {
      // emit(CartLoadingState());
      try{
        proRes = await cartRepo.
        AddToCart_api(
            prod_id: event.pro_id,
            qty: event.qty
        );
        if(proRes["status"] == "true"|| proRes["status"]){
          // emit(CartAddedSucceedState(succeedMsg: proRes["message"]));
         await handleCommonLogic(event, emit);
        }else{
          emit(CartFailiurState(errorMsg: proRes["message"]));

        }
      }catch(e){
        emit(CartFailiurState(errorMsg: proRes["message"]));
      }
    });
    on<CartDeleteEvent>((event,emit)async{
      try{
        // emit(CartLoadingState());
        proRes = await cartRepo.deleteProducts(cart_id: event.cart_id);
        print("the json output is $proRes");
        if(proRes["status"] || proRes["status"] == "true"&& proRes != null){
          //emit(CartDeletedSucceed(deletedSucceedMsg: 'delRes: ${proRes['message']}'));
        await handleCommonLogic(event, emit);
          print('delRes: ${proRes['message']}');
          print('deleted Status: ${proRes['status']}');
        }
      }catch(e){
        emit(CartFailiurState(errorMsg: 'error: ${proRes['message']}'));
        print('error: ${proRes['message']}');
        print('deleted Status: ${proRes['status']}');
      }
    });
    on<DecrementEvent>((event,emit)async{
    //  emit(CartLoadingState());
      try{
        proRes = await cartRepo.decrementQty(
            user_id: event.user_id,
            product_id: event.pro_id,
            quantity: event.qty);
        print("the response id $proRes");
        if(proRes["status"]|| proRes["status"] == "true"){
         await  handleCommonLogic(event, emit);
        }
      }catch(e){
        CartFailiurState(errorMsg: '');
      }
    });
    on<ViewCartEvent>((event, emit) async => handleCommonLogic(event, emit));
  }
  Future<dynamic> handleCommonLogic(CartEvent event, Emitter <CartState> emit)async{
    //emit(CartLoadingState());
    try{
      proRes = await cartRepo.fetchAllCarts_api();
      if(proRes["status"] || proRes["status"] == "true" && proRes != null){
        CartDataModel getCarts = CartDataModel.fromJson(proRes);
        emit(CartLoadedState(cartDataModel_res: getCarts));
        print("The cartRes Msg is: ${proRes["message"]}");
        print("The cartRes result status is: ${proRes["status"]}");
        // cal(getCarts);


      }else{
        emit(CartFailiurState(errorMsg: '${proRes['message']}'));
        print("The cartRes Msg is: ${proRes["message"]}");
        print("The cartRes result status is: ${proRes["status"]}");
      }
    }catch(e){
      emit(CartFailiurState(errorMsg: e.toString()));
    }
  }
}