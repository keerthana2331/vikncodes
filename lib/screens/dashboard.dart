import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:machine_test/screens/invoices.dart';
import 'package:machine_test/screens/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'CabZing',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      );
                    },
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  
                ],
              ),
              const SizedBox(height: 24),

              // Revenue Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'SAR 2,78,000.00',
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              '+21% than last month',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Revenue',
                          style: TextStyle(
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Chart
                    SizedBox(
                      height: 160,
                      child: LineChart(
                        LineChartData(
                          gridData: FlGridData(show: false),
                          titlesData: FlTitlesData(
                            rightTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            topTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                          ),
                          borderData: FlBorderData(show: false),
                          lineBarsData: [
                            LineChartBarData(
                              spots: const [
                                FlSpot(0, 2),
                                FlSpot(1, 2.2),
                                FlSpot(2, 3.9),
                                FlSpot(3, 3),
                                FlSpot(4, 2.8),
                                FlSpot(5, 2.4),
                                FlSpot(6, 2.6),
                                FlSpot(7, 2.2),
                              ],
                              isCurved: true,
                              color: Colors.blue[400],
                              barWidth: 2,
                              belowBarData: BarAreaData(
                                show: true,
                                color: Colors.blue.withOpacity(0.1),
                              ),
                              dotData: FlDotData(show: false),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Date Indicators
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(
                        8,
                        (index) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: index == 1
                                ? Colors.blue
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            '0${index + 1}',
                            style: TextStyle(
                              color: index == 1
                                  ? Colors.white
                                  : Colors.grey[400],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Bookings Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.access_time, color: Colors.white),
                        ),
                        const SizedBox(width: 12),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Bookings',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '123 Reserved',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Icon(Icons.chevron_right, color: Colors.grey),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Invoices Card (With navigation)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.person_outline,
                              color: Colors.green),
                        ),
                        const SizedBox(width: 12),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Invoices',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '10,232.00 Rupees',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => InvoicesPage()),
                        );
                      },
                      child: const Icon(Icons.chevron_right, color: Colors.grey),
                    ),
                  ],
                ),
              ),

              // Bottom Navigation
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.home, color: Colors.blue[400]),
                  const Icon(Icons.check_box_outlined, color: Colors.grey),
                  const Icon(Icons.notifications_outlined, color: Colors.grey),
                  const Icon(Icons.person_outline, color: Colors.grey),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// // Invoices Page
// class InvoicesPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Invoices'),
//         backgroundColor: Colors.black,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Search and Filter Row
//             Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     decoration: InputDecoration(
//                       hintText: 'Search',
//                       prefixIcon: Icon(Icons.search, color: Colors.white),
//                       filled: true,
//                       fillColor: Colors.grey[850],
//                       contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8.0),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 10.0),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Add filter action here
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.grey[850],
//                   ),
//                   child: const Text('Add Filters'),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20.0),
//             // Invoice List
//             Expanded(
//               child: ListView(
//                 children: [
//                   _buildInvoiceTile('12345', 'Pending', 'Customer Name', 10000.0, Colors.red),
//                   _buildInvoiceTile('67890', 'Invoiced', 'Customer Name', 10000.0, Colors.blue),
//                   _buildInvoiceTile('24680', 'Cancelled', 'Customer Name', 10000.0, Colors.grey),
//                   _buildInvoiceTile('13579', 'Pending', 'Customer Name', 10000.0, Colors.red),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       backgroundColor: Colors.black,
//     );
//   }

//   Widget _buildInvoiceTile(String invoiceNo, String status, String customerName, double amount, Color statusColor) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             '#Invoice No $invoiceNo',
//             style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 4.0),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 customerName,
//                 style: const TextStyle(color: Colors.white70, fontSize: 14),
//               ),
//               Text(
//                 'SAR ${amount.toStringAsFixed(2)}',
//                 style: const TextStyle(color: Colors.white, fontSize: 14),
//               ),
//             ],
//           ),
//           const SizedBox(height: 4.0),
//           Text(
//             status,
//             style: TextStyle(color: statusColor, fontSize: 14, fontWeight: FontWeight.w500),
//           ),
//           const Divider(color: Colors.white38),
//         ],
//       ),
//     );
//   }
// }
