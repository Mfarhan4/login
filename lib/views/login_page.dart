import 'package:flutter/material.dart';
import 'package:login_projects/provider/user_provider.dart';
import 'package:login_projects/views/home_page.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  final _passwordController=TextEditingController();
  final _emailController=TextEditingController();
  final _key =GlobalKey<FormState>();
  Widget build(BuildContext context) {

    return Scaffold(
      body: Form(
        key:_key ,
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0,right: 18),
            child: SingleChildScrollView(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Container(
                      height: 170,
                      width: 170,
                      child: Image.asset("assets/logo.jpg",fit: BoxFit.cover,),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "by jpg consulting Partners",
                        style: TextStyle(fontWeight: FontWeight.w300,letterSpacing: 0.8),
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome",

                        style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "sign in for continue",
                        style: TextStyle(fontWeight: FontWeight.w300,letterSpacing: 0.8),
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),

                  TextFormField(
                    controller: _emailController,
                    validator:  (value){
                      if(value!.isEmpty){
                        return"Enter Email";
                      }
                    },
                    decoration: InputDecoration(
                      focusedBorder:
                          OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                width: 0.2,
                              )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 0.2,
                            color: Colors.black
                          )),
                      hintText: "Enter your email",
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.email,color: Colors.black38,)


                    ),
                    keyboardType:TextInputType.emailAddress,
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
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
                            borderSide: BorderSide(
                              width: 0.2,
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                width: 0.2,
                                color: Colors.black
                            )),
                        hintText: "Password",
                        fillColor: Colors.white,
                        suffixIcon: IconButton(onPressed: (){},icon: Icon(Icons.visibility_off),),
                        filled: true,
                        prefixIcon: Icon(Icons.lock,color: Colors.black38,)


                    ),
                    keyboardType:TextInputType.visiblePassword,
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 3.0),
                          child: Container(height: 20,width: 20,decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),border: Border.all(color: Colors.black,width: 0.4)),),
                        ),
                        SizedBox(width: 5,),
                        Text("Remember me",style: TextStyle(fontWeight: FontWeight.w300,),),
                      ],
                    ),
                    Row(children: [
                      Text("Forgot password?",style: TextStyle(color: Colors.blueAccent),),
                    ],)
                  ],),
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      Expanded(child:
                      ElevatedButton(onPressed: ()async{
                        if(_key.currentState!.validate()){
                        final userProvider=Provider.of<UserProvider>(context,listen:false);
                       await userProvider.singIn(_emailController.text, _passwordController.text);

                       if(userProvider.user!=null){
                        Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));}
                       else{
                         debugPrint("not login");
                       }}
                      }, child: Text("Login "),style: ElevatedButton.styleFrom(primary: Colors.blueAccent,minimumSize: Size(40, 60),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),)
                        ,),
                      SizedBox(width: 5,),
                      ElevatedButton(onPressed: (){


                      }, child: Icon(Icons.fingerprint_sharp,size: 40,),style: ElevatedButton.styleFrom(primary: Colors.blueAccent,minimumSize: Size(40, 60),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),)
                    ],
                  ),
                  SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "or continue with",
                        style: TextStyle(fontWeight: FontWeight.w300,letterSpacing: 0.8),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(child:
                      ElevatedButton(onPressed: (){}, child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.g_mobiledata),
                          SizedBox(width: 5,),
                          Text("Google"),
                        ],
                      ),style: ElevatedButton.styleFrom(primary: Colors.deepOrangeAccent,minimumSize: Size(20, 45),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),)
                        ,),
                      SizedBox(width: 5,),
                      Expanded(child:
                      ElevatedButton(onPressed: (){


                      }, child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.facebook),
                          SizedBox(width: 5,),
                          Text("Facebook"),
                        ],
                      ),style: ElevatedButton.styleFrom(primary: Colors.blue,minimumSize: Size(20, 45),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),)
                        ,),
                    ],
                  ),
                  SizedBox(height: 40,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                   Text("Don't Have an Account? "),
                   Text("Sign Up",style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold),),
                 ],),
                  SizedBox(height: 30,),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
