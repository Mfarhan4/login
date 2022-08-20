import 'package:flutter/material.dart';

import '../palette/palette.dart';
import '../widgets/custom_button.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(

        child: Container(
          decoration: const BoxDecoration(image: const DecorationImage(image: AssetImage("assets/image2.jpg"),fit: BoxFit.fill)),
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0,right: 18),
          child: Column(children: [
              SizedBox(height: 190,),
              TextFormField(
                textAlign: TextAlign.center,
              //  controller: _emailController,
                validator:  (value){
                  if(value!.isEmpty){
                    return "Enter Email,";
                  }
                },
                decoration: InputDecoration(
                    focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                        borderSide:  BorderSide(
                            width: 0.2,
                            color: Palette.color
                        )),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                        borderSide:  BorderSide(
                            width: 0.2,
                            color: Palette.color
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            width: 0.2,
                            color: Palette.color
                        )),
                    hintText: "Enter your email",
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: const Icon(Icons.email,color: Palette.color,)


                ),
                keyboardType:TextInputType.emailAddress,
              ),
              const SizedBox(height: 15,),
              TextFormField(
                textAlign: TextAlign.center,
                validator:  (value){
                  if(value!.isEmpty){
                    return"Enter Email";
                  }
                  else if(value.length <8){
                    "Password Greater than 8 char";
                  }
                },
               // controller: _passwordController,
                decoration: InputDecoration(
                    focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            width: 0.2,
                            color: Palette.color
                        )),
                    border:  OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            width: 0.2,color: Palette.color

                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            width: 0.2,
                            color: Palette.color
                        )),
                    hintText: "New Password",
                    fillColor: Colors.white,
                    suffixIcon: IconButton(onPressed: (){},icon: const Icon(Icons.visibility_off),),
                    filled: true,
                    prefixIcon: const Icon(Icons.lock,color:Palette.color,)


                ),
                keyboardType:TextInputType.visiblePassword,
              ),
              const SizedBox(height: 15,),
              TextFormField(
                textAlign: TextAlign.center,
                validator:  (value){
                  if(value!.isEmpty){
                    return"Enter Email";
                  }
                  else if(value.length <8){
                    "Password Greater than 8 char";
                  }
                },
                // controller: _passwordController,
                decoration: InputDecoration(
                    focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            width: 0.2,
                            color: Palette.color
                        )),
                    border:  OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            width: 0.2,color: Palette.color

                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            width: 0.2,
                            color: Palette.color
                        )),
                    hintText: "Conform Password",
                    fillColor: Colors.white,
                    suffixIcon: IconButton(onPressed: (){},icon: const Icon(Icons.visibility_off),),
                    filled: true,
                    prefixIcon: const Icon(Icons.lock,color:Palette.color,)


                ),
                keyboardType:TextInputType.visiblePassword,
              ),
            SizedBox(height: 110,),
            Row(children: [
              Expanded(child:
              CustomButton(onClick: (){},text: "Done",)
                ,)
            ],)


            ],),
          ),
        ),
      ),
    );
  }
}
