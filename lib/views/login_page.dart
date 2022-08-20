import 'package:flutter/material.dart';
import 'package:login_projects/dialog/dialog.dart';
import 'package:login_projects/provider/user_provider.dart';
import 'package:login_projects/views/forget_password.dart';
import 'package:login_projects/views/home_page.dart';
import 'package:login_projects/views/signUp.dart';
import 'package:provider/provider.dart';

import '../palette/palette.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _passwordController=TextEditingController();
  final _emailController=TextEditingController();
  final _key =GlobalKey<FormState>();
  bool check=false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Form(
        key:_key ,
        child: Container(
          decoration: BoxDecoration(image: DecorationImage(image:AssetImage("assets/image2.jpg",),fit: BoxFit.fill )),
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0,right: 18),
            child: SingleChildScrollView(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  const SizedBox(
                    height: 110,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      Text(
                        "Welcome",

                        style: TextStyle(fontSize: 39,fontWeight: FontWeight.bold,color:Colors.white),
                      ),
                    ],),
                  const SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      Text(
                        "sign in for continue",
                        style: TextStyle(fontWeight: FontWeight.w300,letterSpacing: 0.8,fontSize: 15,color:Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60,),
                  TextFormField(
                    textAlign: TextAlign.center,
                    controller: _emailController,
                    validator:  (value){
                      if(value!.isEmpty){
                        return "Enter Email,";
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
                              width: 0.2,color: Palette.color

                            )),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                width: 0.2,
                                color: Palette.color
                            )),
                        hintText: "Password",
                        fillColor: Colors.white,
                        suffixIcon: IconButton(onPressed: (){},icon: const Icon(Icons.visibility_off),),
                        filled: true,
                        prefixIcon: const Icon(Icons.lock,color:Palette.color,)


                    ),
                    keyboardType:TextInputType.visiblePassword,
                  ),
                  const SizedBox(height: 35,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 3.0),
                          child: InkWell(
                            onTap: (){
                              setState((){
                                if(check){
                                  check=false;
                                }
                                else
                                  {
                                    check=true;
                                  }
                              });
                            },
                            child: Container(height: 20,width: 20,decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),border: Border.all(color:Palette.color,width: 0.4)),
                            child: FittedBox(child:  check?Icon(Icons.done,color:Colors.white,):SizedBox()),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5,),
                         Text("Remember me",style: TextStyle(fontWeight: FontWeight.w300,color:Colors.white),),
                      ],
                    ),
                    Row(children:  [
                      InkWell(
                          onTap: (){
                           Navigator.push(context, MaterialPageRoute(builder: (_) => ForgetPasswordPage()));
                          },
                          child
                          : Text("Forgot password?",style: TextStyle(color:Colors.white),)),
                    ],)
                  ],),
                  const SizedBox(height: 40,),
                  Row(
                    children: [
                      Expanded(child:
                      ElevatedButton(onPressed: ()async{
                        if(_key.currentState!.validate()){
                        final userProvider=Provider.of<UserProvider>(context,listen:false);
                       await userProvider.singIn(_emailController.text, _passwordController.text);

                       if(userProvider.user!=null){
                      //  Navigator.push(context, MaterialPageRoute(builder: (_) => const HomePage()));
                        }
                       else{
                         debugPrint("not login");
                       }}
                      }, child: const Text("Login ",style: TextStyle(color: Colors.white),),style: ElevatedButton.styleFrom(primary:Palette.color,minimumSize: const Size(40, 60),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),)
                        ,),
                      const SizedBox(width: 5,),
                      ElevatedButton(onPressed: (){


                      }, child: const Icon(Icons.fingerprint_sharp,size: 40,color: Colors.white,),style: ElevatedButton.styleFrom(primary: Palette.color,minimumSize: const Size(40, 60),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),)
                    ],
                  ),
                  const SizedBox(height: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "or continue with",
                        style: TextStyle(fontWeight: FontWeight.w300,letterSpacing: 0.8,color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      Expanded(child:
                      ElevatedButton(onPressed: (){



                      //  DialogServices.dialogPop();
                      }, child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.g_mobiledata,color: Colors.white,),
                          SizedBox(width: 5,),
                          Text("Google",style: TextStyle(color: Colors.white),),
                        ],
                      ),style: ElevatedButton.styleFrom(primary:Palette.color,minimumSize: const Size(20, 45),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),)
                        ,),
                      const SizedBox(width: 5,),
                      Expanded(child:
                      ElevatedButton(onPressed: (){

                      }, child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.facebook,color: Colors.black,),
                          SizedBox(width: 5,),
                          Text("Facebook",style: TextStyle(color: Colors.black),),
                        ],
                      ),style: ElevatedButton.styleFrom(primary: Colors.white,minimumSize: const Size(20, 45),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),)
                        ,),
                    ],
                  ),
                  const SizedBox(height: 30,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                    Text("Don't Have an Account? ",style:  TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),
                   InkWell(
                       onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (_) => SignUpPage()));
                       },
                       child:  Text("Sign Up",
                         style:  TextStyle( color: Palette.color,fontWeight: FontWeight.bold),)
                   ),
                 ],),
                  const SizedBox(height: 30,),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
