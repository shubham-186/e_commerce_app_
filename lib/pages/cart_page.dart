import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../const/constants.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Const.whiteColor,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        foregroundColor: Colors.black,
        backgroundColor: Const.whiteColor,
        title:Text("My Cart",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
            leading: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 4),
                itemCount:5 ,itemBuilder: (ctx,index){
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: Card(
                  color: Colors.white,
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: 3),
                            Container(
                              height: 65,
                              width: 65,
                              // decoration: BoxDecoration(border: Border.all(width: 1)),
                              child: Image.asset("assets/icons/airdopes.png"),
                            ),
                            SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 235,
                                  height: 35,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("True Wireless Airdopes", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500,height: 1.1)),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(
                                          "assets/icons/bin.png",
                                          width: 20,
                                          height: 20,
                                          color: Colors.pink,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                // SizedBox(height: 1), // 👈 Gap controlled
                                Text(
                                  "Electronics",
                                  style: TextStyle(fontSize: 12, color: Colors.grey.shade400, fontWeight: FontWeight.w400,height: 1.1),
                                ),
                                SizedBox(height: 6,),
                                Container(
                                  width: 235,
                                  height: 40,
                                  // decoration: commonBorderDecoration(),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("\$100.00",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
                                      Container(
                                        width: 120,
                                        height: 32,
                                        decoration: BoxDecoration(
                                            color: Color(0x86F7F7F7),
                                            border: Border.all(width: 1,color: Colors.grey.shade200),
                                            borderRadius: BorderRadius.circular(22)
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            IconButton(onPressed: (){}, icon: Icon(Icons.remove,size: 18,color: Colors.black87,)),
                                            Text("1"),
                                            IconButton(onPressed: (){}, icon: Icon(Icons.add,size: 18,)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
          SizedBox(height: 5,),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 227,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  // boxShadow: [
                  // BoxShadow(
                  // color: Colors.grey.withOpacity(0.5),
                  // offset: Offset(0, 6), // 👈 negative y-offset = shadow upar se aayega
                  // blurRadius: 6,
                  // spreadRadius: 8,
                  // ),
                  // ],
                  border: Border.all(color: Colors.grey.shade200, width: 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28),
                  )),
              child: Column(
                children: [
                  SizedBox(height: 12,),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    // decoration: commonBorderDecoration(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 9.5),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              style: TextStyle(fontSize: 12,color: Colors.black12),
                              decoration: InputDecoration(
                                  filled: true, // 👈 Yeh zaruri hai!
                                  fillColor: Colors.grey.shade50,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                                  hintText: "Enter Discount Code",
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(32),
                                      borderSide: BorderSide(color: Colors.grey.shade50)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(32),
                                      borderSide: BorderSide(color: Colors.grey.shade50)
                                  )
                              ),
                            ),
                          ),
                          SizedBox(width: 7,),
                          Text("Apply",style: TextStyle(
                              fontSize: 12,
                              color: Colors.pink,
                              fontWeight: FontWeight.w600
                          ),)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)
                      ),
                      color: Colors.white,
                      elevation: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Subtotal",style: TextStyle(fontSize: 12,color: Colors.grey.shade500),),
                            Text("\$245.00",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 6,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:8 ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total"),
                        Text("\$245.00",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                      ],
                    ),
                  ),
                  SizedBox(height: 12,),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26),
                    ),
                    elevation: 3, // Shadow depth (zyada karna ho to increase karo)
                    child: GestureDetector(
                      onTap: (){
                        /// loginTapped
                        // print("Login Tapped");
                        // Navigator.push(context, MaterialPageRoute(builder: (ctx){
                        //   return WelcomePage();
                        // }));
                      },
                      child: Container(
                        height: 49,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: Center(
                          child: Text(
                            "Checkout",
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}