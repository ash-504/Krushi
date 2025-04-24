import 'package:flutter/material.dart';
import 'partner_new_orders_tab.dart';
import 'partner_previous_orders_tab.dart';

class DeliveryHomePage extends StatelessWidget {
  const DeliveryHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Krushi Delivery"),
          backgroundColor: const Color.fromRGBO(12, 141, 3, 1),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                // TODO: Navigate to Notifications Page
              },
            ),
            IconButton(
              icon: const Icon(Icons.account_circle),
              onPressed: () {
                // TODO: Navigate to Profile Page
              },
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: "New Orders"),
              Tab(text: "Previous Orders"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            NewOrdersTab(),
            PreviousOrdersTab(),
          ],
        ),
      ),
    );
  }
}
