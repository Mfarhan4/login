import 'package:flutter/material.dart';
import 'package:login_projects/provider/client_provider.dart';
import 'package:login_projects/provider/user_provider.dart';
import 'package:login_projects/widgets/text_field.dart';
import 'package:provider/provider.dart';

class AddClientDataPage extends StatefulWidget {
  const AddClientDataPage({Key? key}) : super(key: key);

  @override
  State<AddClientDataPage> createState() => _AddClientDataPageState();
}

class _AddClientDataPageState extends State<AddClientDataPage> {


  final  _nameController =TextEditingController();
  final  _companyController =TextEditingController();
  submitMethod(context)async{

    if(_key.currentState!.validate()){
    final clientProvider=Provider.of<ClientProvider>(context,listen: false);
    final userProvider=Provider.of<UserProvider>(context,listen: false);
    if(userProvider.user!=null) {
      await clientProvider.saveClient(userProvider.user!.uid,_nameController.text,_companyController.text);
     // Navigator.pop(context);
    }
   // _nameController.clear();
    //_companyController.clear();
    }
  }
  final _key=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final clientProvider=Provider.of<ClientProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(title: const Text("Form")),
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0,right: 18,top: 18),
        child: SingleChildScrollView(

          child: Form(
            key:_key ,
            child: Column(children: [
              const SizedBox(height: 20,),
              CustomTextField(hint: "Enter Name", controller: _nameController,msg: "Enter Name"),
              const SizedBox(height: 30,),
              CustomTextField(hint: "Enter Company  Name", controller: _companyController,msg: "Enter Company Name",),
              SizedBox(height: 160,),
              Padding(
                padding: const EdgeInsets.only(left: 28.0,right: 28),
                child: Row(
                  children: [
                    Expanded(child: ElevatedButton(onPressed: ()async{
                      await submitMethod(context);

                     // await clientProvider.saveClient();
                    }, child: const Text("Submit"),)),
                  ],
                ),
              ),


            ],),
          ),
        ),
      ),
    );
  }
}
