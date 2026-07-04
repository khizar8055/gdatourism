
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../services/tourism_api_service.dart';

class AddHospitalScreen extends StatefulWidget {
  const AddHospitalScreen({super.key});

  @override
  State<AddHospitalScreen> createState() => _AddHospitalScreenState();
}

class _AddHospitalScreenState extends State<AddHospitalScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _districtController = TextEditingController();
  final _addressController = TextEditingController();
  final _latitudeController = TextEditingController();
  final _longitudeController = TextEditingController();
  final _phoneController = TextEditingController();
  final _adminNameController = TextEditingController();
  final List<String> _selectedFacilities = [];
  bool _is247Emergency = false;
  bool _hasAmbulance = false;
  File? _selectedImage;
  bool _isLoading = false;

  final List<String> _availableFacilities = [
    'Emergency',
    'ICU',
    'Operation Theater',
    'Blood Bank',
    'Pharmacy',
    'Laboratory',
    'X-Ray',
    'Ambulance',
  ];

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    try {
      final api = TourismApiService();
      await api.createHospital(
        name: _nameController.text,
        description: _descriptionController.text,
        district: _districtController.text,
        address: _addressController.text,
        latitude: _latitudeController.text.isNotEmpty ? double.parse(_latitudeController.text) : null,
        longitude: _longitudeController.text.isNotEmpty ? double.parse(_longitudeController.text) : null,
        phone: _phoneController.text,
        adminName: _adminNameController.text,
        facilities: _selectedFacilities,
        is247Emergency: _is247Emergency,
        hasAmbulance: _hasAmbulance,
        coverImage: _selectedImage,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Hospital added successfully!')),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error adding hospital: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _districtController.dispose();
    _addressController.dispose();
    _latitudeController.dispose();
    _longitudeController.dispose();
    _phoneController.dispose();
    _adminNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Hospital'),
        backgroundColor: colorScheme.primary,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey[400]!),
                        ),
                        child: _selectedImage != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.file(
                                  _selectedImage!,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add_a_photo, size: 48, color: Colors.grey[600]),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Tap to add cover image',
                                    style: TextStyle(color: Colors.grey[600]),
                                  ),
                                ],
                              ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Hospital Name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter hospital name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _descriptionController,
                      decoration: const InputDecoration(
                        labelText: 'Description',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _districtController,
                      decoration: const InputDecoration(
                        labelText: 'District',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _addressController,
                      decoration: const InputDecoration(
                        labelText: 'Address',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _latitudeController,
                            decoration: const InputDecoration(
                              labelText: 'Latitude',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            controller: _longitudeController,
                            decoration: const InputDecoration(
                              labelText: 'Longitude',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _phoneController,
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _adminNameController,
                      decoration: const InputDecoration(
                        labelText: 'Admin Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    CheckboxListTile(
                      title: const Text('24/7 Emergency'),
                      value: _is247Emergency,
                      onChanged: (value) {
                        setState(() {
                          _is247Emergency = value!;
                        });
                      },
                      activeColor: colorScheme.primary,
                    ),
                    CheckboxListTile(
                      title: const Text('Has Ambulance'),
                      value: _hasAmbulance,
                      onChanged: (value) {
                        setState(() {
                          _hasAmbulance = value!;
                        });
                      },
                      activeColor: colorScheme.primary,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Facilities',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: _availableFacilities
                          .map((facility) => FilterChip(
                                label: Text(facility),
                                selected: _selectedFacilities.contains(facility),
                                onSelected: (selected) {
                                  setState(() {
                                    if (selected) {
                                      _selectedFacilities.add(facility);
                                    } else {
                                      _selectedFacilities.remove(facility);
                                    }
                                  });
                                },
                                selectedColor: colorScheme.primary.withValues(alpha: 0.2),
                                checkmarkColor: colorScheme.primary,
                              ))
                          .toList(),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _submitForm,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorScheme.primary,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Add Hospital', style: TextStyle(fontSize: 18)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
