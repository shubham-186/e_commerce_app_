import 'package:e_commerce_app/data/remote/repository/user_repo.dart';
import 'package:e_commerce_app/ui/sign_up/bloc/user_event.dart';
import 'package:e_commerce_app/ui/sign_up/bloc/user_state.dart';
import 'package:e_commerce_app/utlils/constants/app_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserBloc extends Bloc<UserEvent,UserState>{
  UserRepository userRepo;
  UserBloc({required this.userRepo}):super(GetInitialState()){
    on<UserRegistrationEvent>((event,emit)async{
      emit(UserLoadingState());
      try{
        dynamic mData = await userRepo.
        signUpUser(name: event.name,
            phone: event.phone,
            email: event.email,
            pass: event.pass);
        if(mData["status"]){
          emit(UserSuccessState());
        }else{
          emit(UserFailiurState(errorMsg: mData["message"]));
        }
      }catch(e){
        emit(UserFailiurState(errorMsg: e.toString()));
      }
    });
    on<UserLoginEvent>((event,emit)async{
      emit(UserLoadingState());
      try{
        var loginStatus = await userRepo.loginUser(email: event.email, pass: event.pass);
        if(loginStatus["status"]){
          SharedPreferences sharedPref = await SharedPreferences.getInstance();
          sharedPref.setString(Const.prefUserToken,loginStatus["tokan"]);

          emit(UserSuccessState());
        }else{
          emit(UserFailiurState(errorMsg: loginStatus["message"]));
        }
      }catch(e){
        emit(UserFailiurState(errorMsg: e.toString()));
      }
    });
  }
}