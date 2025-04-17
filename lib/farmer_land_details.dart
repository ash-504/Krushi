// import 'package:flutter/material.dart';

// import 'farmer_land_details.dart';

// class LandandCropDetails extends StatefulWidget {
//   @override
//   State<LandandCropDetails> createState() => _LandandCropDetails();
// }

// class _LandandCropDetails extends State<LandandCropDetails> {
//   final _formKey = GlobalKey<FormState>();

//   final TextEditingController landareaController = TextEditingController();
//   final TextEditingController ownershipController = TextEditingController();
//   final TextEditingController soilController = TextEditingController();
//   final TextEditingController watersourceController = TextEditingController();
//   final TextEditingController irrigationController = TextEditingController();

//   final Map<String, dynamic> signupData = {};

//   String? selectedUnit = 'Acres';
//   String? ownership;

//   List<String> soilTypes = [
//     'Alluvial',
//     'Black',
//     'Red',
//     'Laterite',
//     'Mountain',
//     'Desert',
//     'Peaty',
//     'Saline',
//   ];

//   String? selectedSoilType;

//   List<String> waterSources = [
//     'Canal',
//     'Borewell',
//     'Rainwater',
//     'Tank',
//     'River',
//     'Well',
//   ];

//   Map<String, bool> selectedSources = {};

//   @override
//   void initState() {
//     super.initState();
//     for (var source in waterSources) {
//       selectedSources[source] = false;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromRGBO(239, 239, 239, 1),
//         elevation: 0,

//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_outlined, color: Colors.black),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),

//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               SizedBox(height: 50),

//               Text(
//                 'Step 4: Land and Crop Details',
//                 style: TextStyle(
//                   fontSize: 25,
//                   color: Color.fromRGBO(12, 141, 3, 1),
//                   fontStyle: FontStyle.italic,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),

//               SizedBox(height: 50),

//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 30),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Total Land Area (in acres/hectares)',
//                       style: TextStyle(
//                         fontSize: 20,
//                         color: Colors.black54,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),

//                     SizedBox(height: 10),

//                     TextFormField(
//                       controller: landareaController,
//                       decoration: InputDecoration(
//                         labelText: "Enter Land Area",
//                         floatingLabelStyle: TextStyle(
//                           color: Colors.grey,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18,
//                         ),
//                         border: OutlineInputBorder(),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                           borderSide: BorderSide(
//                             color: Colors.green,
//                             width: 1.5,
//                           ),
//                         ),
//                       ),
//                       keyboardType: TextInputType.number,
//                       validator:
//                           (value) => value!.isEmpty ? 'Enter land area' : null,
//                     ),

//                     SizedBox(width: 10),
//                     DropdownButton<String>(
//                       value: selectedUnit,
//                       items:
//                           ['Acres', 'Hectares'].map((unit) {
//                             return DropdownMenuItem<String>(
//                               value: unit,
//                               child: Text(unit),
//                             );
//                           }).toList(),
//                       onChanged: (value) {
//                         setState(() {
//                           selectedUnit = value!;
//                         });
//                       },
//                     ),
//                   ],
//                 ),
//               ),

//               SizedBox(height: 20),

//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 30),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Ownership of Land',
//                       style: TextStyle(
//                         fontSize: 20,
//                         color: Colors.black54,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),

//                     SizedBox(height: 10),

//                     Row(
//                       children: [
//                         Radio<String>(
//                           value: 'Owned',
//                           groupValue: ownership,
//                           onChanged: (value) {
//                             setState(() {
//                               ownership = value;
//                             });
//                           },
//                         ),

//                         Text('Owned'),

//                         SizedBox(width: 20),

//                         Radio<String>(
//                           value: 'Leased',
//                           groupValue: ownership,
//                           onChanged: (value) {
//                             setState(() {
//                               ownership = value;
//                             });
//                           },
//                         ),

//                         Text('Leased'),

//                         SizedBox(width: 20),

//                         Radio<String>(
//                           value: 'Rented',
//                           groupValue: ownership,
//                           onChanged: (value) {
//                             setState(() {
//                               ownership = value;
//                             });
//                           },
//                         ),

//                         Text('Rented'),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),

//               SizedBox(height: 20),

//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 30),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Type of Soil',
//                       style: TextStyle(
//                         fontSize: 20,
//                         color: Colors.black54,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),

//                     SizedBox(height: 10),

//                     DropdownButtonFormField<String>(
//                       value: selectedSoilType,
//                       decoration: InputDecoration(
//                         labelText: 'Type of Soil',
//                         border: OutlineInputBorder(),
//                       ),
//                       items:
//                           soilTypes.map((soil) {
//                             return DropdownMenuItem<String>(
//                               value: soil,
//                               child: Text(soil),
//                             );
//                           }).toList(),
//                       onChanged: (value) {
//                         setState(() {
//                           selectedSoilType = value!;
//                         });
//                       },

//                       validator:
//                           (value) =>
//                               value == null
//                                   ? 'Please select type of soil'
//                                   : null,
//                     ),
//                   ],
//                 ),
//               ),

