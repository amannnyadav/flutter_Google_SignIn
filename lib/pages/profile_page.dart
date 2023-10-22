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
            const Text('Profile Page',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: ()async{
              await logOut();
              Navigator.pop(context);
            }, child: const Text('SignOut')),

          ],
        ),
      ),
    );
  }
}
