  import 'package:e_commerce_app/app_root/app_Routes.dart';
import 'package:e_commerce_app/ui/sign_up/bloc/user_bloc.dart';
import 'package:e_commerce_app/ui/sign_up/bloc/user_event.dart';
import 'package:e_commerce_app/ui/sign_up/bloc/user_state.dart';
  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utlils/constants/app_constants.dart';


  class LoginPage extends StatefulWidget{
    @override
    State<LoginPage> createState() => _LoginPageState();
  }

  class _LoginPageState extends State<LoginPage> {
   final emailRegExp = RegExp(r"[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
   GlobalKey<FormState> formKey = GlobalKey<FormState>();
    var emailControler = TextEditingController();
    var passControler = TextEditingController();
    bool isLoading = false;
    @override
    void initState() {
      super.initState();
      /*SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light, // iOS ke liye optional
        ),
      );*/
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []); //
    }
    bool isChecked = false;
    @override
    Widget build(BuildContext context) {
      return Scaffold(
          backgroundColor: Const.whiteColor,
          body: SingleChildScrollView(
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center, // horizontal center
                      mainAxisAlignment: MainAxisAlignment.start,    // vertical top
                      children: [
                        SizedBox(height: 60),
                        Text("Welcome back", style: TextStyle(fontSize: 24,
                          color: Const.themeColor, fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("Use your credentials below and",
                          style: TextStyle(fontSize: 15,),
                        ),
                        Text("login to your account",
                          style: TextStyle(fontSize: 15,),
                        ),
                        SizedBox(height: 44,),
                        SizedBox(
                          width: double.infinity,
                         child: Form(
                           key: formKey,
                           child: Column(
                              children: [
                                TextFormField(
                                  validator: (value){
                                    if(value == null || value.isEmpty){
                                      return "Email is requires";
                                    }else if(!emailRegExp.hasMatch(value)){
                                      return "Please enter valid email";
                                    }
                                  },
                                  controller: emailControler,
                                  style: TextStyle(fontSize: 12),
                                  decoration: InputDecoration(
                                      suffixIcon: Icon(Icons.email_outlined,color: Const.themeColor,),
                                      // label: Text("Email",style: TextStyle(color: Colors.blue),),
                                      label: Text("Email",style: TextStyle(fontSize: 12),),
                                      hintText: "Email",
                                      hintStyle: TextStyle(fontSize: 12),
                                      contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Const.themeColor),
                                          borderRadius: BorderRadius.circular(61)
                                      ),

                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Const.themeColor),
                                          borderRadius: BorderRadius.circular(61)
                                      )
                                  ),
                                ),
                                SizedBox(height: 13,),
                                TextFormField(
                                  validator: (value){
                                    if(value == null || value.isEmpty){
                                      return "Password are requires";
                                    }else if(value.length<=4){
                                      return "Please enter email more than 8 characters ";
                                    }
                                  },
                                  controller: passControler,
                                  obscureText: true,
                                  keyboardType: TextInputType.visiblePassword,
                                  style: TextStyle(fontSize: 12),
                                  decoration: InputDecoration(
                                      suffixIcon: Icon(Icons.lock,color: Const.themeColor),
                                      label: Text("Password",style: TextStyle(fontSize: 12),),
                                      hintText: "Enter Password",
                                      hintStyle: TextStyle(fontSize: 12),
                                      contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Const.themeColor),
                                          borderRadius: BorderRadius.circular(61)
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Const.themeColor),
                                          borderRadius: BorderRadius.circular(61)
                                      )
                                  ),
                                ),
                              ],
                            ),
                         ),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /*Row(
                              children: [
                                Checkbox(value: isChecked, onChanged: (bool? newValue){
                                  setState(() {
                                    isChecked = newValue ?? false;
                                  });
                                  print("The Changed value is $isChecked");
                                },checkColor: Colors.white,activeColor: Const.buttonColor,),
                                SizedBox(width: 4,),
                                Text("Remember me",style: TextStyle(fontSize: 12),),
                              ],
                            ),*/
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Transform.scale(
                                  scale: 0.95, // 0.8 - 0.9 se compact lagega
                                  child: Checkbox(
                                    value: isChecked,
                                    onChanged: (bool? newValue) {
                                      setState(() {
                                        isChecked = newValue ?? false;
                                      });
                                      print("The Changed value is $isChecked");
                                    },
                                    checkColor: Colors.white,
                                    activeColor: Const.buttonColor,
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // 👈 must-have
                                    visualDensity: VisualDensity.compact, // 👈 tight layout
                                  ),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  "Remember me",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            Text("Forgot password?",style: TextStyle(fontSize: 12,color: Const.themeColor),),
                          ],
                        ),
                        SizedBox(height: 14,),
                        BlocConsumer<UserBloc,UserState>(
                          listener: (c,state){
                            if(state is UserLoadingState){
                              isLoading = true;
                            }
                            if(state is UserSuccessState){
                              isLoading = false;
                              Const.showSnackbar(context: context, message: "Successfully Login",backgroundColor: Colors.green);
                              Navigator.pushNamed(context, AppRoutes.DASHBOARD);
                              print("Successfully Login");
                            }
                            if(state is UserFailiurState){
                              isLoading = false;
                              Const.showSnackbar(context: context,
                              message: state.errorMsg,backgroundColor: Colors.red);
                            }
                          },
                          builder: (ctx,state){
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(26),
                              ),
                              elevation: 3, // Shadow depth (zyada karna ho to increase karo)
                              child: GestureDetector(
                                onTap: (){
                                  /// loginTapped
                                  print("email: ${emailControler.text}");
                                  print("pass: ${passControler.text}");
                                  if(formKey.currentState!.validate()){
                                    context.read<UserBloc>().add(UserLoginEvent(
                                        email: emailControler.text,
                                        pass: passControler.text
                                    ));
                                    print("Login Tapped");
                                  }
                                  // Navigator.pushReplacementNamed(context, AppRoutes.WELCOME_PAGE);
                                },
                                child: isLoading?Row(
                                  mainAxisAlignment:MainAxisAlignment.center,
                                  children: [
                                    CircularProgressIndicator(),
                                    Text("Signing in")
                                  ],
                                ): Container(
                                  height: 45,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Const.themeColor,
                                    borderRadius: BorderRadius.circular(21),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Login",
                                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(height:25,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account?",style: TextStyle(fontSize: 13.6,color: Colors.grey.shade500),),
                            SizedBox(width: 5,),
                            GestureDetector(
                              onTap: (){
                                Navigator.pushNamed(context, AppRoutes.SIGN_UP);
                              },
                                child: Text("Sign Up",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Const.themeColor),)),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 30,
                              height: 1,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 0.5,
                                  color: Colors.grey.shade300,
                                )
                              ),
                            ),
                            SizedBox(width: 7,),
                            Text("OR",style: TextStyle(fontSize: 14,color:Colors.grey.shade500),),
                            SizedBox(width: 7,),
                            Container(
                              width: 30,
                              height: 1,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 0.5,
                                    color: Colors.grey.shade300,
                                  )
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 25,),
                        Container(
                          width: double.infinity,
                          height: 55,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: Const.themeColor
                              ),
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: 19,),
                                  Image.asset("assets/images/apple.png", width: 22, height: 22),
                                ],
                              ),
                              Center(
                                child: Text(
                                  "Continue with Apple",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),

                        ),
                        SizedBox(height: 15,),
                        Container(
                          width: double.infinity,
                          height: 55,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: Const.themeColor
                              ),
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: 19,),
                                  Image.asset("assets/images/google.png", width: 22, height: 22),
                                ],
                              ),
                              Center(
                                child: Text(
                                  "Continue with Google",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),

                        ),
                        SizedBox(height: 15,),
                        Container(
                          width: double.infinity,
                          height: 55,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: Const.themeColor
                              ),
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: 19,),
                                  Image.asset("assets/images/twitters.png", width: 22, height: 22),
                                ],
                              ),
                              Center(
                                child: Text(
                                  "Continue with Twitter",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),

                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
      );
    }

}
/// r@gmail.com
  /// 123456