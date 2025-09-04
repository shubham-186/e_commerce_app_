import 'package:e_commerce_app/app_root/app_Routes.dart';
import 'package:e_commerce_app/ui/sign_up/bloc/user_bloc.dart';
import 'package:e_commerce_app/ui/sign_up/bloc/user_event.dart';
import 'package:e_commerce_app/ui/sign_up/bloc/user_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utlils/constants/app_constants.dart';

class SignUpPage extends StatefulWidget{
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

   var nameController = TextEditingController();
   var emailController = TextEditingController();
   var passController = TextEditingController();
   var phoneController = TextEditingController();
   var status;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // BlocProvider.of<>(context)
  }
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
                mainAxisAlignment:
                MainAxisAlignment.start,    // vertical top
                children: [
                  SizedBox(height: 20),
                  // Image.asset("assets/images/sign_up.jpg", width: 200, height: 200),
                  Image.asset("assets/icons/account.png", width: 260, height: 260),
                  SizedBox(height: 1,),
                  // Text("Register", style: TextStyle(fontSize: 24,color: Colors.black,fontWeight: FontWeight.bold,),),
                  SizedBox(height: 20,),
                  TextField(
                    controller: nameController,
                    style: TextStyle(fontSize: 12),
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.account_circle,color: Const.themeColor,),
                        // label: Text("Email",style: TextStyle(color: Colors.blue),),
                        label: Text("Name",style: TextStyle(fontSize: 12),),
                        hintText: "Name",
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
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
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
                  TextField(
                    controller:passController,
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
                  SizedBox(height: 13,),
                  TextField(
                    controller:phoneController,
                    style: TextStyle(fontSize: 12),
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.phone,color: Const.themeColor,),
                        // label: Text("Email",style: TextStyle(color: Colors.blue),),
                        label: Text("Phone",style: TextStyle(fontSize: 12),),
                        hintText: "Phone",
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
                  SizedBox(height: 34,),
                  BlocConsumer<UserBloc,UserState>(
                    listener: (ctx_,state){
                      if(state is UserLoadingState){
                        isLoading = true;
                      }
                      if(state is UserSuccessState){
                        isLoading = false;
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Sign Up Successfully!!")));
                        Navigator.pop(context);
                        print("SignUp Successfully");
                      }
                      if(state is UserFailiurState){
                        isLoading = false;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.errorMsg),
                            backgroundColor: Colors.red,
                          ),
                        );
                        print("error: ${state.errorMsg}");
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
                            print("signUp Tapped");
                            print("Name: ${nameController.text}");
                            print("Phone: ${phoneController.text}");
                            print("Email: ${emailController.text}");
                            print("Password: ${passController.text}");

                            context.read<UserBloc>().add(UserRegistrationEvent(
                              email: emailController.text,
                              pass: passController.text,
                              name: nameController.text,
                              phone: phoneController.text,
                            ));

                            // Navigator.push(context, MaterialPageRoute(builder: (ctx){
                            //   return WelcomePage();
                            // }));
                          },
                          child: Container(
                            height: 45,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Const.themeColor,
                              borderRadius: BorderRadius.circular(21),
                            ),
                            child: Center(
                              child: isLoading ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(),
                                  SizedBox(width:7,),
                                  Text("Signing up..."),
                                ],
                              ): Text(
                                "Sign up",
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
                      Text("Already have an account?",style: TextStyle(fontSize: 13.6,color: Colors.grey.shade500),),
                      SizedBox(width: 5,),
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                          //Navigator.pushReplacementNamed(context, AppRoutes.DASHBOARD);
                        },
                          child: Text("Sign in",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Const.themeColor),)),
                    ],
                  ),
                  SizedBox(height: 10,),
                  /*Row(
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
                  ),*/
                 /* SizedBox(height: 25,),
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
                            Image.asset("assets/images/twitter.png", width: 22, height: 22),
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
                  SizedBox(height: 15,),*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}