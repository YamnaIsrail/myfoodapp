import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:sign_in_button/sign_in_button.dart';
import '../screens/home_screen/homescreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();// Initialize Firebase

  runApp(const signIn());
}

class signIn extends StatefulWidget {
  const signIn({super.key});

  @override

  State<signIn> createState() => _signInState();
}

class _signInState extends State<signIn> {
  late UserProvider userProvider;

  Future<User?> _googleSignUp() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        // Handle the case when the user cancels sign-in or it fails
        return null;
      }

      final GoogleSignInAuthentication? googleAuth =
      await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final UserCredential userCredential =
      await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user != null) {
        userProvider.addUserData(
          currentUser: user ,
          userName: user.displayName ?? "Unknown User",
          userImage: user.photoURL ?? "",
          userEmail: user.email ?? "No Email",
        );
      }

      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


  @override
  Widget build(BuildContext context) {
    userProvider=  Provider.of<UserProvider>(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/background1.jpg')
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 400,

              width: double.infinity,
              child: Column(
                children: [
                  Text('Sign in to continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,

                    ),
                  ),

                  Text('Food Flows',
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontFamily: "Lobster",
                        shadows: [
                          BoxShadow(
                              blurRadius: 15,
                              color: Colors.blue.shade100,
                              offset: Offset(3,3)
                          )
                        ]
                    ),
                  ),

                  SizedBox(height: 50,),


                  // with custom text
                  SignInButton(
                    Buttons.google,
                    text: "Sign in with Google",
                    onPressed: ()
                    {
                      _googleSignUp().then((value) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ));
                      });
                    },
                  ),

                  SizedBox(height: 20,),

                  // with custom text
                  SignInButton(
                    Buttons.apple,
                    text: "Sign in with Apple",
                    onPressed: () {},
                  ),

                  SizedBox(height: 50),

                  Center(
                    child: RichText(
                        text: TextSpan(
                            text: 'By Signing in you are agreeing to our   ' ,style: TextStyle(
                            color: Colors.blueGrey
                        ),
                            children: [
                              TextSpan(
                                  text: 'Terms and Services  ' ,
                                  style: TextStyle(
                                    // decoration: TextDecoration.underline,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold ,
                                    //fontSize: 18
                                  )
                              ),

                            ]
                        )
                    ),
                  )


                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
