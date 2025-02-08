// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:gofit/screens/auth/login.dart';
// import 'package:gofit/screens/main/styles.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class SignUp extends StatefulWidget {
//   const SignUp({super.key});

//   @override
//   State<SignUp> createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   // FocusNodes for each TextField
//   final FocusNode _nameFocusNode = FocusNode();
//   final FocusNode _emailFocusNode = FocusNode();
//   final FocusNode _passwordFocusNode = FocusNode();
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;
//   var userForm = GlobalKey<FormState>();
//   TextEditingController name = TextEditingController();
//   TextEditingController email = TextEditingController();
//   TextEditingController password = TextEditingController();

//   Future<void> createAccount() async{
//     try {
//       // Create user with email and password
//       UserCredential userCredential = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(
//               email: email.text, password: password.text);
      
//       // Update the user's display name after account creation
//       // Store username in Firestore
//       User? user = userCredential.user;
//       if (user != null) {
//         await firestore.collection('users').doc(user.uid).set({
//           'email': user.email,
//           'username': name.text,
//           'uid': user.uid,
//         });
//       }

//       // Show success message
//       // ignore: use_build_context_synchronously
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('User signed up successfully'), backgroundColor: Colors.green));

//       // Optionally, you can verify the email after user is created
//       // await userCredential.user?.sendEmailVerification();

//       // Navigate or show success message
//       // You can also navigate to the main screen after sign-up
//       // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SomeNextScreen()));
      
      
//     } catch (e) {
//       SnackBar messageSnackBar = const SnackBar(content: Text("Email address already exists"), backgroundColor: red);
//       // ignore: use_build_context_synchronously
//       ScaffoldMessenger.of(context).showSnackBar(messageSnackBar);
//       // ignore: avoid_print
//       print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(backgroundColor: white),
//       body: GestureDetector(
//         onTap: () {
//           // Unfocus all when tapping outside
//           _nameFocusNode.unfocus();
//           _emailFocusNode.unfocus();
//           _passwordFocusNode.unfocus();
//         },
//         child: Form(
//           key: userForm,
//           child: Container(
//             color: white,
//             child: Padding(
//               padding: const EdgeInsets.only(top: 180),
//               child: Column(
//                 children: [
//                   const Text(
//                     "Sign up", // Fixed typo "Sinp up" to "Sign up"
//                     style: TextStyle(
//                       color: blue,
//                       fontSize: 32,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Center(
//                     child: SizedBox(
//                       height: 205,
//                       width: 300,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           buildTextField("Name", _nameFocusNode, false, "Name is required", name),
//                           buildTextField("E-mail", _emailFocusNode, false, "E-mail is required", email),
//                           buildTextField("Password", _passwordFocusNode, true, "Password is required", password),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   SizedBox(
//                       width: 300,
//                       height: 45,
//                       child: ElevatedButton(
//                           style: ButtonStyle(
//                             enableFeedback: false,
//                             backgroundColor:
//                                 WidgetStateProperty.all(Colors.blueAccent[700]),
//                           ),
//                           onPressed: () {
//                             if(userForm.currentState!.validate()){
//                               createAccount();
//                             }
                            
//                           },
//                           child: const Text(
//                             "Sing up",
//                             style: TextStyle(fontSize: 20, color: white),
//                           ))),
//                   TextButton(
//                       style: const ButtonStyle(enableFeedback: false),
//                       onPressed: () {
//                         Navigator.push(context,
//                                         MaterialPageRoute(builder: (context) {
//                                       return const LogIn();
//                                     }));
//                       },
//                       child: const Text(
//                         "Already have an account? Log in",
//                         style: TextStyle(
//                           color: blue,
//                           decoration: TextDecoration.underline,
//                           decorationColor: Colors.red,
//                           decorationThickness: 1,
//                         ),
//                       ))
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // Modified buildTextField method to accept a FocusNode parameter
//   TextFormField buildTextField(String hint, FocusNode focusNode, bool security, String error, controler) {
//     return TextFormField(
//       controller: controler,
//       validator: (value){
//         if(value == null || value.isEmpty){
//           return error;
//         }
//         return null;
//       },
//       focusNode: focusNode, // FocusNode for each TextField
//       style: const TextStyle(color: white),
//       obscureText: security,
//       decoration: InputDecoration(
//         contentPadding: const EdgeInsets.all(10),
//         fillColor: blue,
//         filled: true,
//         hintText: hint,
//         hintStyle: const TextStyle(
//           color: grey,
//           fontSize: 12,
//         ),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
//       ),
//     );
//   }
// }
