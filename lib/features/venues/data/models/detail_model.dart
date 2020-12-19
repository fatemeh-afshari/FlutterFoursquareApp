// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:sixth_soloution_test/features/venues/domain/entities/venue.dart';

DetailModel detailModelFromJson(String str) => DetailModel.fromJson(json.decode(str));

String detailModelToJson(DetailModel data) => json.encode(data.toJson());

class DetailModel {
  DetailModel({
    this.meta,
    this.response,
  });

  Meta meta;
  Response response;

  factory DetailModel.fromJson(Map<String, dynamic> json) => DetailModel(
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
    this.venue,
  });

  VenueDetailModel venue;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    venue: VenueDetailModel.fromJson(json["venue"]),
  );

  Map<String, dynamic> toJson() => {
    "venue": venue.toJson(),
  };
}

class VenueDetailModel extends Venue {
  VenueDetailModel({
    @required String name,
    @required String id,
    this.contact,
    this.location,
    this.canonicalUrl,
    this.categories,
    this.verified,
    this.stats,
    this.url,
    this.likes,
    this.dislike,
    this.ok,
    this.rating,
    this.ratingColor,
    this.ratingSignals,
    this.venueRatingBlacklisted,
    this.allowMenuUrlEdit,
    this.beenHere,
    this.specials,
    this.photos,
    this.reasons,
    this.description,
    this.storeId,
    this.page,
    this.hereNow,
    this.createdAt,
    this.tips,
    this.shortUrl,
    this.timeZone,
    this.listed,
    this.hours,
    this.popular,
    this.seasonalHours,
    this.defaultHours,
    this.pageUpdates,
    this.inbox,
    this.venueChains,
    this.attributes,
    this.bestPhoto,
    this.colors,
  }): super(id: id, name: name);

  Contact contact;
  Location location;
  String canonicalUrl;
  List<Category> categories;
  bool verified;
  Stats stats;
  String url;
  HereNow likes;
  bool dislike;
  bool ok;
  double rating;
  String ratingColor;
  int ratingSignals;
  bool venueRatingBlacklisted;
  bool allowMenuUrlEdit;
  BeenHere beenHere;
  Inbox specials;
  Listed photos;
  Inbox reasons;
  String description;
  String storeId;
  Page page;
  HereNow hereNow;
  int createdAt;
  Listed tips;
  String shortUrl;
  String timeZone;
  Listed listed;
  Hours hours;
  Popular popular;
  List<dynamic> seasonalHours;
  Hours defaultHours;
  Inbox pageUpdates;
  Inbox inbox;
  List<dynamic> venueChains;
  Attributes attributes;
  Photo bestPhoto;
  Colors colors;

