import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sixth_soloution_test/features/venues/domain/entities/venue.dart';

ListModel listModelFromJson(String str) => ListModel.fromJson(json.decode(str));

String listModelToJson(ListModel data) => json.encode(data.toJson());

class ListModel {
  ListModel({
    this.meta,
    this.response,
  });

  Meta meta;
  Response response;

  factory ListModel.fromJson(Map<String, dynamic> json) => ListModel(
        meta: Meta.fromJson(json["meta"]),
        response: Response.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "response": response.toJson(),
      };
}

class Meta {
  Meta({
    this.code,
    this.requestId,
  });

  int code;
  String requestId;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        code: json["code"],
        requestId: json["requestId"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "requestId": requestId,
      };
}

class Response {
  Response({
    this.suggestedFilters,
    this.warning,
    this.suggestedRadius,
    this.headerLocation,
    this.headerFullLocation,
    this.headerLocationGranularity,
    this.query,
    this.totalResults,
    this.suggestedBounds,
    this.groups,
  });

  SuggestedFilters suggestedFilters;
  Warning warning;
  int suggestedRadius;
  String headerLocation;
  String headerFullLocation;
  String headerLocationGranularity;
  String query;
  int totalResults;
  SuggestedBounds suggestedBounds;
  List<Group> groups;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
//        suggestedFilters: SuggestedFilters.fromJson(json["suggestedFilters"]),
//        warning: Warning.fromJson(json["warning"]),
//        suggestedRadius: json["suggestedRadius"],
//        headerLocation: json["headerLocation"],
//        headerFullLocation: json["headerFullLocation"],
//        headerLocationGranularity: json["headerLocationGranularity"],
//        query: json["query"],
//        totalResults: json["totalResults"],
//        suggestedBounds: SuggestedBounds.fromJson(json["suggestedBounds"]),
        groups: List<Group>.from(json["groups"].map((x) => Group.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "suggestedFilters": suggestedFilters.toJson(),
        "warning": warning.toJson(),
        "suggestedRadius": suggestedRadius,
        "headerLocation": headerLocation,
        "headerFullLocation": headerFullLocation,
        "headerLocationGranularity": headerLocationGranularity,
        "query": query,
        "totalResults": totalResults,
        "suggestedBounds": suggestedBounds.toJson(),
        "groups": List<dynamic>.from(groups.map((x) => x.toJson())),
      };
}

class Group {
  Group({
    this.type,
    this.name,
    this.items,
  });

  String type;
  String name;
  List<GroupItem> items;

