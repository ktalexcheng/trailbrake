class SensorData {
  SensorData({
    timestamp,
    this.gyroscopeX,
    this.gyroscopeY,
    this.gyroscopeZ,
    this.accelerometerX,
    this.accelerometerY,
    this.accelerometerZ,
    this.rotationX,
    this.rotationY,
    this.rotationZ,
    this.rotationW,
    this.locationLat,
    this.locationLong,
    this.locationUpdated,
    this.elapsedSeconds,
  }) {
    this.timestamp = timestamp ?? DateTime.now();
  }

  late DateTime timestamp;
  late double? gyroscopeX;
  late double? gyroscopeY;
  late double? gyroscopeZ;
  late double? accelerometerX;
  late double? accelerometerY;
  late double? accelerometerZ;
  late double? rotationX;
  late double? rotationY;
  late double? rotationZ;
  late double? rotationW;
  late double? locationLat;
  late double? locationLong;
  late bool? locationUpdated;
  late Duration? elapsedSeconds;

  SensorData.fromJson(Map<String, dynamic> json) {
    timestamp = DateTime.parse(json['timestamp']).toLocal();
    locationLat = _jsonValueToDouble(json['locationLat']);
    locationLong = _jsonValueToDouble(json['locationLong']);
    accelerometerX = _jsonValueToDouble(json['accelerometerX']);
    accelerometerY = _jsonValueToDouble(json['accelerometerY']);
    accelerometerZ = _jsonValueToDouble(json['accelerometerZ']);
    gyroscopeX = _jsonValueToDouble(json['gyroscopeX']);
    gyroscopeY = _jsonValueToDouble(json['gyroscopeY']);
    gyroscopeZ = _jsonValueToDouble(json['gyroscopeZ']);
    rotationX = _jsonValueToDouble(json['rotationX']);
    rotationY = _jsonValueToDouble(json['rotationY']);
    rotationZ = _jsonValueToDouble(json['rotationZ']);
    rotationW = _jsonValueToDouble(json['rotationW']);
  }

  Map<String, dynamic> toJson() {
    return {
      'timestamp': timestamp
          .toUtc()
          .toIso8601String(), // Convert to UTC then to ISO8601 for RFC3339 format
      'gyroscopeX': gyroscopeX,
      'gyroscopeY': gyroscopeY,
      'gyroscopeZ': gyroscopeZ,
      'accelerometerX': accelerometerX,
      'accelerometerY': accelerometerY,
      'accelerometerZ': accelerometerZ,
      'rotationX': rotationX,
      'rotationY': rotationY,
      'rotationZ': rotationZ,
      'rotationW': rotationW,
      'locationLat': locationLat,
      'locationLong': locationLong
    };
  }

  double? _jsonValueToDouble(var x) {
    if (x is num) {
      return x.toDouble();
    }
    if (x is String) {
      return double.parse(x);
    } else {
      return null;
    }
  }
}
