import 'dart:io';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utlils/constants/app_constants.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? selectedImage;
  @override
  void initState() {
    a_loadImagePath();
    super.initState();
  }
  void _saveImagePath(String path) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('profile_image_path', path);
  }
  a_loadImagePath()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    final path = pref.getString("profile_image_path");
    if(path != null){
      setState(() {
        selectedImage = File(path);
      });
    }
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:Const.whiteColor,
      appBar:AppBar(
        centerTitle: true,
        foregroundColor:Colors.black,
      backgroundColor: Colors.white,
      title: Text("Profile",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
        actions: [
          GestureDetector(
            onTap: (){
              print("edit profile");
            },
            child: Image.asset("assets/icons/edit.png",
              height: 20,
              width: 20,
              color: Colors.pink,
            ),
          ),
          SizedBox(width: 12,)
        ],
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Column(
              children: [
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                      image: selectedImage != null?
                      DecorationImage(image: FileImage(selectedImage!)):
                      DecorationImage(image: AssetImage("assets/icons/profile.png",)),
                      shape: BoxShape.circle,
                      color: Colors.grey.shade400,
                      border: Border.all(
                          color: Colors.pink,
                          width: 3

                      )
                  ),
                ),
                SizedBox(height: 5,),
                GestureDetector(
                    onTap: ()async{
                      XFile? pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
                      if(pickedImage != null){
                        CroppedFile? croppedImg = await ImageCropper().cropImage(sourcePath: pickedImage.path,uiSettings: [
                          AndroidUiSettings(
                            lockAspectRatio: true,
                            initAspectRatio: CropAspectRatioPreset.square,
                          ),
                          IOSUiSettings()
                        ]);
                        if(croppedImg != null){
                          selectedImage = File(croppedImg.path);
                          _saveImagePath(croppedImg.path);
                          setState(() {});
                        }
                      }
                    },
                    child:Text("Edit",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.pink),),
                ),
                SizedBox(height: 12,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 72),
                  child: Container(
                    width: double.infinity,
                    height: 0.2,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade200,
                        width: 1
                      )
                    ),
                  ),
                ),
                SizedBox(height: 8,),
                Card(
                  elevation: 5,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 1
                        )
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.account_circle,size: 20,),
                          SizedBox(width: 7,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Name",style: TextStyle(fontWeight: FontWeight.w500),),
                              Text("Shubham",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12),),
                            ],
                          ),
                          Spacer(),
                          // Icon(Icons.arrow_forward_ios,size: 15,color: Colors.pink,),
                          SizedBox(width: 7,)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8,),
                Card(
                  elevation: 5,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.white,
                              width: 1
                          )
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.phone,size: 20,),
                          SizedBox(width: 7,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Phone",style: TextStyle(fontWeight: FontWeight.w500),),
                              Text("9478743382",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12),),
                            ],
                          ),
                          Spacer(),
                          // Icon(Icons.arrow_forward_ios,size: 15,color: Colors.pink,),
                          SizedBox(width: 7,)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8,),
                Card(
                  elevation: 5,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.white,
                              width: 1
                          )
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.pin_drop_rounded,size: 20,),
                          SizedBox(width: 7,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Address",style: TextStyle(fontWeight: FontWeight.w500),),
                              Text("ludhiana, Punjab",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12),),
                            ],
                          ),
                          Spacer(),
                          // Icon(Icons.arrow_forward_ios,size: 15,color: Colors.pink,),
                          SizedBox(width: 7,)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8,),
                GestureDetector(
                  onTap: (){

                  },
                  child: Card(
                    elevation: 5,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        height: 45,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.white,
                                width: 1
                            )
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.history,size: 20,),
                            SizedBox(width: 7,),
                            Text("Order History",style: TextStyle(fontWeight: FontWeight.w500),),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios,size: 15,color: Colors.pink,),
                            SizedBox(width: 7,)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8,),
                Card(
                  elevation: 5,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.white,
                              width: 1
                          )
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.logout,size: 20,),
                          SizedBox(width: 7,),
                          Text("Logout",style: TextStyle(fontWeight: FontWeight.w500),),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios,size: 15,color: Colors.pink,),
                          SizedBox(width: 7,)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8,),
                /*Card(
                  elevation: 5,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.white,
                              width: 1
                          )
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.headphones,size: 20,),
                          SizedBox(width: 7,),
                          Text("Costumer & Support",style: TextStyle(fontWeight: FontWeight.w500),),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios,size: 15,color: Colors.pink,),
                          SizedBox(width: 7,)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8,),
                Card(
                  elevation: 5,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.white,
                              width: 1
                          )
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.logout,size: 20,),
                          SizedBox(width: 7,),
                          Text("Logout",style: TextStyle(fontWeight: FontWeight.w500),),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios,size: 15,color: Colors.pink,),
                          SizedBox(width: 7,)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8,),*/
              ],
            ),
          ),
        ),
      )
    );
  }
}