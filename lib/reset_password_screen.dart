import 'package:explora_world/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class reset_password extends StatefulWidget {
  const reset_password({Key? key}) : super(key: key);

  @override
  State<reset_password> createState() => _reset_passwordState();
}

class _reset_passwordState extends State<reset_password> {


  TextEditingController _emailController =TextEditingController();
  GlobalKey<FormState> _key=GlobalKey();
  bool isLoading =false;

  var _auth=FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: SafeArea(
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              InkWell(
                onTap: ()async{
                  if(_key.currentState!.validate()){
                    try{
                      setState(() {
                        isLoading=true;
                      });
                      await _auth.sendPasswordResetEmail(email: _emailController.text);
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>log_in()));
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Email has been sent to you")));
                      setState(() {
                        isLoading=false;
                      });

                    }catch(e){
                      setState(() {
                        isLoading=false;
                      });

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
                    ): Text("Reset password",style: GoogleFonts.ubuntu(
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
            ],
          ),
        ),
      ),
    );
  }
}
