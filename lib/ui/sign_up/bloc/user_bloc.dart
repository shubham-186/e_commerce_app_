import 'package:e_commerce_app/data/remote/repository/user_repo.dart';
import 'package:e_commerce_app/ui/sign_up/bloc/user_event.dart';
import 'package:e_commerce_app/ui/sign_up/bloc/user_state.dart';
import 'package:e_commerce_app/utlils/constants/app_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserRepository userRepo;

  UserBloc({required this.userRepo}) : super(GetInitialState()) {
    on<UserRegistrationEvent>((event, emit) async{
      emit(UserLoadingState());
      try {
        dynamic mData = await userRepo.signUpUser(
            name: event.name,
            mobNo: event.phone,
            email: event.email,
            pass: event.pass);
        print(event.name);
        print(event.phone);
        print(event.email);
        print(event.email);
        if(mData["status"]){

          emit(UserSuccessState());
          print("The Error message is: ${mData["message"]}");
          print("The current Status is: ${mData["status"]}");
        } else {
          emit(UserFailiurState(errorMsg: mData['message']));
          print("The status message is: ${mData["message"]}");
          print("The current Status is: ${mData["status"]}");
        }
      } catch (e) {
        emit(UserFailiurState(errorMsg: e.toString()));
      }
    });

    on<UserLoginEvent>((event, emit) async{
      emit(UserLoadingState());

      try{
        dynamic mData = await userRepo.loginUser(email: event.email, pass: event.pass);

        if(mData['status']){
          ///store user token
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(Const.prefUserToken, mData["tokan"]);
          print("The Auth Token: ${mData["tokan"]}");
          print("The safed : ${mData["tokan"]}");
          emit(UserSuccessState());
          print("The status message is: ${mData["message"]}");
          print("The status message is: ${mData["status"]}");
        } else {
          emit(UserFailiurState(errorMsg: mData["message"]));
          print("The Error message is: ${mData["message"]}");
          print("The status message is: ${mData["message"]}");
        }
      } catch (e){
        emit(UserFailiurState(errorMsg: e.toString()));
      }

    });
  }

}