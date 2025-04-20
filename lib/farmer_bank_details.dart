import 'package:flutter/material.dart';

import 'farmer_document_details.dart';

class BankDetails extends StatefulWidget {
  final Map<String, dynamic> signupData;

  const BankDetails({Key? key, required this.signupData}) : super(key: key);
  @override
  State<BankDetails> createState() => _BankDetails();
}

class _BankDetails extends State<BankDetails> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController accountholdernameController =
      TextEditingController();
  final TextEditingController accountnumberController = TextEditingController();
  final TextEditingController confirmaccountnumberController =
      TextEditingController();
  final TextEditingController ifsccodeController = TextEditingController();

  String? _validateIFSC(String? value) {
    if (value == null || value.isEmpty) return 'Enter IFSC code';
    final pattern = RegExp(r'^[A-Z]{4}0[A-Z0-9]{6}$');
    return pattern.hasMatch(value) ? null : 'Invalid IFSC code format';
  }

  String? _validateAccountNumber(String? value) {
    if (value == null || value.isEmpty) return 'Enter account number';
    if (value.length < 9 || value.length > 18)
      return 'Account number seems invalid';
    return null;
  }

  late Map<String, dynamic> signupData = {};

  @override
  void initState() {
    super.initState();
    signupData = widget.signupData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(239, 239, 239, 1),
        elevation: 0,

        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 50),

              Text(
                'Step 6: Bank Details',
                style: TextStyle(
                  fontSize: 25,
                  color: Color.fromRGBO(12, 141, 3, 1),
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: 50),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Account Holder Name',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    SizedBox(height: 10),

                    TextFormField(
                      controller: accountholdernameController,
                      decoration: InputDecoration(
                        labelText: "Enter Full Name (As in the book)",
                        floatingLabelStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 1.5,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Account Number',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    SizedBox(height: 10),

                    TextFormField(
                      controller: accountnumberController,
                      decoration: InputDecoration(
                        labelText: "Enter Account Number",
                        floatingLabelStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 1.5,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      validator: _validateAccountNumber,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Confirm Account Number',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    SizedBox(height: 10),

                    TextFormField(
                      controller: confirmaccountnumberController,
                      decoration: InputDecoration(
                        labelText: "Confirm Account Number",
                        floatingLabelStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 1.5,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value != accountnumberController.text)
                          return 'Account numbers do not match';
                        return _validateAccountNumber(value);
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'IFSC Code',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    SizedBox(height: 10),

                    TextFormField(
                      controller: ifsccodeController,
                      decoration: InputDecoration(
                        labelText: "Enter IFSC Code",
                        floatingLabelStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 1.5,
                          ),
                        ),
                      ),
                      textCapitalization: TextCapitalization.characters,
                      keyboardType: TextInputType.name,
                      validator: _validateIFSC,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 60),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    signupData['bankDetails'] = {
                      'accountholdername': accountholdernameController.text,
                      'accountnumber': accountnumberController.text,
                      'ifsccode': ifsccodeController.text,
                    };
                    
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                DocumentDetails(signupData: signupData),
                      ),
                    );
                  } else {
                    print("Enter valid inputs");
                  }
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(12, 141, 3, 1),
                  foregroundColor: Color.fromRGBO(239, 239, 239, 1),
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                ),

                child: Text("Next"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
