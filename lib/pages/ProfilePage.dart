import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  Future<void> logOut()async {
    final GoogleSignIn googleSign= GoogleSignIn();
    await googleSign.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Profile Page',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),),
            SizedBox(height: 10),
            ElevatedButton(onPressed: ()async{
              await logOut();
              Navigator.pop(context);
            }, child: Text('SignOut')),

          ],
        ),
      ),
    );
  }
}