//               SizedBox(height: 20),

//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 30),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Water Source',
//                       style: TextStyle(
//                         fontSize: 20,
//                         color: Colors.black54,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),

//                     SizedBox(height: 10),

//                     ...waterSources.map((source) {
//                       return CheckboxListTile(
//                         title: Text(source),
//                         value: selectedSources[source],
//                         onChanged: (bool? value) {
//                           setState(() {
//                             selectedSources[source] = value!;
//                           });
//                         },
//                         controlAffinity: ListTileControlAffinity.leading,
//                       );
//                     }).toList(),
//                   ],
//                 ),
//               ),

//               SizedBox(height: 20),

//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 30),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'District',
//                       style: TextStyle(
//                         fontSize: 20,
//                         color: Colors.black54,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),

//                     SizedBox(height: 10),

//                     TextFormField(
//                       controller: farmdistrictController,
//                       decoration: InputDecoration(
//                         labelText: "Enter District",
//                         floatingLabelStyle: TextStyle(
//                           color: Colors.grey,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18,
//                         ),
//                         border: OutlineInputBorder(),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                           borderSide: BorderSide(
//                             color: Colors.green,
//                             width: 1.5,
//                           ),
//                         ),
//                       ),
//                       keyboardType: TextInputType.name,
//                       validator: (value) {
//                         if (value == null || value.trim().isEmpty) {
//                           return 'Please enter District';
//                         }

//                         return null;
//                       },
//                     ),
//                   ],
//                 ),
//               ),

//               SizedBox(height: 20),

//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 30),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'State',
//                       style: TextStyle(
//                         fontSize: 20,
//                         color: Colors.black54,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),

//                     SizedBox(height: 10),

//                     TextFormField(
//                       initialValue: "Maharashtra",
//                       readOnly: true,
//                       decoration: InputDecoration(
//                         floatingLabelStyle: TextStyle(
//                           color: Colors.grey,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18,
//                         ),
//                         border: OutlineInputBorder(),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                           borderSide: BorderSide(
//                             color: Colors.green,
//                             width: 1.5,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               SizedBox(height: 20),

//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 30),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Pincode',
//                       style: TextStyle(
//                         fontSize: 20,
//                         color: Colors.black54,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),

//                     SizedBox(height: 10),

//                     TextFormField(
//                       controller: farmpincodeController,
//                       decoration: InputDecoration(
//                         labelText: "Enter PinCode",
//                         floatingLabelStyle: TextStyle(
//                           color: Colors.grey,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18,
//                         ),
//                         border: OutlineInputBorder(),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                           borderSide: BorderSide(
//                             color: Colors.green,
//                             width: 1.5,
//                           ),
//                         ),
//                       ),
//                       keyboardType: TextInputType.number,
//                       validator: (value) {
//                         if (value == null || value.trim().isEmpty) {
//                           return 'Please enter pincode';
//                         } else if (!RegExp(
//                           r'^[1-9][0-9]{5}$',
//                         ).hasMatch(value.trim())) {
//                           return 'Enter a valid 6-digit pincode';
//                         }

//                         return null;
//                       },
//                     ),
//                   ],
//                 ),
//               ),

//               SizedBox(height: 20),

//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 30),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Landmark (optional)',
//                       style: TextStyle(
//                         fontSize: 20,
//                         color: Colors.black54,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),

//                     SizedBox(height: 10),

//                     TextFormField(
//                       controller: farmlandmarkController,
//                       decoration: InputDecoration(
//                         labelText: "Enter Landmark",
//                         floatingLabelStyle: TextStyle(
//                           color: Colors.grey,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18,
//                         ),
//                         border: OutlineInputBorder(),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                           borderSide: BorderSide(
//                             color: Colors.green,
//                             width: 1.5,
//                           ),
//                         ),
//                       ),
//                       keyboardType: TextInputType.name,
//                     ),
//                   ],
//                 ),
//               ),

//               SizedBox(height: 60),

//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     if (ownership == null) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text('Please select ownership type')),
//                       );
//                       return;
//                     }

//                     signupData['pltnumber'] = plotnumberController.text;
//                     signupData['farmstreet'] = areaController.text;
//                     signupData['farmvillage'] = farmvillageController.text;
//                     signupData['farmtaluka'] = farmtalukaController.text;
//                     signupData['farmdistrict'] = farmdistrictController.text;
//                     signupData['farmstate'] = selectedState;
//                     signupData['farmpincode'] = farmpincodeController.text;
//                     signupData['farmlandmark'] = farmlandmarkController.text;

//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => LandandCropDetails(),
//                       ),
//                     );
//                   } else {
//                     print("Enter valid inputs");
//                   }
//                 },

//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Color.fromRGBO(12, 141, 3, 1),
//                   foregroundColor: Color.fromRGBO(239, 239, 239, 1),
//                   padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
//                   textStyle: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   elevation: 5,
//                 ),

//                 child: Text("Next"),
//               ),

//               SizedBox(height: 100),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
