class StationCardData {
  final double humidity;
  final int id;
  final String name;
  final String phone;
  final int temperature;
  final String timestamp;
  final int wind;

  StationCardData(
      {required this.humidity,
      required this.id,
      required this.name,
      required this.phone,
      required this.temperature,
      required this.timestamp,
      required this.wind});

  factory StationCardData.fromJson(Map<String, dynamic> json) {
    return StationCardData(
        humidity: json['humidity'],
        id: json['id'],
        name: json['name'],
        phone: json['phone'],
        temperature: json['temperature'],
        timestamp: json['timestamp'],
        wind: json['wind']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['humidity'] = humidity;
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['temperature'] = temperature;
    data['timestamp'] = timestamp;
    data['wind'] = wind;
    return data;
  }
}
