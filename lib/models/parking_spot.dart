import 'package:cloud_firestore/cloud_firestore.dart';

class ParkingSpot {
  final String name;
  final GeoPoint location;
  final int pricePerHour;
  final int availableSlots;
  final int totalSlots;

  ParkingSpot({
    required this.name,
    required this.location,
    required this.pricePerHour,
    required this.availableSlots,
    required this.totalSlots,
  });

  factory ParkingSpot.empty() => ParkingSpot(
        name: '',
        location: const GeoPoint(0.0, 0.0),
        pricePerHour: 0,
        availableSlots: 0,
        totalSlots: 0,
      );

  factory ParkingSpot.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ParkingSpot(
      name: data['name'],
      location: data['location'],
      pricePerHour: data['pricePerHour'],
      availableSlots: data['availableSlots'],
      totalSlots: data['totalSlots'],
    );
  }
}
