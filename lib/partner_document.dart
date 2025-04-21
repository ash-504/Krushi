import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

import 'partner_review.dart';

class PartnerDocumentDetails extends StatefulWidget {
  final Map<String, dynamic> signupData;

  const PartnerDocumentDetails({Key? key, required this.signupData})
    : super(key: key);

  @override
  State<PartnerDocumentDetails> createState() => _PartnerDocumentDetails();
}

class _PartnerDocumentDetails extends State<PartnerDocumentDetails> {
  final _formKey = GlobalKey<FormState>();

  late Map<String, dynamic> signupData = {};

  @override
  void initState() {
    super.initState();
    signupData = widget.signupData;
  }

  File? aadharImage;
  File? panImage;
  File? passbookImage;
  File? rcImage;
  File? licenseImage;

  double aadharProgress = 0.0;
  double panProgress = 0.0;
  double passbookProgress = 0.0;
  double rcProgress = 0.0;
  double licenseProgress = 0.0;

  Future<void> pickandUploadImage(String key) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File image = File(pickedFile.path);
      String fileName = pickedFile.name;

      final storageRef = FirebaseStorage.instance.ref().child(
        'documents/$key/$fileName',
      );
      final uploadTask = storageRef.putFile(image);

      uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
        setState(() {
          if (key == 'aadhar') {
            aadharProgress =
                snapshot.bytesTransferred.toDouble() /
                snapshot.totalBytes.toDouble();
          } else if (key == 'pan') {
            panProgress =
                snapshot.bytesTransferred.toDouble() /
                snapshot.totalBytes.toDouble();
          } else if (key == 'passbook') {
            passbookProgress =
                snapshot.bytesTransferred.toDouble() /
                snapshot.totalBytes.toDouble();
          } else if (key == 'rc') {
            rcProgress =
                snapshot.bytesTransferred.toDouble() /
                snapshot.totalBytes.toDouble();
          } else if (key == 'license') {
            licenseProgress =
                snapshot.bytesTransferred.toDouble() /
                snapshot.totalBytes.toDouble();
          }
        });
      });

      final snapshot = await uploadTask;
      final downloadUrl = await snapshot.ref.getDownloadURL();

      setState(() {
        signupData[key] = downloadUrl;
      });

      FirebaseFirestore.instance.collection('partner_documents').add({
        '$key': downloadUrl,
      });

      setState(() {
        if (key == 'aadhar') aadharImage = image;
        if (key == 'pan') panImage = image;
        if (key == 'passbook') passbookImage = image;
        if (key == 'rc') rcImage = image;
        if (key == 'license') licenseImage = image;
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('$key uploaded successfully')));
    }
  }

  Widget buildDocumentBox(
    String label,
    String key,
    File? image,
    double progress,
  ) {
    return GestureDetector(
      onTap: () => pickandUploadImage(key),
      child: Container(
        height: 120,
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey[100],
        ),
        child: Center(
          child:
              image != null
                  ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.file(
                        image,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),

                      SizedBox(height: 10),

                      LinearProgressIndicator(
                        value: progress,
                        color: Colors.green,
                        backgroundColor: Colors.grey[300],
                      ),
                    ],
                  )
                  : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.upload_file, color: Colors.grey, size: 40),
                      SizedBox(height: 8),
                      Text(label, style: TextStyle(color: Colors.grey[700])),
                    ],
                  ),
        ),
      ),
    );
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
                'Step 4: Document Uploads',
                style: TextStyle(
                  fontSize: 25,
                  color: Color.fromRGBO(12, 141, 3, 1),
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: 50),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  children: [
                    Text(
                      'Aadhar Card',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    SizedBox(width: 88),

                    Text(
                      'Pan Card',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: buildDocumentBox(
                        "Upload Aadhar Card",
                        "aadhar",
                        aadharImage,
                        aadharProgress,
                      ),
                    ),

                    SizedBox(width: 12),

                    Expanded(
                      child: buildDocumentBox(
                        "Upload Pan Card",
                        "pan",
                        panImage,
                        panProgress,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  children: [
                    Text(
                      'Passbook',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    SizedBox(width: 145),

                    Text(
                      'RC',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: buildDocumentBox(
                        "Upload Passbook",
                        "passbook",
                        passbookImage,
                        passbookProgress,
                      ),
                    ),

                    SizedBox(width: 12),

                    Expanded(
                      child: buildDocumentBox(
                        "Upload RC",
                        "field",
                        rcImage,
                        rcProgress,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  children: [
                    Text(
                      'License',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: buildDocumentBox(
                        "Upload LIcense",
                        "license",
                        licenseImage,
                        licenseProgress,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 60),

              ElevatedButton(
                onPressed: () {
                  if (aadharImage == null ||
                      panImage == null ||
                      passbookImage == null ||
                      rcImage == null ||
                      licenseImage == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please upload all required documents'),
                      ),
                    );

                    return;
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => PartnerReviewDetails(signupData: signupData),
                    ),
                  );
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
