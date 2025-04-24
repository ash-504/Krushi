import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'partner_map_page.dart';

class NewOrdersTab extends StatelessWidget {
  const NewOrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('deliveryRequests')
          .where('status', isEqualTo: 'new')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text("No new orders available."));
        }

        final docs = snapshot.data!.docs;

        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          itemCount: docs.length,
          itemBuilder: (context, index) {
            final data = docs[index];
            final productList = List<String>.from(data['productList'] ?? []);

            return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 4,
              margin: const EdgeInsets.only(bottom: 16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pickup Location: ${data['pickupLocation'] ?? 'N/A'}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text("Drop Location: ${data['dropLocation'] ?? 'N/A'}"),
                    const SizedBox(height: 4),
                    Text("Products: ${productList.join(', ')}"),
                    const SizedBox(height: 4),
                    Text("Quantity: ${data['quantity'] ?? 'N/A'}"),
                    const SizedBox(height: 4),
                    Text("Earnings: ₹${data['earning'] ?? '0'}"),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          onPressed: () async {
                            await FirebaseFirestore.instance
                                .collection('deliveryRequests')
                                .doc(data.id)
                                .update({
                              'status': 'accepted',
                              'acceptedBy': 'partnerId_123', // TODO: Replace with actual ID
                            });

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => MapPage(
                                  pickup: data['pickupLocation'],
                                  drop: data['dropLocation'],
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.check_circle),
                          label: const Text("Accept"),
                        ),
                        OutlinedButton.icon(
                          onPressed: () {
                            FirebaseFirestore.instance
                                .collection('deliveryRequests')
                                .doc(data.id)
                                .update({'status': 'rejected'});
                          },
                          icon: const Icon(Icons.cancel),
                          label: const Text("Reject"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
