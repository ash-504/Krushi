import 'package:flutter/material.dart';

import 'farmer_land_details.dart';

class FarmLocationDetails extends StatefulWidget {
  final Map<String, dynamic> signupData;

  const FarmLocationDetails({Key? key, required this.signupData})
    : super(key: key);

  @override
  State<FarmLocationDetails> createState() => _FarmLocationDetails();
}

class _FarmLocationDetails extends State<FarmLocationDetails> {
  final _formKey = GlobalKey<FormState>();

  late Map<String, dynamic> signupData;

  final TextEditingController plotnumberController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController farmvillageController = TextEditingController();
  final TextEditingController farmtalukaController = TextEditingController();
  final TextEditingController farmdistrictController = TextEditingController();
  final TextEditingController farmpincodeController = TextEditingController();
  final TextEditingController farmlandmarkController = TextEditingController();

  String? selectedState;

  @override
  void initState() {
    super.initState();
    signupData = widget.signupData;
    selectedState = "Maharashtra";
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
                'Step 3: Farm Location Details',
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
                      'Plot Number',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    SizedBox(height: 10),

                    TextFormField(
                      controller: plotnumberController,
                      decoration: InputDecoration(
                        labelText: "Enter Plot Number",
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
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter Plot Number';
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
                      'Street/Area/Locality',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    SizedBox(height: 10),

                    TextFormField(
                      controller: areaController,
                      decoration: InputDecoration(
                        labelText: "Enter Street/Area/Locality",
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
                          return 'Please enter Street/Area/Locality';
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
                      'Village/Town/City',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    SizedBox(height: 10),

                    TextFormField(
                      controller: farmvillageController,
                      decoration: InputDecoration(
                        labelText: "Enter Village/Town/City",
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
                          return 'Please enter Village/Town/City';
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
                      'Taluka/Tehsil/Sub-District',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    SizedBox(height: 10),

                    TextFormField(
                      controller: farmtalukaController,
                      decoration: InputDecoration(
                        labelText: "Enter Taluka/Tehsil/Sub-District",
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
                          return 'Please enter Taluka/Tehsil/Sub-District';
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
                      'District',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    SizedBox(height: 10),

                    TextFormField(
                      controller: farmdistrictController,
                      decoration: InputDecoration(
                        labelText: "Enter District",
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
                          return 'Please enter District';
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
                      'State',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    SizedBox(height: 10),

                    TextFormField(
                      initialValue: "Maharashtra",
                      readOnly: true,
                      decoration: InputDecoration(
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
                      'Pincode',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    SizedBox(height: 10),

                    TextFormField(
                      controller: farmpincodeController,
                      decoration: InputDecoration(
                        labelText: "Enter PinCode",
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
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter pincode';
                        } else if (!RegExp(
                          r'^[1-9][0-9]{5}$',
                        ).hasMatch(value.trim())) {
                          return 'Enter a valid 6-digit pincode';
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
                      'Landmark (optional)',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    SizedBox(height: 10),

                    TextFormField(
                      controller: farmlandmarkController,
                      decoration: InputDecoration(
                        labelText: "Enter Landmark",
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
                    ),
                  ],
                ),
              ),

              SizedBox(height: 60),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    signupData['farmaddress'] = {
                      'plotnumber': plotnumberController.text,
                      'street': areaController.text,
                      'village': farmvillageController.text,
                      'taluka': farmtalukaController.text,
                      'district': farmdistrictController.text,
                      'state': selectedState,
                      'pincode': farmpincodeController.text,
                      'landmark': farmlandmarkController.text,
                    };

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LandDetails(signupData: signupData)),
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
