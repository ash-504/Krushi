import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'partner_home.dart';

class PartnerReviewDetails extends StatelessWidget {
  final Map<String, dynamic> signupData;

  const PartnerReviewDetails({Key? key, required this.signupData})
    : super(key: key);

  Widget buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$label: ", style: TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
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
          child:
              url.isNotEmpty
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
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
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
    final Map<String, dynamic> vehicleDetails = signupData['vehicledetails'] ?? {};
    final Map<String, dynamic> bankDetails = signupData['bankDetails'] ?? {};    

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(239, 239, 239, 1),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_outlined, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                children: [
                  Text(
                    "Review your Details",
                    style: TextStyle(
                      fontSize: 25,
                      color: Color.fromRGBO(12, 141, 3, 1),
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            // A. Personal Details
            buildSectionCard("A. Personal Details", [
              buildRow(
                "First Name",
                personalDetails['firstname'] ?? 'Not provided',
              ),
              buildRow(
                "Last Name",
                personalDetails['lastname'] ?? 'Not provided',
              ),
              buildRow("Gender", personalDetails['gender'] ?? 'Not provided'),
              buildRow(
                "Date of Birth",
                personalDetails['dateofbirth'] ?? 'Not provided',
              ),
            ]),

            // B. Home Address
            buildSectionCard("B. Home Address", [
              buildRow(
                "Address",
                homeAddress.isNotEmpty
                    ? "${homeAddress['housenumber']}, ${homeAddress['street']}, ${homeAddress['village']}, ${homeAddress['taluka']}, ${homeAddress['district']}, ${homeAddress['state']} - ${homeAddress['pincode']}, ${homeAddress['landmark']}"
                    : "Not provided",
              ),
            ]),

            // C. Vehicle Details
            buildSectionCard("C. Vehicle Details", [
              buildRow("Vehicle Type", vehicleDetails['vehicletype'] ?? 'Not provided'),
              buildRow("Vehicle Model", vehicleDetails['vehiclemodel'] ?? 'Not provided'),
              buildRow("Registration Number", vehicleDetails['registrationnumber'] ?? 'Not provided'),
              buildRow("License Number", vehicleDetails['licensenumber'] ?? 'Not provided'),
            ]),

            // D. Bank Details
            buildSectionCard("D. Bank Details", [
              buildRow(
                "Account Holder Name",
                bankDetails['accountholdername'] ?? 'Not provided',
              ),
              buildRow(
                "Account Number",
                bankDetails['accountnumber'] ?? 'Not provided',
              ),
              buildRow("IFSC Code", bankDetails['ifsccode'] ?? 'Not provided'),
            ]),

            // E. Documents
            buildSectionCard("E. Documents", [
              buildImageBox("Aadhar Card", signupData['aadhar'] ?? ''),
              buildImageBox("Pan Card", signupData['pan'] ?? ''),
              buildImageBox("Bank Passbook", signupData['passbook'] ?? ''),
              buildImageBox("RC", signupData['rc'] ?? ''),
              buildImageBox("License", signupData['license'] ?? ''),
            ]),

            SizedBox(height: 20),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.only(
                      left: 90,
                      right: 90,
                      top: 15,
                      bottom: 15,
                    ),
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  child: Text("Edit"),
                ),

                SizedBox(height: 25),

                ElevatedButton(
                  onPressed: () async {
                    try {
                      final farmers = FirebaseFirestore.instance.collection(
                        'partners',
                      );
                      await farmers.add(signupData);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Details submitted successfully!'),
                        ),
                      );

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => DeliveryHomePage()),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: ${e.toString()}')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(12, 141, 3, 1),
                    foregroundColor: Color.fromRGBO(239, 239, 239, 1),
                    padding: EdgeInsets.only(
                      left: 90,
                      right: 90,
                      top: 15,
                      bottom: 15,
                    ),
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
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
