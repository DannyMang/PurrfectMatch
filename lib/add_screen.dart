import 'package:flutter/material.dart';

class AdminPanelScreen extends StatefulWidget {
  const AdminPanelScreen({super.key});

  @override
  AdminPanelScreenState createState() => AdminPanelScreenState();
}

class AdminPanelScreenState extends State<AdminPanelScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _bondedWithController = TextEditingController();
  final TextEditingController _neuteredWhenController = TextEditingController();

  bool _isBonded = false;
  bool _isNeutered = false;
  bool _aboutExpanded = false;
  bool _detailsExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Panel'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Text(
              'Name',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: 'Enter name',
                border: InputBorder.none, // Removes default underline border
                contentPadding: EdgeInsets.symmetric(
                    vertical: 10), // Adjusts vertical padding
              ),
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  if (index == 0) {
                    _aboutExpanded = !isExpanded;
                  } else if (index == 1) {
                    _detailsExpanded = !isExpanded;
                  }
                });
              },
              children: [
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return const ListTile(
                      title: Text(
                        'About',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    );
                  },
                  body: const Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Breed',
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Coat Type',
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Age',
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Gender',
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  isExpanded: _aboutExpanded,
                ),
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return const ListTile(
                      title: Text(
                        'Details',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    );
                  },
                  body: Column(
                    children: [
                      SwitchListTile(
                        title: const Text('Bonded'),
                        value: _isBonded,
                        onChanged: (bool value) {
                          setState(() {
                            _isBonded = value;
                          });
                        },
                      ),
                      _isBonded
                          ? TextField(
                              controller: _bondedWithController,
                              decoration: const InputDecoration(
                                hintText: 'With who is this cat bonded with?',
                                border: InputBorder.none,
                              ),
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            )
                          : const SizedBox(), // Use SizedBox for an empty box
                      SwitchListTile(
                        title: const Text('Neutered'),
                        value: _isNeutered,
                        onChanged: (bool value) {
                          setState(() {
                            _isNeutered = value;
                          });
                        },
                      ),
                      _isNeutered
                          ? TextField(
                              controller: _neuteredWhenController,
                              decoration: const InputDecoration(
                                hintText: 'When was this cat neutered?',
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.number,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            )
                          : const SizedBox(), // Use SizedBox for an empty box
                    ],
                  ),
                  isExpanded: _detailsExpanded,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
