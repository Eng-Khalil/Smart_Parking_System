// Add at the top of both files
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/parking_spot.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _addParkingSpot(ParkingSpot spot) async {
    await _firestore.collection('parking_spots').add({
      'name': spot.name,
      'location': GeoPoint(spot.location.latitude, spot.location.longitude),
      'pricePerHour': spot.pricePerHour,
      'availableSlots': spot.availableSlots,
      'totalSlots': spot.totalSlots,
    });
  }

  Future<void> _updateParkingSpot(String docId, ParkingSpot spot) async {
    await _firestore.collection('parking_spots').doc(docId).update({
      'name': spot.name,
      'pricePerHour': spot.pricePerHour,
      'availableSlots': spot.availableSlots,
    });
  }

  void _showEditDialog(DocumentSnapshot doc) {
    final spot = ParkingSpot.fromFirestore(doc);
    showDialog(
      context: context,
      builder: (context) => ParkingSpotDialog(
        spot: spot,
        onSave: (updatedSpot) => _updateParkingSpot(doc.id, updatedSpot),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => FirebaseAuth.instance.signOut().then((_) {
              Navigator.pushReplacementNamed(context, '/login');
            }),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('parking_spots').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return const Center(child: CircularProgressIndicator());

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final doc = snapshot.data!.docs[index];
              final spot = ParkingSpot.fromFirestore(doc);

              return ListTile(
                title: Text(spot.name),
                subtitle: Text(
                    '${spot.availableSlots}/${spot.totalSlots} slots - ${spot.pricePerHour} UGX/hr'),
                trailing: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => _showEditDialog(doc),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => showDialog(
          context: context,
          builder: (context) => ParkingSpotDialog(
            spot: ParkingSpot.empty(),
            onSave: _addParkingSpot,
          ),
        ),
      ),
    );
  }
}

class ParkingSpotDialog extends StatefulWidget {
  final ParkingSpot spot;
  final Function(ParkingSpot) onSave;

  const ParkingSpotDialog(
      {super.key, required this.spot, required this.onSave});

  @override
  State<ParkingSpotDialog> createState() => _ParkingSpotDialogState();
}

class _ParkingSpotDialogState extends State<ParkingSpotDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _priceController;
  late TextEditingController _availableController;
  late TextEditingController _totalController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.spot.name);
    _priceController =
        TextEditingController(text: widget.spot.pricePerHour.toString());
    _availableController =
        TextEditingController(text: widget.spot.availableSlots.toString());
    _totalController =
        TextEditingController(text: widget.spot.totalSlots.toString());
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.spot.name.isEmpty ? 'Add Parking' : 'Edit Parking'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _priceController,
                decoration:
                    const InputDecoration(labelText: 'Price per hour (UGX)'),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _availableController,
                decoration: const InputDecoration(labelText: 'Available Slots'),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _totalController,
                decoration: const InputDecoration(labelText: 'Total Slots'),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: Navigator.of(context).pop,
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final updatedSpot = ParkingSpot(
                name: _nameController.text,
                location: widget.spot.location,
                pricePerHour: int.parse(_priceController.text),
                availableSlots: int.parse(_availableController.text),
                totalSlots: int.parse(_totalController.text),
              );
              widget.onSave(updatedSpot);
              Navigator.of(context).pop();
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
