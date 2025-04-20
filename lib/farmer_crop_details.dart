import 'package:flutter/material.dart';
import 'package:krushi/farmer_bank_details.dart';

import 'farmer_bank_details.dart';

class CropDetails extends StatefulWidget {
  final Map<String, dynamic> signupData;

  const CropDetails({Key? key, required this.signupData}) : super(key: key);

  @override
  State<CropDetails> createState() => _CropDetails();
}

class _CropDetails extends State<CropDetails> {
  final _formKey = GlobalKey<FormState>();

  late Map<String, dynamic> signupData = {};

  Map<String, bool> selectedCrops = {};

  Map<String, bool> selectedCropCategories = {};

  final List<String> cropList = [
    'Rice',
    'Wheat',
    'Maize',
    'Millets',
    'Barley',
    'Gram',
    'Moong',
    'Urad',
    'Masoor',
    'Arhar',
    'Mustard',
    'Groundnut',
    'Sunflower',
    'Soybean',
    'Sesame',
    'Mango',
    'Banana',
    'Papaya',
    'Guava',
    'Orange',
    'Tomato',
    'Potato',
    'Onion',
    'Brinjal',
    'Cabbage',
    'Cotton',
    'Sugarcane',
    'Tobacco',
    'Jute',
    'Tea',
    'Coffee',
  ];

  final List<String> cropCategory = [
    'Food Crops',
    'Pulse Crops',
    'Oilseed Crops',
    'Fruit Crops',
    'Vegetable Crops',
    'Cash Crops',
  ];

  @override
  void initState() {
    super.initState();
    signupData = widget.signupData;

    for (var crop in cropList) {
      selectedCrops[crop] = false;
    }

    for (var cropcategory in cropCategory) {
      selectedCropCategories[cropcategory] = false;
    }
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
                'Step 5: Crop Details',
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
                      'Crops',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    SizedBox(height: 10),

                    ...cropList.map((crop) {
                      return CheckboxListTile(
                        title: Text(
                          crop,
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        value: selectedCrops[crop],
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCrops[crop] = value!;
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
                      'Crops Category',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    SizedBox(height: 10),

                    ...cropCategory.map((category) {
                      return CheckboxListTile(
                        title: Text(
                          category,
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        value: selectedCropCategories[category],
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCropCategories[category] = value!;
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
                    signupData['cropDetails'] = {
                      'selectedCrops':
                          selectedCrops.entries
                              .where((entry) => entry.value)
                              .map((entry) => entry.key)
                              .toList(),
                      'selectedCropCategories':
                          selectedCropCategories.entries
                              .where((entry) => entry.value)
                              .map((entry) => entry.key)
                              .toList(),
                    };

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => BankDetails(signupData: signupData),
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
