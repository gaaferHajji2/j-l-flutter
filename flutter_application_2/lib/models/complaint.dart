// complaint.dart
import 'package:file_picker/file_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:image_picker/image_picker.dart';

// Enum for complaint status
enum ComplaintStatus {
  newStatus('new'),
  processing('processing'),
  finished('finished'),
  rejected('rejected'),
  requiresExtraInformation('requires_extra_information');

  const ComplaintStatus(this.value);
  final String value;

  // Factory to create enum from string
  factory ComplaintStatus.fromString(String value) {
    return ComplaintStatus.values.firstWhere(
      (status) => status.value == value,
      orElse: () => ComplaintStatus.newStatus,
    );
  }

  // Helper to get all valid status values
  static List<String> get validValues =>
      ComplaintStatus.values.map((e) => e.value).toList();
}

// Model class for Complaint
class Complaint {
  Complaint({
    String? uuid,
    required this.type,
    required this.agency,
    required this.location,
    required this.description,
    this.images = const [],
    this.docs = const [],
    this.status = ComplaintStatus.newStatus,
    this.notesFromEmployee,
    this.extraInformation,
  }) : uuid = uuid ?? const Uuid().v4();

  final String uuid;
  final String type;
  final String agency;
  final String location;
  final String description;
  final List<XFile?> images;
  final List<FilePickerResult?> docs;
  final ComplaintStatus status;
  final String? notesFromEmployee;

  final String? extraInformation;
}
