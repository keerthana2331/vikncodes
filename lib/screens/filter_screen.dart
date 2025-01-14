import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FiltersScreen(),
  ));
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  DateTime? startDate;
  DateTime? endDate;
  String? selectedCustomer;
  final List<String> statuses = ["Pending", "Invoiced", "Cancelled"];
  String selectedStatus = "Pending";
  final List<String> customers = ["savad farooque", "john doe", "jane doe"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen (InvoicesPage)
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              // After applying the filter, navigate back to the InvoicesPage
              Navigator.pop(context); // Go back to the previous screen (InvoicesPage)
            },
            child: const Text(
              "Filter",
              style: TextStyle(color: Colors.blue),
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date Picker Row
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
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        startDate != null
                            ? "${startDate!.day}/${startDate!.month}/${startDate!.year}"
                            : "Start Date",
                        style: const TextStyle(color: Colors.white),
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
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        endDate != null
                            ? "${endDate!.day}/${endDate!.month}/${endDate!.year}"
                            : "End Date",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16.0),

            // Status Toggle Buttons
            ToggleButtons(
              isSelected: statuses.map((status) => status == selectedStatus).toList(),
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
                      child: Text(status),
                    ),
                  )
                  .toList(),
            ),

            const SizedBox(height: 16.0),

            // Dropdown for Customer Selection
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
                hint: const Text(
                  "Customer",
                  style: TextStyle(color: Colors.white),
                ),
                items: customers
                    .map(
                      (customer) => DropdownMenuItem(
                        value: customer,
                        child: Text(
                          customer,
                          style: const TextStyle(color: Colors.white),
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

            // Selected Customer Chip
            if (selectedCustomer != null)
              Chip(
                backgroundColor: Colors.grey.shade800,
                label: Text(
                  selectedCustomer!,
                  style: const TextStyle(color: Colors.white),
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
