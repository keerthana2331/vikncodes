import 'package:flutter/material.dart';
import 'package:machine_test/screens/filter_screen.dart';
// Import your FilterPage here.

class InvoicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoices'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search and Filter Row
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search, color: Colors.white),
                      filled: true,
                      fillColor: Colors.grey[850],
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                GestureDetector(
                  onTap: () {
                    // Navigate to the FilterPage when the "Add Filter" button is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FiltersScreen()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Add Filters',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            // Invoice List
            Expanded(
              child: ListView(
                children: [
                  _buildInvoiceTile('12345', 'Pending', 'Customer Name', 10000.0, Colors.red),
                  _buildInvoiceTile('67890', 'Invoiced', 'Customer Name', 10000.0, Colors.blue),
                  _buildInvoiceTile('24680', 'Cancelled', 'Customer Name', 10000.0, Colors.grey),
                  _buildInvoiceTile('13579', 'Pending', 'Customer Name', 10000.0, Colors.red),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }

  Widget _buildInvoiceTile(String invoiceNo, String status, String customerName, double amount, Color statusColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '#Invoice No $invoiceNo',
            style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                customerName,
                style: const TextStyle(color: Colors.white70, fontSize: 14),
              ),
              Text(
                'SAR ${amount.toStringAsFixed(2)}',
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 4.0),
          Text(
            status,
            style: TextStyle(color: statusColor, fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const Divider(color: Colors.white38),
        ],
      ),
    );
  }
}
