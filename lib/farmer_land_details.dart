import 'package:flutter/material.dart';

import 'farmer_crop_details.dart';

class LandDetails extends StatefulWidget {
  final Map<String, dynamic> signupData;

  const LandDetails({Key? key, required this.signupData}) : super(key: key);

  @override
  State<LandDetails> createState() => _LandDetails();
}

class _LandDetails extends State<LandDetails> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController farmnameController = TextEditingController();
  final TextEditingController landareaController = TextEditingController();
  final TextEditingController ownershipController = TextEditingController();
  final TextEditingController soilController = TextEditingController();

  late Map<String, dynamic> signupData = {};

  @override
  void initState() {
    super.initState();
    signupData = widget.signupData;
  }

  String? selectedUnit = 'Acres';
  String? ownership;

  List<String> soilTypes = [
    'Alluvial',
    'Black',
    'Red',
    'Laterite',
    'Mountain',
    'Desert',
    'Peaty',
    'Saline',
  ];

  String? selectedSoilType;

  Map<String, bool> waterSources = {
    'Canal': false,
    'Borewell': false,
    'Rainwater': false,
    'Tank': false,
    'River': false,
    'Well': false,
  };

  Map<String, bool> irrigationMethods = {
    'Drip': false,
    'Flood': false,
    'Sprinkler': false,
  };

  Map<String, bool> selectedSources = {};

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
                'Step 4: Land Details',
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
                      'Farm Name',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    SizedBox(height: 10),

                    TextFormField(
                      controller: farmnameController,
                      decoration: InputDecoration(
                        labelText: "Enter Farm Name",
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

              SizedBox(height: 20),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Land Area (in acres/hectares)',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: landareaController,
                            decoration: InputDecoration(
                              labelText: "Enter Land Area",
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
                            validator:
                                (value) =>
                                    value!.isEmpty ? 'Enter land area' : null,
                          ),
                        ),

                        SizedBox(width: 10),

                        Expanded(
                          flex: 2,
                          child: DropdownButtonFormField<String>(
                            value: selectedUnit,
                            decoration: InputDecoration(
                              labelText: "Unit",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.green,
                                  width: 1.5,
                                ),
                              ),
                            ),
                            items:
                                ['Acres', 'Hectares'].map((unit) {
                                  return DropdownMenuItem<String>(
                                    value: unit,
                                    child: Text(unit),
                                  );
                                }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedUnit = value!;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please select a unit";
                              }
                            },
                          ),
                        ),
                      ],
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
                      'Land Ownership',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    SizedBox(height: 10),

                    Row(
                      children: [
                        Radio<String>(
                          value: 'Owned',
                          groupValue: ownership,
                          onChanged: (value) {
                            setState(() {
                              ownership = value;
                            });
                          },
                        ),

                        Text(
                          'Owned',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),

                        SizedBox(width: 10),

                        Radio<String>(
                          value: 'Leased',
                          groupValue: ownership,
                          onChanged: (value) {
                            setState(() {
                              ownership = value;
                            });
                          },
                        ),

                        Text(
                          'Leased',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),

                        SizedBox(width: 10),

                        Radio<String>(
                          value: 'Rented',
                          groupValue: ownership,
                          onChanged: (value) {
                            setState(() {
                              ownership = value;
                            });
                          },
                        ),

                        Text(
                          'Rented',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ],
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
                      'Type of Soil',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    SizedBox(height: 10),

                    DropdownButtonFormField<String>(
                      value: selectedSoilType,
                      decoration: InputDecoration(
                        labelText: 'Type of Soil',
                        border: OutlineInputBorder(),
                      ),
                      items:
                          soilTypes.map((soil) {
                            return DropdownMenuItem<String>(
                              value: soil,
                              child: Text(soil),
                            );
                          }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedSoilType = value!;
                        });
                      },

                      validator:
                          (value) =>
                              value == null
                                  ? 'Please select type of soil'
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
                      'Select Water Sources',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    SizedBox(height: 10),

                    ...waterSources.keys.map((source) {
                      return CheckboxListTile(
                        title: Text(
                          source,
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        value: waterSources[source],
                        onChanged: (bool? value) {
                          setState(() {
                            waterSources[source] = value!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 0,
                          vertical: 0,
                        ),
                        dense: true,
                        visualDensity: VisualDensity(vertical: -4),
                      );
                    }).toList(),
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
                      'Select Irrigation Method',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    SizedBox(height: 10),

                    ...irrigationMethods.keys.map((source) {
                      return CheckboxListTile(
                        title: Text(
                          source,
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        value: irrigationMethods[source],
                        onChanged: (bool? value) {
                          setState(() {
                            irrigationMethods[source] = value!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 0,
                          vertical: 0,
                        ),
                        dense: true,
                        visualDensity: VisualDensity(vertical: -4),
                      );
                    }).toList(),
                  ],
                ),
              ),

              SizedBox(height: 60),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (ownership == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please select ownership type')),
                      );
                      return;
                    }

                    signupData['landDetails'] = {
                      'farmname': farmnameController.text,
                      'landArea': landareaController.text,
                      'unit': selectedUnit,
                      'ownership': ownership,
                      'soilType': selectedSoilType,
                      'waterSources':
                          waterSources.entries
                              .where((entry) => entry.value)
                              .map((entry) => entry.key)
                              .toList(),
                      'irrigationMethods':
                          irrigationMethods.entries
                              .where((entry) => entry.value)
                              .map((entry) => entry.key)
                              .toList(),
                    };

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => CropDetails(signupData: signupData),
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
