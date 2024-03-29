import 'package:trailbrake/src/ride/data/model/ride_data.dart';
import 'package:trailbrake/src/ride/data/model/ride_record.dart';
import 'package:trailbrake/src/ride/data/model/sensor_data.dart';
import 'package:trailbrake/src/common/common.dart';

abstract class Ride with RideRecordMixin, RideDataMixin {}

class NewRide extends Ride {
  NewRide({
    required rideName,
    required rideDate,
    required rideData,
  }) {
    super.rideName = rideName;
    super.rideDate = rideDate;
    super.data = rideData;
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> _rideDataList = [];

    for (var element in data) {
      _rideDataList.add(element.toJson());
    }

    return {
      'rideName': super.rideName,
      'rideDate': super
          .rideDate
          .toUtc()
          .toIso8601String(), // Convert to UTC then to ISO8601 for RFC3339 format
      'rideData': _rideDataList,
    };
  }
}

class SavedRide extends Ride {
  SavedRide({
    required id,
    required rideName,
    required rideDate,
    required rideScore,
    required rideMeta,
    required rideData,
  }) {
    super.id = id;
    super.rideName = rideName;
    super.rideDate = rideDate;
    super.rideScore = rideScore;
    super.rideMeta = rideMeta;
    super.data = rideData;
  }

  factory SavedRide.fromJson(Map<String, dynamic> json) {
    List<SensorData> _rideData = <SensorData>[];
    if (json['rideData'].isNotEmpty) {
      for (var data in json['rideData']) {
        _rideData.add(SensorData.fromJson(data));
      }
    }

    return SavedRide(
      id: json['_id'],
      rideName: json['rideName'],
      rideDate: DateTime.parse(json['rideDate']).toLocal(),
      rideScore: RideScore.fromJson(json['rideScore']),
      rideMeta: RideMeta.fromJson(json['rideMeta']),
      rideData: _rideData,
    );
  }
}
