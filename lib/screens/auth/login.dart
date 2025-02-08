//Future
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:gofit/screens/auth/signup.dart';
// import 'package:gofit/screens/main/styles.dart';

// class LogIn extends StatefulWidget {
//   const LogIn({super.key});

//   @override
//   State<LogIn> createState() => _LogInState();
// }

// class _LogInState extends State<LogIn> {
//   final FocusNode _nameFocusNode = FocusNode();
//   final FocusNode _emailFocusNode = FocusNode();
//   final FocusNode _passwordFocusNode = FocusNode();
//   var userForm = GlobalKey<FormState>();
//   TextEditingController email = TextEditingController();
//   TextEditingController password = TextEditingController();
//   Future<void> createAccount() async{
//     try {
//       // Create user with email and password
//       // ignore: unused_local_variable
//       UserCredential userCredential = await FirebaseAuth.instance
//           .signInWithEmailAndPassword(
//               email: email.text, password: password.text);
      
      

//       // Show success message
//       // ignore: use_build_context_synchronously
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('User signin up successfully'), backgroundColor: Colors.green));

//       // Optionally, you can verify the email after user is created
//       // await userCredential.user?.sendEmailVerification();

//       // Navigate or show success message
//       // You can also navigate to the main screen after sign-up
//       // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SomeNextScreen()));
      
      
//     } catch (e) {
//       SnackBar messageSnackBar = const SnackBar(content: Text("Email address or password is inncorrect"), backgroundColor: red);
//       // ignore: use_build_context_synchronously
//       ScaffoldMessenger.of(context).showSnackBar(messageSnackBar);
//       // ignore: avoid_print
//       print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           enableFeedback: false,
//             onPressed: () {
//               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
//                 return const SignUp();
//               }));
//             },
//             icon: const Icon(
//               Icons.arrow_back,
//               color: blue,
//             )),
//         backgroundColor: white,
//       ),
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
//               padding: const EdgeInsets.only(top: 200),
//               child: Column(
//                 children: [
//                   const Text(
//                     "Log in", // Fixed typo "Sinp up" to "Sign up"
//                     style: TextStyle(
//                       color: blue,
//                       fontSize: 32,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Center(
//                     child: SizedBox(
//                       height: 136,
//                       width: 300,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                             buildTextField("E-mail", _emailFocusNode, false, "E-mail is required", email ),
//                             buildTextField("Password", _passwordFocusNode, true, "Password is required", password),
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
//                             "Log in",
//                             style: TextStyle(fontSize: 20, color: white),
//                           )))
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
//        validator: (value){
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
