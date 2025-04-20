import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:krushi/farmer_home.dart';

class ReviewDetails extends StatelessWidget {
  final Map<String, dynamic> signupData;

  const ReviewDetails({Key? key, required this.signupData}) : super(key: key);

  Widget buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$label: ", style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  Widget buildImageBox(String label, String url) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Container(
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: url.isNotEmpty
              ? GestureDetector(
                  onTap: () {},
                  child: Image.network(url, fit: BoxFit.cover),
                )
              : Center(child: Text("No image")),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget buildSectionCard(String title, List<Widget> content) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            ...content,
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> personalDetails =
        signupData['personaldetails'] ?? {};
    final Map<String, dynamic> homeAddress = signupData['homeaddress'] ?? {};
    final Map<String, dynamic> farmAddress = signupData['farmaddress'] ?? {};
    final Map<String, dynamic> landDetails = signupData['landDetails'] ?? {};
    final Map<String, dynamic> cropDetails = signupData['cropDetails'] ?? {};
    final Map<String, dynamic> bankDetails = signupData['bankDetails'] ?? {};

    return Scaffold(
      appBar: AppBar(
        title: Text("Review Your Details"),
        backgroundColor: Colors.green.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              "Review Your Details",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            // A. Personal Details
            buildSectionCard("A. Personal Details", [
              buildRow("First Name", personalDetails['firstname'] ?? 'Not provided'),
              buildRow("Last Name", personalDetails['lastname'] ?? 'Not provided'),
              buildRow("Gender", personalDetails['gender'] ?? 'Not provided'),
              buildRow("Date of Birth", personalDetails['dateofbirth'] ?? 'Not provided'),
            ]),

            // B. Home Address
            buildSectionCard("B. Home Address", [
              buildRow("Address", homeAddress.isNotEmpty
                  ? "${homeAddress['village']}, ${homeAddress['taluka']}, ${homeAddress['district']}, ${homeAddress['state']} - ${homeAddress['pincode']}"
                  : "Not provided"),
            ]),

            // C. Farm Address
            buildSectionCard("C. Farm Address", [
              buildRow("Address", farmAddress.isNotEmpty
                  ? "${farmAddress['village']}, ${farmAddress['taluka']}, ${farmAddress['district']}, ${farmAddress['state']} - ${farmAddress['pincode']}"
                  : "Not provided"),
            ]),

            // D. Land Details
            buildSectionCard("D. Land Details", [
              buildRow("Area", landDetails.isNotEmpty
                  ? "${landDetails['area']} ${landDetails['unit']}"
                  : "Not provided"),
              buildRow("Soil Type", landDetails['soilType'] ?? 'Not provided'),
            ]),

            // E. Crop Details
            buildSectionCard("E. Crop Details", [
              buildRow("Crops", cropDetails['cropList'] ?? 'Not provided'),
              buildRow("Category", cropDetails['category'] ?? 'Not provided'),
            ]),                                                                             

            // F. Bank Details
            buildSectionCard("F. Bank Details", [
              buildRow("Account Holder Name", bankDetails['accountholdername'] ?? 'Not provided'),
              buildRow("Account Number", bankDetails['accountnumber'] ?? 'Not provided'),
              buildRow("IFSC Code", bankDetails['ifsccode'] ?? 'Not provided'),
            ]),

            // G. Documents
            buildSectionCard("G. Documents", [
              buildImageBox("Aadhar Card", signupData['aadharUrl'] ?? ''),
              buildImageBox("Pan Card", signupData['panUrl'] ?? ''),
              buildImageBox("Bank Passbook", signupData['passbookUrl'] ?? ''),
              buildImageBox("Field Photo", signupData['fieldUrl'] ?? ''),
            ]),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Edit"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      final farmers = FirebaseFirestore.instance.collection('farmers');
                      await farmers.add(signupData);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Details submitted successfully!')),
                      );

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => FarmerHome()),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: ${e.toString()}')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: Text("Confirm", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
