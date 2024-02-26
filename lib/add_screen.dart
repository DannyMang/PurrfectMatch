// lib/add_screen.dart
import 'package:flutter/material.dart';

class AdminPanelScreen extends StatefulWidget {
  const AdminPanelScreen({super.key});

  @override
  AdminPanelScreenState createState() => AdminPanelScreenState();
}

class AdminPanelScreenState extends State<AdminPanelScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _breedController = TextEditingController();
  final TextEditingController _coatTypeController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _bondedWithController = TextEditingController();
  final TextEditingController _neuteredWhenController = TextEditingController();
  final TextEditingController _blobTextController = TextEditingController();

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
          crossAxisAlignment: CrossAxisAlignment.start,
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
                border: InputBorder.none,
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
                  body: Column(
                    children: [
                      TextField(
                        controller: _breedController,
                        decoration: const InputDecoration(
                          hintText: 'Breed',
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      TextField(
                        controller: _coatTypeController,
                        decoration: const InputDecoration(
                          hintText: 'Coat Type',
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      TextField(
                        controller: _ageController,
                        decoration: const InputDecoration(
                          hintText: 'Age',
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      TextField(
                        controller: _genderController,
                        decoration: const InputDecoration(
                          hintText: 'Gender',
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(
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
                                hintText: 'With who (separated by commas)',
                                border: InputBorder.none,
                              ),
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            )
                          : const SizedBox(), // Use SizedBox for an empty box if not bonded
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
                                hintText: 'When (date)',
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.number,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            )
                          : const SizedBox(), // Use SizedBox for an empty box if not neutered
                    ],
                  ),
                  isExpanded: _detailsExpanded,
                ),
              ],
            ),
            const Divider(
              height: 50, // Provides spacing above and below the divider
              thickness: 2, // Thickness of the line
            ),
            const Text(
              'Or copy and paste a big description of them and we\'ll handle it from there',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            TextField(
              controller: _blobTextController,
              decoration: const InputDecoration(
                hintText: 'Paste your text here',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                    vertical: 10), // Adjusts vertical padding
              ),
              style: const TextStyle(
                fontSize: 16,
              ),
              maxLines: null, // Allows the text field to expand vertically
            ),
          ],
        ),
      ),
    );
  }
}
