import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final email_controller = TextEditingController();
  final passwork_controller = TextEditingController();
  void dispose(){
    email_controller.dispose();
    passwork_controller.dispose();
    super.dispose();
  }
  Future SignIn() async {
  await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email_controller.text.trim(),
    password: passwork_controller.text.trim(),
  );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.only(top: 100,left: 30),
        child: Column(
          children: [
            Row(
              children: [
                Text('Gmail',style: TextStyle(fontSize: 20),),
                SizedBox(width: 30,),
                 Container(
                  height: 30,
                  width: 200,
                  color: Colors.grey,
                  child: TextField(
                    controller: email_controller,
                  decoration: InputDecoration(
                    hintText: 'Gmail'
                  ),
                ),
                 ),
              ],
            ),
            SizedBox(height: 50,),
                Row(
              children: [
                Text('Password',style: TextStyle(fontSize: 20),),
                SizedBox(width: 20,),
                    Container(
                  height: 30,
                  width: 200,
                  color: Colors.grey,
                  child: TextField(
                    controller: passwork_controller,
                  decoration: InputDecoration(
                    hintText: 'Password'
                  ),
                ),
                 ),
              ],
            ),
            CupertinoButton(child: Text('Save'), onPressed: SignIn)
          ],
        ),
      ),
    );
  }
}