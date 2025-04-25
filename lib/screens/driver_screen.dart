// Add at the top of both files
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/parking_spot.dart';

class DriverScreen extends StatefulWidget {
  const DriverScreen({super.key});

  @override
  State<DriverScreen> createState() => _DriverScreenState();
}

class _DriverScreenState extends State<DriverScreen> {
  late GoogleMapController _mapController;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final LatLng _kampalaCenter = const LatLng(0.3132, 32.5677);

  Set<Marker> _createMarkers(List<QueryDocumentSnapshot> docs) {
    return docs.map((doc) {
      final spot = ParkingSpot.fromFirestore(doc);
      return Marker(
        markerId: MarkerId(doc.id),
        position: LatLng(
          spot.location.latitude,
          spot.location.longitude,
        ),
        infoWindow: InfoWindow(
          title: spot.name,
          snippet: '${spot.pricePerHour} UGX/hr | ${spot.availableSlots} slots',
        ),
        onTap: () => _navigateToParking(spot.location),
      );
    }).toSet();
  }

  Future<void> _navigateToParking(GeoPoint destination) async {
    final url = 'https://www.google.com/maps/dir/?api=1'
        '&destination=${destination.latitude},${destination.longitude}';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parking Map'),
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

          return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _kampalaCenter,
              zoom: 14,
            ),
            markers: _createMarkers(snapshot.data!.docs),
            onMapCreated: (controller) => _mapController = controller,
            myLocationEnabled: true,
          );
        },
      ),
    );
  }
}
