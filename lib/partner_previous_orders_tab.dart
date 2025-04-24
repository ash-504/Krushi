import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PreviousOrdersTab extends StatelessWidget {
  const PreviousOrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:
          FirebaseFirestore.instance
              .collection('deliveryRequests')
              .where('status', whereIn: ['accepted', 'delivered'])
              .where(
                'acceptedBy',
                isEqualTo: 'partnerId_123',
              ) // Replace with actual ID
              .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return const Center(child: CircularProgressIndicator());

        final docs = snapshot.data!.docs;

        if (docs.isEmpty)
          return const Center(child: Text("No previous orders."));

        int totalEarnings = docs.fold(
          0,
          (sum, doc) => sum + int.tryParse(doc['earning'].toString())!,
        );

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "Total Earnings: ₹$totalEarnings",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  final data = docs[index];
                  return ListTile(
                    title: Text("Pickup: ${data['pickupLocation']}"),
                    subtitle: Text(
                      "Drop: ${data['dropLocation']}\nEarned: ₹${data['earning']}",
                    ),
                    isThreeLine: true,
                    trailing: const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
