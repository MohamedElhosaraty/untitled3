import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool visible = true;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Scaffold(
        appBar: AppBar(),
    body: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Center(
    child: SingleChildScrollView(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    const Text(
    "Register",
    style: TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    ),
    ),
    const SizedBox(
    height: 30,
    ),
    TextFormField(
    decoration: const InputDecoration(
    labelText: ' Email  ',
    border: OutlineInputBorder(),
    ),
    keyboardType: TextInputType.emailAddress,
    controller: emailController,
    onFieldSubmitted: (value) {
    print(value);
    },
    validator: (value) {
    if (value!.isEmpty) {
    return 'email must not be empty';
    }
    return null;
    },
    ),
    const SizedBox(
    height: 15,
    ),
    TextFormField(
    decoration: const InputDecoration(
    labelText: 'Password',
    border: OutlineInputBorder(),
    suffixIcon: Icon(Icons.remove_red_eye),
    ),
    obscureText: visible,
    controller: passwordController,
    onFieldSubmitted: (value) {
    print(value);
    },
    validator: (value) {
    if (value!.isEmpty) {
    return 'password must not be empty';
    } else if (value.length < 6) {
    return 'Password is too short';
    }
    },
    ),
    const SizedBox(height: 30),
    Container(
    decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(8),
    ),
    width: double.infinity,
    child: MaterialButton(onPressed: () async {
    if (formKey.currentState!.validate()) {
    print(emailController.text);
    print(passwordController.text);
    }await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text)
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);
    });
    child:
    const Text(
      'REGISTER',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        //color: Colors.black,
      ),
    );
    })),
      const SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            ' have an account? ',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('SIGN IN'),
          ),
        ],
      ),
    ],
    ),
    ),
    ),
    ),
        ),
    );
  }
}