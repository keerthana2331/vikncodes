// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:machine_test/screens/filter_screen.dart';

class SalesListPage extends StatefulWidget {
  final String userID;
  final int branchID;

  SalesListPage({required this.userID, required this.branchID});

  @override
  SalesListPageState createState() => SalesListPageState();
}

class SalesListPageState extends State<SalesListPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _salesData = [];
  List<Map<String, dynamic>> _filteredSalesData = [];

  final List<Map<String, dynamic>> _mockSalesData = [
    {
      "saleNo": "#SALE004",
      "customerName": "Mark Smith",
      "amount": 150.00,
      "status": "Pending",
      "currency": "SAR"
    },
    {
      "saleNo": "#SALE005",
      "customerName": "Olivia Johnson",
      "amount": 250.00,
      "status": "Completed",
      "currency": "SAR"
    },
    {
      "saleNo": "#SALE006",
      "customerName": "Ethan Williams",
      "amount": 350.00,
      "status": "Pending",
      "currency": "SAR"
    },
    {
      "saleNo": "#SALE007",
      "customerName": "Emma Brown",
      "amount": 400.00,
      "status": "Cancelled",
      "currency": "SAR"
    },
    {
      "saleNo": "#SALE008",
      "customerName": "Noah Davis",
      "amount": 500.00,
      "status": "Completed",
      "currency": "SAR"
    },
    {
      "saleNo": "#SALE009",
      "customerName": "Liam Wilson",
      "amount": 600.00,
      "status": "Pending",
      "currency": "SAR"
    },
    {
      "saleNo": "#SALE010",
      "customerName": "Isabella Moore",
      "amount": 700.00,
      "status": "Completed",
      "currency": "SAR"
    },
    {
      "saleNo": "#SALE011",
      "customerName": "Lucas Taylor",
      "amount": 800.00,
      "status": "Cancelled",
      "currency": "SAR"
    },
    {
      "saleNo": "#SALE012",
      "customerName": "Mason Anderson",
      "amount": 900.00,
      "status": "Pending",
      "currency": "SAR"
    },
    {
      "saleNo": "#SALE013",
      "customerName": "Ava Thomas",
      "amount": 1000.00,
      "status": "Completed",
      "currency": "SAR"
    },
    {
      "saleNo": "#SALE014",
      "customerName": "James Jackson",
      "amount": 1100.00,
      "status": "Cancelled",
      "currency": "SAR"
    },
    {
      "saleNo": "#SALE015",
      "customerName": "Charlotte Harris",
      "amount": 1200.00,
      "status": "Pending",
      "currency": "SAR"
    },
    {
      "saleNo": "#SALE016",
      "customerName": "Benjamin Martin",
      "amount": 1300.00,
      "status": "Completed",
      "currency": "SAR"
    },
    {
      "saleNo": "#SALE017",
      "customerName": "Amelia Clark",
      "amount": 1400.00,
      "status": "Cancelled",
      "currency": "SAR"
    },
    {
      "saleNo": "#SALE018",
      "customerName": "Elijah Rodriguez",
      "amount": 1500.00,
      "status": "Pending",
      "currency": "SAR"
    },
    {
      "saleNo": "#SALE019",
      "customerName": "Harper Lewis",
      "amount": 1600.00,
      "status": "Completed",
      "currency": "SAR"
    },
    {
      "saleNo": "#SALE020",
      "customerName": "Alexander Walker",
      "amount": 1700.00,
      "status": "Cancelled",
      "currency": "SAR"
    },
    {
      "saleNo": "#SALE021",
      "customerName": "Lily Hall",
      "amount": 1800.00,
      "status": "Pending",
      "currency": "SAR"
    },
    {
      "saleNo": "#SALE022",
      "customerName": "Sebastian Allen",
      "amount": 1900.00,
      "status": "Completed",
      "currency": "SAR"
    },
    {
      "saleNo": "#SALE023",
      "customerName": "Gabriel Young",
      "amount": 2000.00,
      "status": "Pending",
      "currency": "SAR"
    },
    {
      "saleNo": "#SALE024",
      "customerName": "Chloe King",
      "amount": 2100.00,
      "status": "Cancelled",
      "currency": "SAR"
    },
    {
      "saleNo": "#SALE025",
      "customerName": "Zoe Scott",
      "amount": 2200.00,
      "status": "Completed",
      "currency": "SAR"
    },
    {
      "saleNo": "#SALE026",
      "customerName": "Matthew Wright",
      "amount": 2300.00,
      "status": "Pending",
      "currency": "SAR"
    },
    {
      "saleNo": "#SALE027",
      "customerName": "Sophie Adams",
      "amount": 2400.00,
      "status": "Completed",
      "currency": "SAR"
    },
    {
      "saleNo": "#SALE028",
      "customerName": "David Baker",
      "amount": 2500.00,
      "status": "Cancelled",
      "currency": "SAR"
    },
    {
      "saleNo": "#SALE029",
      "customerName": "Charlotte Green",
      "amount": 2600.00,
      "status": "Pending",
      "currency": "SAR"
    },
    {
      "saleNo": "#SALE030",
      "customerName": "Mia Perez",
      "amount": 2700.00,
      "status": "Completed",
      "currency": "SAR"
    }
  ];

  @override
  void initState() {
    super.initState();
    _salesData = _mockSalesData;
    _filteredSalesData = _salesData;
  }

  void onSearch() {
    setState(() {
      String searchQuery = _searchController.text.trim().toLowerCase();
      if (searchQuery.isEmpty) {
        _filteredSalesData = _salesData;
      } else {
        _filteredSalesData = _salesData
            .where((sale) =>
                sale['saleNo'].toString().toLowerCase().contains(searchQuery) ||
                sale['customerName']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery))
            .toList();
      }
    });
  }

  Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return Colors.red;
      case 'completed':
        return Colors.blue;
      case 'cancelled':
        return Colors.grey;
      default:
        return Colors.white;
    }
  }

  Widget buildSaleTile(Map<String, dynamic> sale) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sale['saleNo'],
                style: TextStyle(color: Colors.white70),
              ),
              Row(
                children: [
                  Text(
                    sale['status'],
                    style: TextStyle(
                      color: getStatusColor(sale['status']),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sale['customerName'],
                style: TextStyle(color: Colors.white),
              ),
              Text(
                '${sale['currency']} ${sale['amount'].toStringAsFixed(2)}',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          Divider(color: Colors.grey[850]),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Sales List', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      controller: _searchController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                      onChanged: (value) => onSearch(),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              FiltersScreen(selectedStatus: 'Pending')),
                    );
                  },
                  icon: Icon(Icons.filter_list, color: Colors.blue),
                  label: Text(
                    'Add Filters',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: _filteredSalesData.isEmpty
                  ? Center(
                      child: Text(
                        'No Sales Found',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _filteredSalesData.length,
                      itemBuilder: (context, index) {
                        return buildSaleTile(_filteredSalesData[index]);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SalesListPage(
                  userID: '12345',
                  branchID: 1,
                ),
              ),
            );
          },
          child: const Text('Go to Sales List'),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    home: HomePage(),
  ));
}
