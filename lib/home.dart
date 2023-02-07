import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Home(),
  ));
}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
      ),
      body: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.0,),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.person),
                      labelText: 'Name',
                      hintText: 'Enter Name'
                    ),
                    validator: (value){
                      if(value!.isNotEmpty){
                        return null;
                      }
                      return 'Please Enter Name';
                    }
                  ),
                  SizedBox(height: 16.0,),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.phone),
                      labelText: 'Phone',
                      hintText: 'Enter Phone number'
                    ),
                    validator: (value){
                      if(value!.isNotEmpty){
                        return null;
                      }
                      return 'Enter Phone number';
                    },
                  ),
                  SizedBox(height: 16.0,),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.calendar_today),
                      labelText: 'DOB',
                      hintText: 'Enter DOB'
                    ),
                    validator: (value){
                      if(value!.isNotEmpty){
                        return null;
                      }
                      return 'Enter DOB';
                    },
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                      padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                      child: ElevatedButton(
                        child: const Text('Submit'),
                        onPressed: () {
                          if(_formKey.currentState!.validate()){
                            final scaffold = ScaffoldMessenger.of(context);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Processing..."),
                            ));
                          }
                        },
                      )),
                ],
              )
          ),
        ),
      ),
    );
  }
}


