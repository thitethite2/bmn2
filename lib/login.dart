import 'package:flutter/material.dart';

void main(){
  runApp(const LoginPage());
}

class LoginPage extends StatelessWidget{
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  MaterialApp(
      title: 'Login Page',
        theme:ThemeData(
          primarySwatch: Colors.blue,
        ),
      home: const LoginScreen(),

    );
  }

}


class LoginScreen extends StatelessWidget{
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: ..................
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: "email",
                labelStyle: TextStyle(fontSize: 13.0),
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),

              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16.0),
            const TextField(
              decoration: InputDecoration(
                labelText: "Enter your password",
                labelStyle: TextStyle(fontSize: 13.0),
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.password),
                suffixIcon: Icon(Icons.visibility)
              ),
              keyboardType: TextInputType.visiblePassword,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
                onPressed:  ()=> print('hello'),
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold
                    ),
                  foregroundColor: Colors.white,
                  backgroundColor:Colors.black ,
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Change this value for more or less rounding
                  ),


                ),

                child: const Text('login'),

            ),
            const SizedBox(height: 32.0),
            const Text("forgot password")
          ],
        ),
      ),
    );

  }

}