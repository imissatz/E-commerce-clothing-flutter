import 'package:flutter/material.dart ';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Welcome to Furaha!",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 32.0,
                ),
                const Icon(
                  Icons.account_circle,
                  size: 100.0,
                  color: Colors.deepPurple,
                ),
                 TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration:const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email)),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: _obscureText,
                    decoration:  InputDecoration(
                        labelText: "Password", 
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(icon: Icon( _obscureText ? Icons.visibility : Icons.visibility_off), onPressed: () {
                          setState (() {
                            _obscureText = !_obscureText;
                          });
                        } )
                        )),
                const SizedBox(
                  height: 5.0,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.grey, fontSize: 10.0),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      padding: const EdgeInsets.all(10.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      )),
                  child: const Text(
                    "Log In",
                    style: TextStyle(fontSize: 20.0,
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.all(10.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          )),
                      child: const Icon(
                        Icons.facebook,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 30.0,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: const EdgeInsets.all(10.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          )),
                      child: const Icon(
                        Icons.email_sharp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     const Text(
                      "Don't have an account?",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                                       ),
                    TextButton(onPressed: () {}, child:const Text('Sign Up', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.black),))
                    
                   ],
                 )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
