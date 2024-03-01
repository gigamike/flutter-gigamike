import 'package:flutter/material.dart';

import 'package:email_validator/email_validator.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<StatefulWidget> createState() {
     return _Contact();
  }
}

class _Contact extends State<Contact>{
  final _formKey = GlobalKey<FormState>();

  // var _enteredEmail = '';
  var _enteredSubject = '';
  var _enteredMessage = '';

  Future<void> _contactSubmit() async {
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();

      // print(_enteredEmail);
      // print(_enteredSubject);
      // print(_enteredMessage);
      
      final Email email = Email(
        body: _enteredMessage,
        subject: _enteredSubject,
        recipients: ['michael.gerard.galon@gmail.com'],
        // cc: ['cc@example.com'],
        // bcc: ['bcc@example.com'],
        // attachmentPaths: ['/path/to/attachment.zip'],
        isHTML: true,
      );

      try {
        await FlutterEmailSender.send(email);

        _formKey.currentState!.reset();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Thank you! We will reach out to you soon!'),
            backgroundColor: Colors.green,
          ),
        );
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Oops! something went wrong ' + error.toString() + '. Please try again later.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
             Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/contactus.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              padding: const EdgeInsets.all(90),
            ),

            const SizedBox(height: 8), 

            /*
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'Enter your email',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty || value.trim().length <= 1) {
                      return 'Please enter your email';
                    }

                    if(!EmailValidator.validate(value)){
                      return 'Invalid email';
                    }
                    return null;
                  },
                  onSaved: (value){
                    _enteredEmail = value!;
                  },
                ),
            ),
            */
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your subject',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty || value.trim().length <= 1) {
                    return 'Please enter subject';
                  }
                  return null;
                },
                onSaved: (value){
                  _enteredSubject = value!;
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: 'Enter your message',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty || value.trim().length <= 1) {
                    return 'Please enter your message';
                  }
                  return null;
                },
                onSaved: (value){
                  _enteredMessage = value!;
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    onPressed: (){
                      _formKey.currentState!.reset();
                    }, 
                    child: const Text('Reset'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _contactSubmit();
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
