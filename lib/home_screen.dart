import 'package:explora_world/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class home_screen extends StatefulWidget {
  const home_screen({Key? key}) : super(key: key);

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {

  condition(){
    if(_currentIndex==0){
      return Center(
        child: IconButton(onPressed: ()async{

          var _auth=await FirebaseAuth.instance;
          try{
            await _auth.signOut();
            Fluttertoast.showToast(msg: "You are now log out");
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>sign_in()));

          }catch(e){
            print(e.toString());
          }


        }, icon: Icon(Icons.logout))
      );
    }else if(_currentIndex==1){
      return Text("saved screen");
    }else if(_currentIndex==2){
      return Center(child: Text("my booking screen"));
    }else{
      return Center(child: Text("notifcation screen"));
    }
  }
  int _currentIndex=0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 75,
        width: double.infinity,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(0,1),
                blurRadius:8,
                spreadRadius: 0,
                color: Color(0xff000000).withOpacity(0.2),
              ),
            ],
          color: Color(0xFFFFFFFE),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 25,top: 14,right: 25,bottom: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: (){
                setState(() {
                  _currentIndex=0;
                });
              },
              child:_currentIndex==0?Container(
                height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Color(0xffE5E5E5),
                  ),
                  child: Icon(Icons.home,)):Icon(Icons.home,),

            ),
            InkWell(
              onTap: (){
                setState(() {
                  _currentIndex=1;
                });
              },
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _currentIndex==1?Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Color(0xffE5E5E5),),
                        child: Icon(Icons.bookmark,)):Icon(Icons.bookmark,)
                ],
              ),),
            InkWell(
              onTap: (){
                setState(() {
                  _currentIndex=2;
                });
              },
              child:_currentIndex==2?Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Color(0xffE5E5E5),),
                  child: Icon(Icons.book_sharp,)):Icon(Icons.book_sharp),

            ),
            InkWell(
              onTap: (){
                setState(() {
                  _currentIndex=3;
                });
              },
              child:_currentIndex==3?Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Color(0xffE5E5E5),),
                  child: Icon(Icons.notifications)):Icon(Icons.notifications,),

            ),

          ],
          ),
        ),
      ),
      backgroundColor: Color(0xffFCFCFC),
      body: condition(),
    );
  }
}