  factory Group.fromJson(Map<String, dynamic> json) => Group(
        type: json["type"],
        name: json["name"],
        items: List<GroupItem>.from(
            json["items"].map((x) => GroupItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "name": name,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class GroupItem {
  GroupItem({
    this.reasons,
    this.venue,
    this.referralId,
    this.flags,
  });

  Reasons reasons;
  VenueListModel venue;
  String referralId;
  Flags flags;

  factory GroupItem.fromJson(Map<String, dynamic> json) => GroupItem(
        reasons: Reasons.fromJson(json["reasons"]),
        venue: VenueListModel.fromJson(json["venue"]),
        referralId: json["referralId"],
        flags: json["flags"] == null ? null : Flags.fromJson(json["flags"]),
      );

  Map<String, dynamic> toJson() => {
        "reasons": reasons.toJson(),
        "venue": venue.toJson(),
        "referralId": referralId,
        "flags": flags == null ? null : flags.toJson(),
      };
}

class Flags {
  Flags({
    this.outsideRadius,
  });

  bool outsideRadius;

  factory Flags.fromJson(Map<String, dynamic> json) => Flags(
        outsideRadius: json["outsideRadius"],
      );

  Map<String, dynamic> toJson() => {
        "outsideRadius": outsideRadius,
      };
}

class Reasons {
  Reasons({
    this.count,
    this.items,
  });

  int count;
  List<ReasonsItem> items;

  factory Reasons.fromJson(Map<String, dynamic> json) => Reasons(
        count: json["count"],
        items: List<ReasonsItem>.from(
            json["items"].map((x) => ReasonsItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class ReasonsItem {
  ReasonsItem({
    this.summary,
    this.type,
    this.reasonName,
  });

  String summary;
  String type;
  String reasonName;

  factory ReasonsItem.fromJson(Map<String, dynamic> json) => ReasonsItem(
        summary: json["summary"],
        type: json["type"],
        reasonName: json["reasonName"],
      );

  Map<String, dynamic> toJson() => {
        "summary": summary,
        "type": type,
        "reasonName": reasonName,
      };
}

class VenueListModel extends Venue with ChangeNotifier {
  VenueListModel(
      {@required String name,
      @required String id,
      this.contact,
      this.location,
      this.categories,
      this.verified,
      this.stats,
      this.beenHere,
      this.photos,
      this.hereNow,
      this.venuePage,
      this.color = Colors.white})
      : super(id: id, name: name);

  Contact contact;
  Location location;
  List<Category> categories;
  bool verified;
  Stats stats;
  BeenHere beenHere;
  Photos photos;
  HereNow hereNow;
  VenuePage venuePage;
  Color color;

  void changeColor(Color color) {
    this.color = color;
    notifyListeners();
  }

  factory VenueListModel.fromJson(Map<String, dynamic> json) => VenueListModel(
        id: json["id"],
        name: json["name"],
        contact: Contact.fromJson(json["contact"]),
        location: Location.fromJson(json["location"]),
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
//        verified: json["verified"],
//        stats: Stats.fromJson(json["stats"]),
//        beenHere: BeenHere.fromJson(json["beenHere"]),
//        photos: Photos.fromJson(json["photos"]),
//        hereNow: HereNow.fromJson(json["hereNow"]),
//        venuePage: json["venuePage"] == null
//            ? null
//            : VenuePage.fromJson(json["venuePage"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "contact": contact.toJson(),
        "location": location.toJson(),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "verified": verified,
        "stats": stats.toJson(),
        "beenHere": beenHere.toJson(),
        "photos": photos.toJson(),
        "hereNow": hereNow.toJson(),
        "venuePage": venuePage == null ? null : venuePage.toJson(),
      };
}

class BeenHere {
  BeenHere({
    this.count,
    this.lastCheckinExpiredAt,
    this.marked,
    this.unconfirmedCount,
  });

  int count;
  int lastCheckinExpiredAt;
  bool marked;
  int unconfirmedCount;

  factory BeenHere.fromJson(Map<String, dynamic> json) => BeenHere(
        count: json["count"],
        lastCheckinExpiredAt: json["lastCheckinExpiredAt"],
        marked: json["marked"],
        unconfirmedCount: json["unconfirmedCount"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "lastCheckinExpiredAt": lastCheckinExpiredAt,
        "marked": marked,
        "unconfirmedCount": unconfirmedCount,
      };
}

class Category {
  Category({
    this.id,
    this.name,
    this.pluralName,
    this.shortName,
    this.icon,
    this.primary,
  });

  String id;
  String name;
  String pluralName;
  String shortName;
  Icon icon;
  bool primary;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        pluralName: json["pluralName"],
        shortName: json["shortName"],
        icon: Icon.fromJson(json["icon"]),
        primary: json["primary"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "pluralName": pluralName,
        "shortName": shortName,
        "icon": icon.toJson(),
        "primary": primary,
      };
}

class Icon {
  Icon({
    this.prefix,
    this.suffix,
  });

  String prefix;
  String suffix;

  factory Icon.fromJson(Map<String, dynamic> json) => Icon(
        prefix: json["prefix"],
        suffix: json["suffix"],
      );

  Map<String, dynamic> toJson() => {
        "prefix": prefix,
        "suffix": suffix,
      };
}

class Contact {
  Contact();

  factory Contact.fromJson(Map<String, dynamic> json) => Contact();

  Map<String, dynamic> toJson() => {};
}

class HereNow {
  HereNow({
    this.count,
    this.summary,
    this.groups,
  });

  int count;
  String summary;
  List<dynamic> groups;

  factory HereNow.fromJson(Map<String, dynamic> json) => HereNow(
        count: json["count"],
        summary: json["summary"],
        groups: List<dynamic>.from(json["groups"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "summary": summary,
        "groups": List<dynamic>.from(groups.map((x) => x)),
      };
}

class Location {
  Location({
    this.address,
    this.crossStreet,
    this.lat,
    this.lng,
    this.labeledLatLngs,
    this.distance,
    this.postalCode,
    this.cc,
    this.city,
    this.state,
    this.country,
    this.formattedAddress,
  });

  String address;
  String crossStreet;
  double lat;
  double lng;
  List<LabeledLatLng> labeledLatLngs;
  int distance;
  String postalCode;
  String cc;
  String city;
  String state;
  String country;
  List<String> formattedAddress;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        address: json["address"],
        crossStreet: json["crossStreet"] == null ? null : json["crossStreet"],
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
        labeledLatLngs: List<LabeledLatLng>.from(
            json["labeledLatLngs"].map((x) => LabeledLatLng.fromJson(x))),
        distance: json["distance"],
        postalCode: json["postalCode"],
        cc: json["cc"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        formattedAddress:
            List<String>.from(json["formattedAddress"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "crossStreet": crossStreet == null ? null : crossStreet,
        "lat": lat,
        "lng": lng,
        "labeledLatLngs":
            List<dynamic>.from(labeledLatLngs.map((x) => x.toJson())),
        "distance": distance,
        "postalCode": postalCode,
        "cc": cc,
        "city": city,
        "state": state,
        "country": country,
        "formattedAddress": List<dynamic>.from(formattedAddress.map((x) => x)),
      };
}

class LabeledLatLng {
  LabeledLatLng({
    this.label,
    this.lat,
    this.lng,
  });

  String label;
  double lat;
  double lng;

  factory LabeledLatLng.fromJson(Map<String, dynamic> json) => LabeledLatLng(
        label: json["label"],
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "lat": lat,
        "lng": lng,
      };
}

class Photos {
  Photos({
    this.count,
    this.groups,
  });

  int count;
  List<dynamic> groups;

  factory Photos.fromJson(Map<String, dynamic> json) => Photos(
        count: json["count"],
        groups: List<dynamic>.from(json["groups"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "groups": List<dynamic>.from(groups.map((x) => x)),
      };
}

class Stats {
  Stats({
    this.tipCount,
    this.usersCount,
    this.checkinsCount,
    this.visitsCount,
  });

  int tipCount;
  int usersCount;
  int checkinsCount;
  int visitsCount;

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        tipCount: json["tipCount"],
        usersCount: json["usersCount"],
        checkinsCount: json["checkinsCount"],
        visitsCount: json["visitsCount"],
      );

  Map<String, dynamic> toJson() => {
        "tipCount": tipCount,
        "usersCount": usersCount,
        "checkinsCount": checkinsCount,
        "visitsCount": visitsCount,
      };
}

class VenuePage {
  VenuePage({
    this.id,
  });

  String id;

  factory VenuePage.fromJson(Map<String, dynamic> json) => VenuePage(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

class SuggestedBounds {
  SuggestedBounds({
    this.ne,
    this.sw,
  });

  Ne ne;
  Ne sw;

  factory SuggestedBounds.fromJson(Map<String, dynamic> json) =>
      SuggestedBounds(
        ne: Ne.fromJson(json["ne"]),
        sw: Ne.fromJson(json["sw"]),
      );

  Map<String, dynamic> toJson() => {
        "ne": ne.toJson(),
        "sw": sw.toJson(),
      };
}

class Ne {
  Ne({
    this.lat,
    this.lng,
  });

  double lat;
  double lng;

  factory Ne.fromJson(Map<String, dynamic> json) => Ne(
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class SuggestedFilters {
  SuggestedFilters({
    this.header,
    this.filters,
  });

  String header;
  List<Filter> filters;

  factory SuggestedFilters.fromJson(Map<String, dynamic> json) =>
      SuggestedFilters(
        header: json["header"],
        filters:
            List<Filter>.from(json["filters"].map((x) => Filter.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "header": header,
        "filters": List<dynamic>.from(filters.map((x) => x.toJson())),
      };
}

class Filter {
  Filter({
    this.name,
    this.key,
  });

  String name;
  String key;

  factory Filter.fromJson(Map<String, dynamic> json) => Filter(
        name: json["name"],
        key: json["key"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "key": key,
      };
}

class Warning {
  Warning({
    this.text,
  });

  String text;

  factory Warning.fromJson(Map<String, dynamic> json) => Warning(
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
      };
}
