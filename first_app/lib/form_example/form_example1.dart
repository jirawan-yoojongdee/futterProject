import 'package:flutter/material.dart';

class FormExample1 extends StatefulWidget {
  const FormExample1({super.key});

  @override
  _FormExample1State createState() => _FormExample1State();
}

class _FormExample1State extends State<FormExample1> {
  // ประกาศ GlobalKey สำหรับ Form
  final _formKey = GlobalKey<FormState>();
  bool _isChecked = false;
  String? _gender = 'Female';
  bool _isSwitched = true;
  String? _selectedItem; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registration Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // ✅ ใช้ key ที่ประกาศไว้
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Full Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              
              Column(children: [ RadioListTile(
                title: const Text('Male'),
                value: 'Male',
                groupValue: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value.toString();
                  });
                },
              ),

              RadioListTile(
                title: const Text('Female'),
                value: 'Female',
                groupValue: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value.toString();
                  });
                },
              ),],),

              DropdownButtonFormField<String>( 
                  decoration: 
                      const InputDecoration(labelText: 'Province'), 
                  value: _selectedItem, 
                  items: ['Bankok', 'Nakhon Pathom', 'Option 3'] 
                      .map((item) => 
                          DropdownMenuItem(value: item, child: Text(item))) 
                      .toList(), 
                  onChanged: (value) { 
                    _selectedItem = value; 
                  }, 
                  validator: (value) => 
                      value == null ? 'Please select an option' : null, 
                ), 
                

              CheckboxListTile(
                title: const Text('Accept Terms & Conditions'),
                checkColor: Colors.pinkAccent,
                value: _isChecked,
                onChanged: (value) {
                  setState(() {
                    _isChecked = value!;
                  });
                },
              ),

              const SizedBox(height: 24),
              TextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print('Form is valid');
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Form is valid!')),
                    );
                  }
                },
                child: const Text('Save'),
              ),

             
              /*SwitchListTile(
                title: const Text('Enable Notifications'),
                value: _isSwitched,
                onChanged: (value) {
                  setState(() {
                    _isSwitched = value;
                  });
                },
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
