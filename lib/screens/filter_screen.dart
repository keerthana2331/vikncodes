// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FiltersScreen extends StatefulWidget {
  final DateTime? startDate;
  final DateTime? endDate;
  final String? selectedCustomer;
  final String selectedStatus;

  const FiltersScreen({
    Key? key,
    this.startDate,
    this.endDate,
    this.selectedCustomer,
    required this.selectedStatus,
  }) : super(key: key);

  @override
  FiltersScreenState createState() => FiltersScreenState();
}

class FiltersScreenState extends State<FiltersScreen> {
  DateTime? startDate;
  DateTime? endDate;
  String? selectedCustomer;
  String selectedStatus = "Pending";
  String selectedTimeFrame = "This Month";

  final List<String> statuses = ["Pending", "Invoiced", "Cancelled"];
  final List<String> customers = [
    "Mark Smith",
    "Olivia Johnson",
    "Ethan Williams",
    "Emma Brown",
    "Noah Davis",
    "Liam Wilson",
    "Isabella Moore",
    "Lucas Taylor",
    "Mason Anderson",
    "Ava Thomas",
    "James Jackson",
    "Charlotte Harris",
  ];
  final List<String> timeFrames = ["This Month", "Last Month", "Custom"];

  @override
  void initState() {
    super.initState();
    startDate = widget.startDate;
    endDate = widget.endDate;
    selectedCustomer = widget.selectedCustomer;
    selectedStatus = widget.selectedStatus;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Filters",
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.black,
        actions: [
          Row(
            children: [
              Icon(Icons.remove_red_eye, color: Colors.blue),
              SizedBox(width: 8),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, {
                    'startDate': startDate,
                    'endDate': endDate,
                    'selectedCustomer': selectedCustomer,
                    'selectedStatus': selectedStatus,
                  });
                },
                child: Text(
                  "Filter",
                  style: GoogleFonts.poppins(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        color: Colors.black,
                        child: ListView(
                          children: timeFrames.map((timeFrame) {
                            return ListTile(
                              title: Text(
                                timeFrame,
                                style: GoogleFonts.poppins(
                                    color: Colors.white, fontSize: 16),
                              ),
                              onTap: () {
                                setState(() {
                                  selectedTimeFrame = timeFrame;
                                });
                                Navigator.pop(context);
                              },
                            );
                          }).toList(),
                        ),
                      );
                    },
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      selectedTimeFrame,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Icon(Icons.arrow_drop_down, color: Colors.blue),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          startDate = pickedDate;
                        });
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade800,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Text(
                        startDate != null
                            ? "${startDate!.day}/${startDate!.month}/${startDate!.year}"
                            : "Start Date",
                        style: GoogleFonts.poppins(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          endDate = pickedDate;
                        });
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade800,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Text(
                        endDate != null
                            ? "${endDate!.day}/${endDate!.month}/${endDate!.year}"
                            : "End Date",
                        style: GoogleFonts.poppins(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            ToggleButtons(
              isSelected:
                  statuses.map((status) => status == selectedStatus).toList(),
              onPressed: (index) {
                setState(() {
                  selectedStatus = statuses[index];
                });
              },
              selectedColor: Colors.black,
              fillColor: Colors.blue,
              borderRadius: BorderRadius.circular(8.0),
              children: statuses
                  .map(
                    (status) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        status,
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 16.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: DropdownButton<String>(
                dropdownColor: Colors.grey.shade800,
                isExpanded: true,
                underline: const SizedBox(),
                value: selectedCustomer,
                hint: Text(
                  "Customer",
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
                items: customers
                    .map(
                      (customer) => DropdownMenuItem(
                        value: customer,
                        child: Text(
                          customer,
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCustomer = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 16.0),
            if (selectedCustomer != null)
              Chip(
                backgroundColor: Colors.grey.shade800,
                label: Text(
                  selectedCustomer!,
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
                deleteIcon: const Icon(Icons.close, color: Colors.white),
                onDeleted: () {
                  setState(() {
                    selectedCustomer = null;
                  });
                },
              ),
          ],
        ),
      ),
    );
  }
}
