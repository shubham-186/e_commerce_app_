import 'package:e_commerce_app/data/remote/model/cart_model.dart';

abstract class CartState {}
class CartLoadingState extends CartState {}
class CartInitialState extends CartState{}
class CartAddedSucceedState extends CartState{
  String succeedMsg;
  CartAddedSucceedState({required this.succeedMsg});
}
class CartDeletedSucceed extends CartState{
  String deletedSucceedMsg;
  CartDeletedSucceed({required this.deletedSucceedMsg});
}
class CartFailiurState extends CartState{
  String errorMsg;
  CartFailiurState({required this.errorMsg});
}
class CartLoadedState extends CartState{
  CartDataModel cartDataModel_res;
  CartLoadedState({required this.cartDataModel_res});
}