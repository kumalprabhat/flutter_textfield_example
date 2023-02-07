import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:textfield_example/home.dart';

void main(){
  runApp(const MaterialApp(home: MyApp(),));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("TextField"),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const [
              UserAccountsDrawerHeader(
                accountName: Text("John Doe"),
                accountEmail: Text("johndoe@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text('J',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),

              ),
              ListTile(
                leading: Icon(Icons.contacts),
                title: Text('Contact Us'),
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [

                Image.asset('assets/login.png'),
                TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                      hintText: 'Enter Username'
                  ),
                ),
                const SizedBox(height: 16.0,),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter Password'
                  ),
                ),
                const SizedBox(height: 16.0,),
                SizedBox(
                  width: 200.0,
                  height: 50.0,
                  child: ElevatedButton(
                    child: const Text('Login'),
                    onPressed: (){
                      if(!usernameController.text.isEmpty && !passwordController.text.isEmpty){
                        showAlertDialog(context);
                      }else{
                        final scaffold = ScaffoldMessenger.of(context);
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Please enter username and password"),
                        ));
                      }
                    },
                  ),
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
  showAlertDialog(BuildContext context){
    Widget okButton = ElevatedButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
        },
        child: Text('Ok')
    );

    AlertDialog alert = AlertDialog(
      title: Text('Login'),
      content: Text('Want to Login?'),
      actions: [
        okButton
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context){
          return alert;
        }
    );
  }
}