  factory VenueDetailModel.fromJson(Map<String, dynamic> json) => VenueDetailModel(
    id: json["id"],
    name: json["name"],
    contact:  json["contact"] == null ? null :Contact.fromJson(json["contact"]),
    location: json["location"]== null ? null: Location.fromJson(json["location"]),
//    canonicalUrl: json["canonicalUrl"]== null ? null:json["canonicalUrl"],
//    categories: json["categories"]== null ? null:List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
//    verified: json["verified"]== null ? null:json["verified"],
//    stats: Stats.fromJson(json["stats"]),
//    url: json["url"],
//    likes: HereNow.fromJson(json["likes"]),
//    dislike: json["dislike"],
//    ok: json["ok"],
//    //rating: json["rating"].toDouble(),
//    rating: 0,
//    ratingColor: json["ratingColor"],
//    ratingSignals: json["ratingSignals"],
//    venueRatingBlacklisted: json["venueRatingBlacklisted"],
//    allowMenuUrlEdit: json["allowMenuUrlEdit"],
//    beenHere: BeenHere.fromJson(json["beenHere"]),
//    specials: Inbox.fromJson(json["specials"]),
  //  photos: Listed.fromJson(json["photos"]),
//    reasons: Inbox.fromJson(json["reasons"]),
//    description: json["description"],
//    storeId: json["storeId"],
//    page: Page.fromJson(json["page"]),
//    hereNow: HereNow.fromJson(json["hereNow"]),
//    createdAt: json["createdAt"],
//    tips: Listed.fromJson(json["tips"]),
//    shortUrl: json["shortUrl"],
//    timeZone: json["timeZone"],
//    listed: Listed.fromJson(json["listed"]),
//    hours: Hours.fromJson(json["hours"]),
//    popular: Popular.fromJson(json["popular"]),
//    seasonalHours: List<dynamic>.from(json["seasonalHours"].map((x) => x)),
//    defaultHours: Hours.fromJson(json["defaultHours"]),
//    pageUpdates: Inbox.fromJson(json["pageUpdates"]),
//    inbox: Inbox.fromJson(json["inbox"]),
//    venueChains: List<dynamic>.from(json["venueChains"].map((x) => x)),
//    attributes: Attributes.fromJson(json["attributes"]),
//    bestPhoto: Photo.fromJson(json["bestPhoto"]),
//    colors: Colors.fromJson(json["colors"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "contact": contact.toJson(),
    "location": location.toJson(),
    "canonicalUrl": canonicalUrl,
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "verified": verified,
    "stats": stats.toJson(),
    "url": url,
    "likes": likes.toJson(),
    "dislike": dislike,
    "ok": ok,
    "rating": rating,
    "ratingColor": ratingColor,
    "ratingSignals": ratingSignals,
    "venueRatingBlacklisted": venueRatingBlacklisted,
    "allowMenuUrlEdit": allowMenuUrlEdit,
    "beenHere": beenHere.toJson(),
    "specials": specials.toJson(),
    "photos": photos.toJson(),
    "reasons": reasons.toJson(),
    "description": description,
    "storeId": storeId,
    "page": page.toJson(),
    "hereNow": hereNow.toJson(),
    "createdAt": createdAt,
    "tips": tips.toJson(),
    "shortUrl": shortUrl,
    "timeZone": timeZone,
    "listed": listed.toJson(),
    "hours": hours.toJson(),
    "popular": popular.toJson(),
    "seasonalHours": List<dynamic>.from(seasonalHours.map((x) => x)),
    "defaultHours": defaultHours.toJson(),
    "pageUpdates": pageUpdates.toJson(),
    "inbox": inbox.toJson(),
    "venueChains": List<dynamic>.from(venueChains.map((x) => x)),
    "attributes": attributes.toJson(),
    "bestPhoto": bestPhoto.toJson(),
    "colors": colors.toJson(),
  };
}

class Attributes {
  Attributes({
    this.groups,
  });

  List<Group> groups;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
    groups: List<Group>.from(json["groups"].map((x) => Group.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "groups": List<dynamic>.from(groups.map((x) => x.toJson())),
  };
}

class HereNow {
  HereNow({
    this.count,
    this.summary,
    this.groups,
  });

  int count;
  String summary;
  List<Group> groups;

