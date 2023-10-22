import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_signin/pages/Profile_page.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<void> signInWithGoogle() async{

    //create an instance of firebase auth and google signIn
    FirebaseAuth auth= FirebaseAuth.instance;
    final GoogleSignIn googleSignIn=GoogleSignIn();

    //Trigger the authentication flow
    final GoogleSignInAccount? googleUser=await googleSignIn.signIn();

    //Obtain the auth details from request
    final GoogleSignInAuthentication googleAuth=await googleUser!.authentication;

    //create a new credentials
    final AuthCredential credential=GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );

    //Sign in the user with credentials
    final UserCredential userCredential=await auth.signInWithCredential(credential);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xffB56576),
        title: const Text('Google SignIn'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: GestureDetector(
            onTap: ()async{
              //Implementation Google Sign In Functionality
              await signInWithGoogle();
              if(mounted){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ProfilePage(),)
                );
              }
            },
            child: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.grey)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Image.asset('assets/images/google_logo.jpeg',
                      height: 45,
                      width: 45,
                    ),
                  ),
                  const SizedBox(width: 10,),
                  const Text("Continue with google"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
