import 'dart:math';

import 'package:explora_world/home_screen.dart';
import 'package:explora_world/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class sign_in extends StatefulWidget {
  const sign_in({Key? key}) : super(key: key);

  @override
  State<sign_in> createState() => _sign_inState();
}

class _sign_inState extends State<sign_in> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _key=GlobalKey();
  bool isLoading =false;


  var _auth=FirebaseAuth.instance;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 130,),
                  Center(
                    child: Text("EXPLORA",style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                        color: Color(0xffFF9900),
                        fontWeight: FontWeight.w700,
                        fontSize: 45,
                      ),
                    ),),
                  ),
                  SizedBox(height: 10,),
                  Text("- IF NOT NOW, WHEN?-",style: GoogleFonts.ubuntu(
                    textStyle: TextStyle(
                      letterSpacing: 3,
                      color: Color(0xffFF9900),
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),),
                  SizedBox(height: 60,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: '   Name',
                            hintStyle: TextStyle(
                                color: Color(0xffB6B6B6)
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide(color: Colors.orange,width: 2 )

                            )

                        )
                    ),
                  ),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(
                      validator: (value){
                        if(value!.isEmpty){
                          return "Email must be filled";
                        };
                      },
                      controller: _emailController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                          filled: true,
                            fillColor: Colors.white,
                            hintText: '   Email ID',
                            hintStyle: TextStyle(
                                color: Color(0xffB6B6B6)
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide(color: Colors.orange,width: 2 )

                            )

                        )
                    ),
                  ),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(
                      validator: (value){
                        if(value!.isEmpty){
                          return "password must be filled";
                        }else if(value!.length <6){
                          return "password must be greater then 6 digit";
                        }
                      },
                      obscureText: true,
                      controller: _passwordController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                          fillColor: Colors.white,
                            filled: true,
                            hintText: '   Password',
                            hintStyle: TextStyle(
                                color: Color(0xffB6B6B6)
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide(color: Colors.orange,width: 2)
                            )

                        )
                    ),
                  ),
                  SizedBox(height: 15,),
                  InkWell(
                    onTap: () async{

                      if(_key.currentState!.validate()){
                        try{
                          setState(() {
                            isLoading=true;
                          });
                          await _auth.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
                          setState(() {
                            isLoading=false;
                          });
                          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>log_in()));

                        }catch(e){
                          setState(() {
                            isLoading=false;
                          });
                          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                        }

                      }else{
                        print("error");
                      }

                    },
                    child: Container(
                      height: 43,
                      width: 179,
                      child: Center(
                        child:isLoading?CircularProgressIndicator(
                          color: Colors.red,
                        ): Text("SIGN IN",style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 3
                            )
                        ),),
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xffFF9900),
                        borderRadius: BorderRadius.circular(16),

                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Divider(
                    endIndent: 100,
                    indent: 100,
                    thickness: 1,
                    color: Color(0xffFF9900),

                  ),
                  Text("Forget your password?",style: GoogleFonts.ubuntu(
                    textStyle: TextStyle(
                      color: Color(0xffB6B6B6),
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),),
                  SizedBox(height: 100,),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>sign_in()));
                          },
                          child: Icon(Icons.keyboard_arrow_up_sharp,color: Color(0xffFF9900),size: 50,))),


                ]
            ),
          ),
        ),
      ),
    );
  }
}

