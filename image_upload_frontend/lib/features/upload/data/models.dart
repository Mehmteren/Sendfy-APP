class UploadEntry {
  final String source;
  final String date;
  final String status;

  UploadEntry({required this.source, required this.date, required this.status});

  factory UploadEntry.fromJson(Map<String, dynamic> json) {
    return UploadEntry(
      source: json['source'] ?? '',
      date: json['date'] ?? '',
      status: json['status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'source': source, 'date': date, 'status': status};
  }
}
