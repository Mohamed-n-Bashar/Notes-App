// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class screen1 extends StatefulWidget {
  const screen1({super.key});

  @override
  State<screen1> createState() => _screen1State();
}

class _screen1State extends State<screen1> {
  bool _visibility = true;
  String? email;
  String? password;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
            key: _key,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  
                  TextFormField(                                                  // الحقل الاول 
                    onChanged: (value) => setState(() {
                      email = value;
                    }),
                    decoration: const InputDecoration(labelText: 'Email' , border: OutlineInputBorder(),icon: Icon(Icons.email_outlined)),
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) =>
                        value!.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value) ? "email is wrong" : null,
                  ),

                  const SizedBox(height: 10,),                                          // فاصل 

                  TextFormField(                                                  // الحقل الثاني
                    obscureText: _visibility,
                    onChanged: (value) => setState(() {
                      password = value;
                    }),
                    decoration: InputDecoration(
                      labelText: 'Password' , 
                      border: const OutlineInputBorder(),
                      icon: const Icon(Icons.security),
                      suffix:IconButton(
                        onPressed: (){
                          setState(() {
                            _visibility = !_visibility;
                          });
                        }, 
                        icon: _visibility
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off)
                        )
                      ),
                    controller: _phoneController,
                    keyboardType: TextInputType.text,
                    validator: (value) =>
                        value!.isEmpty ? "password is required" : null,
                  ),

                  const SizedBox(height: 20,),                                          // فاصل 

                  ElevatedButton(                                                   // زر الادخال
                      onPressed: () {
                        setState(() {                        
                         if (_key.currentState!.validate()) {
                          email = _emailController.value.text;
                          password = _phoneController.value.text;
                        }});
                      },
                      child: const Text('submit')),
                ],
              ),
            )),
      ),
    );
  }
}
