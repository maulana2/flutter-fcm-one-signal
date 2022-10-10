// To parse this JSON data, do
//
//     final passengersData = passengersDataFromJson(jsonString);

import 'dart:convert';

PassengersData passengersDataFromJson(String str) =>
    PassengersData.fromJson(json.decode(str));

String passengersDataToJson(PassengersData data) => json.encode(data.toJson());

class PassengersData {
  PassengersData({
    required this.totalPassengers,
    required this.totalPages,
    required this.data,
  });

  int totalPassengers;
  int totalPages;
  List<Passenger> data;

  factory PassengersData.fromJson(Map<String, dynamic> json) => PassengersData(
        totalPassengers: json["totalPassengers"],
        totalPages: json["totalPages"],
        data: List<Passenger>.from(
            json["data"].map((x) => Passenger.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalPassengers": totalPassengers,
        "totalPages": totalPages,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Passenger {
  Passenger({
    required this.id,
    required this.name,
    required this.trips,
    required this.airline,
    required this.v,
  });

  String id;
  String name;
  int trips;
  List<Airline> airline;
  int v;

  factory Passenger.fromJson(Map<String, dynamic> json) => Passenger(
        id: json["_id"],
        name: json["name"],
        trips: json["trips"],
        airline:
            List<Airline>.from(json["airline"].map((x) => Airline.fromJson(x))),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "trips": trips,
        "airline": List<dynamic>.from(airline.map((x) => x.toJson())),
        "__v": v,
      };
}

class Airline {
  Airline({
    required this.id,
    required this.name,
    required this.country,
    required this.logo,
    required this.slogan,
    required this.headQuaters,
    required this.website,
    required this.established,
  });

  int id;
  Name? name;
  Country? country;
  String logo;
  Slogan? slogan;
  HeadQuaters? headQuaters;
  Website? website;
  String established;

  factory Airline.fromJson(Map<String, dynamic> json) => Airline(
        id: json["id"],
        name: nameValues.map[json['name']],
        country: countryValues.map[json["country"]],
        logo: json["logo"],
        slogan: sloganValues.map[json["slogan"]],
        headQuaters: headQuatersValues.map[json["head_quaters"]],
        website: websiteValues.map[json["website"]],
        established: json["established"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "country": countryValues.reverse[country],
        "logo": logo,
        "slogan": sloganValues.reverse[slogan],
        "head_quaters": headQuatersValues.reverse[headQuaters],
        "website": websiteValues.reverse[website],
        "established": established,
      };
}

enum Country { TAIWAN, QUATAR }

final countryValues =
    EnumValues({"Quatar": Country.QUATAR, "Taiwan": Country.TAIWAN});

enum HeadQuaters {
  THE_376_HSIN_NAN_RD_SEC_1_LUZHU_TAOYUAN_CITY_TAIWAN,
  QATAR_AIRWAYS_TOWERS_DOHA_QATAR
}

final headQuatersValues = EnumValues({
  "Qatar Airways Towers, Doha, Qatar":
      HeadQuaters.QATAR_AIRWAYS_TOWERS_DOHA_QATAR,
  "376, Hsin-Nan Rd., Sec. 1, Luzhu, Taoyuan City, Taiwan":
      HeadQuaters.THE_376_HSIN_NAN_RD_SEC_1_LUZHU_TAOYUAN_CITY_TAIWAN
});

enum Name { EVA_AIR, QUATAR_AIRWAYS }

final nameValues = EnumValues(
    {"Eva Air": Name.EVA_AIR, "Quatar Airways": Name.QUATAR_AIRWAYS});

enum Slogan { SHARING_THE_WORLD_FLYING_TOGETHER, GOING_PLACES_TOGETHER }

final sloganValues = EnumValues({
  "Going Places Together": Slogan.GOING_PLACES_TOGETHER,
  "Sharing the World, Flying Together": Slogan.SHARING_THE_WORLD_FLYING_TOGETHER
});

enum Website { WWW_EVAAIR_COM, WWW_QATARAIRWAYS_COM }

final websiteValues = EnumValues({
  "www.evaair.com": Website.WWW_EVAAIR_COM,
  "www.qatarairways.com": Website.WWW_QATARAIRWAYS_COM
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
