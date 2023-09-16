import 'package:explora_world/login_screen.dart';
import 'package:explora_world/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class onbording extends StatelessWidget {
  const onbording({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F4F2),
      body: SafeArea(child:
      Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Container(
          height: 900,
          width: double.infinity,
          decoration: BoxDecoration(
            image:DecorationImage(
              image: AssetImage("images/onbording.png"),
              // fit: BoxFit.cover,
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("EXPLORA",style: GoogleFonts.ubuntu(
            textStyle: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.w700,
              color: Color(0xffFF9900),
            )
          )
              ),
              SizedBox(height: 10,),
              Text("-  IF NOT NOW, WHEN? -",style: GoogleFonts.ubuntu(textStyle:
              TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: Color(0xffFF9900)
              )),),
              SizedBox(height: 88,),
              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (_)=>log_in()));

                },
                child: Container(
                  height: 43,
                  width: 179,
                  child: Center(
                    child: Text("LOG IN",style: GoogleFonts.ubuntu(
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
              SizedBox(height: 17,),
              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (_)=>sign_in()));
              },
                child: Container(
                  height: 43,
                  width: 179,
                  child: Center(
                    child: Text("SIGN IN",style: GoogleFonts.ubuntu(
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
              Icon(Icons.keyboard_arrow_up_sharp,color: Color(0xffFF9900),size: 50,),
              SizedBox(height: 250,),

            ],
          ),
        ),
      )
      ),
    );
  }
}