  factory HereNow.fromJson(Map<String, dynamic> json) => HereNow(
    count: json["count"],
    summary: json["summary"],
    groups: List<Group>.from(json["groups"].map((x) => Group.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "summary": summary,
    "groups": List<dynamic>.from(groups.map((x) => x.toJson())),
  };
}

class GroupItem {
  GroupItem({
    this.id,
    this.name,
    this.description,
    this.type,
    this.user,
    this.editable,
    this.public,
    this.collaborative,
    this.url,
    this.canonicalUrl,
    this.createdAt,
    this.updatedAt,
    this.photo,
    this.followers,
    this.listItems,
    this.prefix,
    this.suffix,
    this.width,
    this.height,
    this.visibility,
    this.text,
    this.lang,
    this.likes,
    this.logView,
    this.agreeCount,
    this.disagreeCount,
    this.todo,
    this.firstName,
    this.lastName,
    this.countryCode,
  });

  String id;
  String name;
  String description;
  String type;
  BestPhotoUser user;
  bool editable;
  bool public;
  bool collaborative;
  String url;
  String canonicalUrl;
  int createdAt;
  int updatedAt;
  Photo photo;
  Tips followers;
  Inbox listItems;
  String prefix;
  String suffix;
  int width;
  int height;
  String visibility;
  String text;
  String lang;
  HereNow likes;
  bool logView;
  int agreeCount;
  int disagreeCount;
  Tips todo;
  String firstName;
  String lastName;
  String countryCode;

  factory GroupItem.fromJson(Map<String, dynamic> json) => GroupItem(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    description: json["description"] == null ? null : json["description"],
    type: json["type"] == null ? null : json["type"],
    user: json["user"] == null ? null : BestPhotoUser.fromJson(json["user"]),
    editable: json["editable"] == null ? null : json["editable"],
    public: json["public"] == null ? null : json["public"],
    collaborative: json["collaborative"] == null ? null : json["collaborative"],
    url: json["url"] == null ? null : json["url"],
    canonicalUrl: json["canonicalUrl"] == null ? null : json["canonicalUrl"],
    createdAt: json["createdAt"] == null ? null : json["createdAt"],
    updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
    photo: json["photo"] == null ? null : Photo.fromJson(json["photo"]),
    followers: json["followers"] == null ? null : Tips.fromJson(json["followers"]),
    listItems: json["listItems"] == null ? null : Inbox.fromJson(json["listItems"]),
    prefix: json["prefix"] == null ? null : json["prefix"],
    suffix: json["suffix"] == null ? null : json["suffix"],
    width: json["width"] == null ? null : json["width"],
    height: json["height"] == null ? null : json["height"],
    visibility: json["visibility"] == null ? null : json["visibility"],
    text: json["text"] == null ? null : json["text"],
    lang: json["lang"] == null ? null : json["lang"],
    likes: json["likes"] == null ? null : HereNow.fromJson(json["likes"]),
    logView: json["logView"] == null ? null : json["logView"],
    agreeCount: json["agreeCount"] == null ? null : json["agreeCount"],
    disagreeCount: json["disagreeCount"] == null ? null : json["disagreeCount"],
    todo: json["todo"] == null ? null : Tips.fromJson(json["todo"]),
    firstName: json["firstName"] == null ? null : json["firstName"],
    lastName: json["lastName"] == null ? null : json["lastName"],
    countryCode: json["countryCode"] == null ? null : json["countryCode"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "description": description == null ? null : description,
    "type": type == null ? null : type,
    "user": user == null ? null : user.toJson(),
    "editable": editable == null ? null : editable,
    "public": public == null ? null : public,
    "collaborative": collaborative == null ? null : collaborative,
    "url": url == null ? null : url,
    "canonicalUrl": canonicalUrl == null ? null : canonicalUrl,
    "createdAt": createdAt == null ? null : createdAt,
    "updatedAt": updatedAt == null ? null : updatedAt,
    "photo": photo == null ? null : photo.toJson(),
    "followers": followers == null ? null : followers.toJson(),
    "listItems": listItems == null ? null : listItems.toJson(),
    "prefix": prefix == null ? null : prefix,
    "suffix": suffix == null ? null : suffix,
    "width": width == null ? null : width,
    "height": height == null ? null : height,
    "visibility": visibility == null ? null : visibility,
    "text": text == null ? null : text,
    "lang": lang == null ? null : lang,
    "likes": likes == null ? null : likes.toJson(),
    "logView": logView == null ? null : logView,
    "agreeCount": agreeCount == null ? null : agreeCount,
    "disagreeCount": disagreeCount == null ? null : disagreeCount,
    "todo": todo == null ? null : todo.toJson(),
    "firstName": firstName == null ? null : firstName,
    "lastName": lastName == null ? null : lastName,
    "countryCode": countryCode == null ? null : countryCode,
  };
}

class Group {
  Group({
    this.type,
    this.count,
    this.items,
    this.name,
  });

  String type;
  int count;
  List<GroupItem> items;
  String name;

  factory Group.fromJson(Map<String, dynamic> json) => Group(
    type: json["type"],
    count: json["count"],
    items: List<GroupItem>.from(json["items"].map((x) => GroupItem.fromJson(x))),
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "count": count,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "name": name == null ? null : name,
  };
}

class Tips {
  Tips({
    this.count,
  });

  int count;

  factory Tips.fromJson(Map<String, dynamic> json) => Tips(
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
  };
}

class Inbox {
  Inbox({
    this.count,
    this.items,
  });

  int count;
  List<InboxItem> items;

  factory Inbox.fromJson(Map<String, dynamic> json) => Inbox(
    count: json["count"],
    items: List<InboxItem>.from(json["items"].map((x) => InboxItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class InboxItem {
  InboxItem({
    this.id,
    this.createdAt,
    this.url,
    this.summary,
    this.type,
    this.reasonName,
  });

  String id;
  int createdAt;
  String url;
  String summary;
  String type;
  String reasonName;

  factory InboxItem.fromJson(Map<String, dynamic> json) => InboxItem(
    id: json["id"] == null ? null : json["id"],
    createdAt: json["createdAt"] == null ? null : json["createdAt"],
    url: json["url"] == null ? null : json["url"],
    summary: json["summary"] == null ? null : json["summary"],
    type: json["type"] == null ? null : json["type"],
    reasonName: json["reasonName"] == null ? null : json["reasonName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "createdAt": createdAt == null ? null : createdAt,
    "url": url == null ? null : url,
    "summary": summary == null ? null : summary,
    "type": type == null ? null : type,
    "reasonName": reasonName == null ? null : reasonName,
  };
}

class Photo {
  Photo({
    this.id,
    this.createdAt,
    this.prefix,
    this.suffix,
    this.width,
    this.height,
    this.visibility,
    this.user,
  });

  String id;
  int createdAt;
  String prefix;
  String suffix;
  int width;
  int height;
  String visibility;
  BestPhotoUser user;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
    id: json["id"],
    createdAt: json["createdAt"],
    prefix: json["prefix"],
    suffix: json["suffix"],
    width: json["width"],
    height: json["height"],
    visibility: json["visibility"],
    user: json["user"] == null ? null : BestPhotoUser.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "createdAt": createdAt,
    "prefix": prefix,
    "suffix": suffix,
    "width": width,
    "height": height,
    "visibility": visibility,
    "user": user == null ? null : user.toJson(),
  };
}

class BestPhotoUser {
  BestPhotoUser({
    this.firstName,
    this.lastName,
    this.countryCode,
    this.type,
  });

  String firstName;
  String lastName;
  String countryCode;
  String type;

  factory BestPhotoUser.fromJson(Map<String, dynamic> json) => BestPhotoUser(
    firstName: json["firstName"],
    lastName: json["lastName"] == null ? null : json["lastName"],
    countryCode: json["countryCode"],
    type: json["type"] == null ? null : json["type"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName == null ? null : lastName,
    "countryCode": countryCode,
    "type": type == null ? null : type,
  };
}

class BeenHere {
  BeenHere({
    this.count,
    this.unconfirmedCount,
    this.marked,
    this.lastCheckinExpiredAt,
  });

  int count;
  int unconfirmedCount;
  bool marked;
  int lastCheckinExpiredAt;

  factory BeenHere.fromJson(Map<String, dynamic> json) => BeenHere(
    count: json["count"],
    unconfirmedCount: json["unconfirmedCount"],
    marked: json["marked"],
    lastCheckinExpiredAt: json["lastCheckinExpiredAt"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "unconfirmedCount": unconfirmedCount,
    "marked": marked,
    "lastCheckinExpiredAt": lastCheckinExpiredAt,
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
    primary: json["primary"] == null ? null : json["primary"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "pluralName": pluralName,
    "shortName": shortName,
    "icon": icon.toJson(),
    "primary": primary == null ? null : primary,
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

class Colors {
  Colors({
    this.highlightColor,
    this.highlightTextColor,
    this.algoVersion,
  });

  HighlightTColor highlightColor;
  HighlightTColor highlightTextColor;
  int algoVersion;

  factory Colors.fromJson(Map<String, dynamic> json) => Colors(
    highlightColor: HighlightTColor.fromJson(json["highlightColor"]),
    highlightTextColor: HighlightTColor.fromJson(json["highlightTextColor"]),
    algoVersion: json["algoVersion"],
  );

  Map<String, dynamic> toJson() => {
    "highlightColor": highlightColor.toJson(),
    "highlightTextColor": highlightTextColor.toJson(),
    "algoVersion": algoVersion,
  };
}

class HighlightTColor {
  HighlightTColor({
    this.photoId,
    this.value,
  });

  String photoId;
  int value;

  factory HighlightTColor.fromJson(Map<String, dynamic> json) => HighlightTColor(
    photoId: json["photoId"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "photoId": photoId,
    "value": value,
  };
}

class Contact {
  Contact({
    this.phone,
    this.formattedPhone,
    this.twitter,
    this.facebook,
    this.facebookUsername,
    this.facebookName,
  });

  String phone;
  String formattedPhone;
  String twitter;
  String facebook;
  String facebookUsername;
  String facebookName;

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
    phone: json["phone"],
    formattedPhone: json["formattedPhone"],
    twitter: json["twitter"],
    facebook: json["facebook"],
    facebookUsername: json["facebookUsername"],
    facebookName: json["facebookName"],
  );

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "formattedPhone": formattedPhone,
    "twitter": twitter,
    "facebook": facebook,
    "facebookUsername": facebookUsername,
    "facebookName": facebookName,
  };
}

class Hours {
  Hours({
    this.status,
    this.richStatus,
    this.isOpen,
    this.isLocalHoliday,
    this.dayData,
    this.timeframes,
  });

  String status;
  RichStatus richStatus;
  bool isOpen;
  bool isLocalHoliday;
  List<dynamic> dayData;
  List<Timeframe> timeframes;

  factory Hours.fromJson(Map<String, dynamic> json) => Hours(
    status: json["status"],
    richStatus: RichStatus.fromJson(json["richStatus"]),
    isOpen: json["isOpen"],
    isLocalHoliday: json["isLocalHoliday"],
    dayData: List<dynamic>.from(json["dayData"].map((x) => x)),
    timeframes: List<Timeframe>.from(json["timeframes"].map((x) => Timeframe.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "richStatus": richStatus.toJson(),
    "isOpen": isOpen,
    "isLocalHoliday": isLocalHoliday,
    "dayData": List<dynamic>.from(dayData.map((x) => x)),
    "timeframes": List<dynamic>.from(timeframes.map((x) => x.toJson())),
  };
}

class RichStatus {
  RichStatus({
    this.entities,
    this.text,
  });

  List<dynamic> entities;
  String text;

  factory RichStatus.fromJson(Map<String, dynamic> json) => RichStatus(
    entities: List<dynamic>.from(json["entities"].map((x) => x)),
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "entities": List<dynamic>.from(entities.map((x) => x)),
    "text": text,
  };
}

class Timeframe {
  Timeframe({
    this.days,
    this.includesToday,
    this.open,
    this.segments,
  });

  String days;
  bool includesToday;
  List<Open> open;
  List<dynamic> segments;

  factory Timeframe.fromJson(Map<String, dynamic> json) => Timeframe(
    days: json["days"],
    includesToday: json["includesToday"] == null ? null : json["includesToday"],
    open: List<Open>.from(json["open"].map((x) => Open.fromJson(x))),
    segments: List<dynamic>.from(json["segments"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "days": days,
    "includesToday": includesToday == null ? null : includesToday,
    "open": List<dynamic>.from(open.map((x) => x.toJson())),
    "segments": List<dynamic>.from(segments.map((x) => x)),
  };
}

class Open {
  Open({
    this.renderedTime,
  });

  String renderedTime;

  factory Open.fromJson(Map<String, dynamic> json) => Open(
    renderedTime: json["renderedTime"],
  );

  Map<String, dynamic> toJson() => {
    "renderedTime": renderedTime,
  };
}

class Listed {
  Listed({
    this.count,
    this.groups,
  });

  int count;
  List<Group> groups;

  factory Listed.fromJson(Map<String, dynamic> json) => Listed(
    count: json["count"],
    groups: List<Group>.from(json["groups"].map((x) => Group.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "groups": List<dynamic>.from(groups.map((x) => x.toJson())),
  };
}

class Location {
  Location({
    this.address,
    this.crossStreet,
    this.lat,
    this.lng,
    this.labeledLatLngs,
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
  String postalCode;
  String cc;
  String city;
  String state;
  String country;
  List<String> formattedAddress;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    address: json["address"],
    crossStreet: json["crossStreet"],
    lat: json["lat"].toDouble(),
    lng: json["lng"].toDouble(),
    labeledLatLngs: List<LabeledLatLng>.from(json["labeledLatLngs"].map((x) => LabeledLatLng.fromJson(x))),
    postalCode: json["postalCode"],
    cc: json["cc"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
    formattedAddress: List<String>.from(json["formattedAddress"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "crossStreet": crossStreet,
    "lat": lat,
    "lng": lng,
    "labeledLatLngs": List<dynamic>.from(labeledLatLngs.map((x) => x.toJson())),
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

class Page {
  Page({
    this.pageInfo,
    this.user,
  });

  PageInfo pageInfo;
  PageUser user;

  factory Page.fromJson(Map<String, dynamic> json) => Page(
    //pageInfo: PageInfo.fromJson(json["pageInfo"]),

   // user: PageUser.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "pageInfo": pageInfo.toJson(),
    "user": user.toJson(),
  };
}

class PageInfo {
  PageInfo({
    this.description,
    this.banner,
    this.links,
  });

  String description;
  String banner;
  Inbox links;

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
    description: json["description"],
    banner: json["banner"],
    links: Inbox.fromJson(json["links"]),
  );

  Map<String, dynamic> toJson() => {
    "description": description,
    "banner": banner,
    "links": links.toJson(),
  };
}

class PageUser {
  PageUser({
    this.firstName,
    this.countryCode,
    this.type,
    this.tips,
    this.lists,
    this.bio,
  });

  String firstName;
  String countryCode;
  String type;
  Tips tips;
  Attributes lists;
  String bio;

  factory PageUser.fromJson(Map<String, dynamic> json) => PageUser(
    firstName: json["firstName"],
    countryCode: json["countryCode"],
    type: json["type"],
    tips: Tips.fromJson(json["tips"]),
    lists: Attributes.fromJson(json["lists"]),
    bio: json["bio"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "countryCode": countryCode,
    "type": type,
    "tips": tips.toJson(),
    "lists": lists.toJson(),
    "bio": bio,
  };
}

class Popular {
  Popular({
    this.isOpen,
    this.isLocalHoliday,
    this.timeframes,
  });

  bool isOpen;
  bool isLocalHoliday;
  List<Timeframe> timeframes;

  factory Popular.fromJson(Map<String, dynamic> json) => Popular(
    isOpen: json["isOpen"],
    isLocalHoliday: json["isLocalHoliday"],
    timeframes: List<Timeframe>.from(json["timeframes"].map((x) => Timeframe.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "isOpen": isOpen,
    "isLocalHoliday": isLocalHoliday,
    "timeframes": List<dynamic>.from(timeframes.map((x) => x.toJson())),
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
