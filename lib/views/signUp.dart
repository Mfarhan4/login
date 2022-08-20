import 'package:flutter/material.dart';
import 'package:login_projects/palette/palette.dart';
import 'package:login_projects/widgets/custom_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController=TextEditingController();
  final _lastNameController=TextEditingController();
  final _firstNameController=TextEditingController();

  final _passwordController=TextEditingController();
  final _key=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Container(
          decoration: const BoxDecoration(image: const DecorationImage(image: AssetImage("assets/image2.jpg"),fit: BoxFit.fill)),
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0,right: 18),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 1,
              width:  MediaQuery.of(context).size.width * 1,
              child: Form(
                key: _key,
                child: SingleChildScrollView(

                  child: Column(children: [
                      const SizedBox(height: 150,),
                      const CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        child: const FittedBox( child: const Icon(Icons.person,size: 160,color: Palette.color,)),
                      ),
                    const SizedBox(height: 30,),
                    SizedBox(height: 15,),
                    TextFormField(
                   textAlign: TextAlign.center,
                      controller: _firstNameController,
                      validator:  (value){
                        if(value!.isEmpty){
                          return"Enter First Name";
                        }
                      },
                      decoration: InputDecoration(
                          focusedBorder:
                          OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                width: 0.2,
                                  color: Palette.color
                              )),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                width: 0.2,
                                  color: Palette.color
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  width: 0.2,
                                  color: Palette.color
                              )),
                          hintText: "       First Name",
                          fillColor: Colors.white,
                          filled: true,



                      ),
                      keyboardType:TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 15,),
                    TextFormField(

                      validator:  (value){
                        if(value!.isEmpty){
                          return"Enter Last Name";
                        }

                      },
                      textAlign: TextAlign.center,
                      controller: _lastNameController,
                      decoration: InputDecoration(
                          focusedBorder:
                          OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                width: 0.2,
                                  color: Palette.color
                              )),
                          border:  OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                width: 0.2,
                                  color: Palette.color
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  width: 0.2,
                                  color: Palette.color
                              )),
                          hintText: "Last name",


                          fillColor: Colors.white,

                          filled: true,



                      ),
                      keyboardType:TextInputType.visiblePassword,
                    ),
                    const SizedBox(height: 15,),
                    TextFormField(
                   textAlign: TextAlign.center,
                      controller: _emailController,
                      validator:  (value){
                        if(value!.isEmpty){
                          return"Enter Email";
                        }
                      },
                      decoration: InputDecoration(
                          focusedBorder:
                          OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                width: 0.2,
                                  color: Palette.color
                              )),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
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
                          prefixIcon: const Icon(Icons.email,color:Palette.color,)


                      ),
                      keyboardType:TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 15,),
                    TextFormField(
                      textAlign: TextAlign.center,
                      validator:  (value){
                        if(value!.isEmpty){
                          return"Enter password";
                        }
                        else if(value.length <8){
                          "Password Greater than 8 char";
                        }
                      },
                      controller: _passwordController,
                      decoration: InputDecoration(
                          focusedBorder:
                          OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                width: 0.2,
                                  color: Palette.color
                              )),
                          border:  OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                width: 0.2,
                                color: Palette.color
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  width: 0.2,

                                  color: Palette.color
                              )),
                          hintText: "Password",
                          fillColor: Colors.white,
                          suffixIcon: IconButton(onPressed: (){},icon: const Icon(Icons.visibility_off,),),
                          filled: true,
                          prefixIcon: const Icon(Icons.lock,color: Palette.color,)


                      ),
                      keyboardType:TextInputType.visiblePassword,
                    ),
                    SizedBox(height: 50,),
                    Row(children: [
                      Expanded(child:
                       CustomButton(onClick: (){},text: "SignUp",)
                        ,)
                    ],)
                  ],),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
