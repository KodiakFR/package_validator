import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

import 'package:validators/validators.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                decoration: const InputDecoration(label: Text('Email')),
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(label: Text('Password')),
                obscureText: true,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (isEmail(_emailController.text) &&
                          _passwordController.text.isNotEmpty &&
                          !_passwordController.text.contains(' ')) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Login Success'),
                          backgroundColor: Colors.green,
                        ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(Icons.info),
                                const Text('Login failed'),
                                Link(
                                    uri: Uri.parse('https://google.fr'),
                                    target: LinkTarget.blank,
                                    builder: (context, followlink) {
                                      return TextButton(
                                          onPressed: followlink,
                                          child: const Text('more info',style: TextStyle(decoration: TextDecoration.underline),));
                                    })
                              ],
                            ),
                            backgroundColor: Colors.redAccent));
                      }
                    },
                    child: const Text('Conection'),
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
