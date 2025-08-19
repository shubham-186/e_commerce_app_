import 'package:e_commerce_app/data/remote/model/product_model.dart';

abstract class ProductState{}
class ProductInitialState extends ProductState{}
class ProductLoadingState extends ProductState{}
class ProductLoadedState extends ProductState{
   ProductDataModel mProducts;
   ProductLoadedState({required this.mProducts});
}
class ProductErrorState extends ProductState{
  String errorMsg;
  ProductErrorState({required this.errorMsg});
}