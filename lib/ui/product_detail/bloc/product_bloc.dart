import 'package:e_commerce_app/data/remote/helper/api_helper.dart';
import 'package:e_commerce_app/data/remote/model/product_model.dart';
import 'package:e_commerce_app/ui/product_detail/bloc/product_event.dart';
import 'package:e_commerce_app/ui/product_detail/bloc/product_state.dart';
import 'package:e_commerce_app/utlils/constants/app_urls.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent,ProductState>{
  // ProductRepository productRepo;
  ApiHelper apiHelper;
  bool resStatus = true;
  ProductBloc({required this.apiHelper}) : super(ProductInitialState()){
    on<GetAllProductEvent>((event,emit)async{
      emit(ProductLoadingState());
      try{
        dynamic productRes = await apiHelper.allProductAPI(url: AppUrls.allProducts);
        if(productRes != null ){
          var mProData = await ProductDataModel.fromJson(productRes);
          // print("productRes: $productRes");
          emit(ProductLoadedState(mProducts: mProData));
        }
      }catch(e){
        emit(ProductErrorState(errorMsg: 'message'));
      }
    });
  }
}