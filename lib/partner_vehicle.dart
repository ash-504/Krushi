import 'package:flutter/material.dart';
import 'package:krushi/partner_bank.dart';

import 'partner_document.dart';

class VehicleDetails extends StatefulWidget {
  final Map<String, dynamic> signupData;

  const VehicleDetails({Key? key, required this.signupData}) : super(key: key);

  @override
  State<VehicleDetails> createState() => _VehicleDetails();
}

class _VehicleDetails extends State<VehicleDetails> {
  final _formKey = GlobalKey<FormState>();

  late Map<String, dynamic> signupData = {};

  final TextEditingController vehicletypeController = TextEditingController();
  final TextEditingController vehiclemodelController = TextEditingController();
  final TextEditingController registrationnumberController =
      TextEditingController();
  final TextEditingController licensenumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    signupData = widget.signupData;
  }

  String? selectedVehicleType;

  List<String> vehicleTypes = [
    'Bicycle',
    'Motorcycle',
    'Scooter',
    'Auto Rickshaw',
    'Car',
    'Van',
    'Electric Bike',
  ];

  String? validateRegistrationNumber(String? value) {
    final regExp = RegExp(r'^[A-Z]{2}[0-9]{2}[A-Z]{0,2}[0-9]{4}$');
    if (value == null || value.isEmpty) {
      return 'Registration number is required';
    } else if (!regExp.hasMatch(value.toUpperCase())) {
      return 'Enter a valid registration number (e.g., MH12AB1234)';
    }
    return null;
  }

  String? validateLicenseNumber(String? value) {
    final regExp = RegExp(r'^[A-Z]{2}[0-9]{2}[0-9]{11}$');
    if (value == null || value.isEmpty) {
      return 'License number is required';
    } else if (!regExp.hasMatch(value.toUpperCase())) {
      return 'Enter a valid license number (e.g., MH1220200123456)';
    }
    return null;
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
                'Step 3: Vehicle Details',
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
                      'Vehicle Type',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    SizedBox(height: 10),

                    DropdownButtonFormField<String>(
                      value: selectedVehicleType,
                      decoration: InputDecoration(
                        labelText: 'Type of Vehicle',
                        border: OutlineInputBorder(),
                      ),
                      items:
                          vehicleTypes.map((vehicle) {
                            return DropdownMenuItem<String>(
                              value: vehicle,
                              child: Text(vehicle),
                            );
                          }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedVehicleType = value!;
                        });
                      },

                      validator:
                          (value) =>
                              value == null
                                  ? 'Please select type of vehicle'
                                  : null,
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
                      'Vehicle Model',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    SizedBox(height: 10),

                    TextFormField(
                      controller: vehiclemodelController,
                      decoration: InputDecoration(
                        labelText: "Enter Vehicle Model",
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
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter Vehicle Model';
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
                      'Registration Number',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    SizedBox(height: 10),

                    TextFormField(
                      controller: registrationnumberController,
                      decoration: InputDecoration(
                        labelText: "Enter Registration Number",
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
                      validator: validateRegistrationNumber,
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
                      'License Number',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    SizedBox(height: 10),

                    TextFormField(
                      controller: licensenumberController,
                      decoration: InputDecoration(
                        labelText: "Enter License Number",
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
                      validator: validateLicenseNumber,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 60),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    signupData['vehicledetails'] = {
                      'vehicletype': vehicletypeController.text,
                      'vehiclemodel': vehiclemodelController.text,
                      'registrationnumber': registrationnumberController.text,
                      'licensenumber': licensenumberController.text,
                    };

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                PartnerBankDetails(signupData: signupData),
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

              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
