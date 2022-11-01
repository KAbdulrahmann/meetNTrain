// ignore_for_file: unnecessary_null_in_if_null_operators, prefer_null_aware_operators

import 'dart:convert';

List<EventsModel> eventsModelFromJson(String str) => List<EventsModel>.from(
    json.decode(str).map((x) => EventsModel.fromJson(x)));

String eventsModelToJson(List<EventsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EventsModel {
  EventsModel({
    this.id,
    this.title,
    this.description,
    this.spots,
    this.price,
    this.lat,
    this.lon,
    this.placeName,
    this.featuredImage,
    this.deeplink,
    this.date,
    this.tagId,
    this.createdBy,
    this.communityId,
    this.whatsappLink,
    this.images,
    this.finishDate,
    this.locationId,
    this.cancelledAt,
    this.isPrivate,
    this.lockedAt,
    this.minimumMembers,
    this.paymentMethod,
    this.receiveUpdates,
    this.state,
    this.isCheckedIn,
    this.isFeatured,
    this.viewersCount,
    this.community,
    this.users,
    this.tag,
    this.isWaiting,
    this.isJoined,
    this.joinedUsersCount,
    this.checkedInCount,
    this.paidAmount,
    this.ownerEarnings,
  });

  final int? id;
  final String? title;
  final String? description;
  final int? spots;
  final int? price;
  final double? lat;
  final double? lon;
  final String? placeName;
  final String? featuredImage;
  final String? deeplink;
  final DateTime? date;
  final int? tagId;
  final int? createdBy;
  final int? communityId;
  final dynamic whatsappLink;
  final List<Image>? images;
  final DateTime? finishDate;
  final int? locationId;
  final dynamic cancelledAt;
  final bool? isPrivate;
  final DateTime? lockedAt;
  final int? minimumMembers;
  final String? paymentMethod;
  final bool? receiveUpdates;
  final String? state;
  final bool? isCheckedIn;
  final bool? isFeatured;
  final int? viewersCount;
  final Community? community;
  final List<User>? users;
  final Tag? tag;
  final bool? isWaiting;
  final bool? isJoined;
  final int? joinedUsersCount;
  final int? checkedInCount;
  final int? paidAmount;
  final int? ownerEarnings;

  factory EventsModel.fromJson(Map<String, dynamic> json) => EventsModel(
        id: json["id"] ?? null,
        title: json["title"] ?? null,
        description: json["description"] ?? null,
        spots: json["spots"] ?? null,
        price: json["price"] ?? null,
        lat: json["lat"] == null ? null : json["lat"].toDouble(),
        lon: json["lon"] == null ? null : json["lon"].toDouble(),
        placeName: json["placeName"] ?? null,
        featuredImage: json["featuredImage"] ?? null,
        deeplink: json["deeplink"] ?? null,
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        tagId: json["tagId"] ?? null,
        createdBy: json["createdBy"] ?? null,
        communityId: json["communityId"] ?? null,
        whatsappLink: json["whatsapp_link"],
        images: json["images"] == null
            ? null
            : List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        finishDate: json["finish_date"] == null
            ? null
            : DateTime.parse(json["finish_date"]),
        locationId: json["location_id"] ?? null,
        cancelledAt: json["cancelled_at"],
        isPrivate: json["is_private"] ?? null,
        lockedAt:
            json["lockedAt"] == null ? null : DateTime.parse(json["lockedAt"]),
        minimumMembers: json["minimumMembers"] ?? null,
        paymentMethod: json["paymentMethod"] ?? null,
        receiveUpdates: json["receiveUpdates"] ?? null,
        state: json["state"] ?? null,
        isCheckedIn: json["isCheckedIn"] ?? null,
        isFeatured: json["isFeatured"] ?? null,
        viewersCount: json["viewersCount"] ?? null,
        community: json["community"] == null
            ? null
            : Community.fromJson(json["community"]),
        users: json["users"] == null
            ? null
            : List<User>.from(json["users"].map((x) => User.fromJson(x))),
        tag: json["tag"] == null ? null : Tag.fromJson(json["tag"]),
        isWaiting: json["isWaiting"] ?? null,
        isJoined: json["isJoined"] ?? null,
        joinedUsersCount: json["joinedUsersCount"] ?? null,
        checkedInCount: json["checkedInCount"] ?? null,
        paidAmount: json["paidAmount"] ?? null,
        ownerEarnings: json["ownerEarnings"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "title": title ?? null,
        "description": description ?? null,
        "spots": spots ?? null,
        "price": price ?? null,
        "lat": lat ?? null,
        "lon": lon ?? null,
        "placeName": placeName ?? null,
        "featuredImage": featuredImage ?? null,
        "deeplink": deeplink ?? null,
        "date": date == null ? null : date!.toIso8601String(),
        "tagId": tagId ?? null,
        "createdBy": createdBy ?? null,
        "communityId": communityId ?? null,
        "whatsapp_link": whatsappLink,
        "images": images == null
            ? null
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "finish_date":
            finishDate == null ? null : finishDate!.toIso8601String(),
        "location_id": locationId ?? null,
        "cancelled_at": cancelledAt,
        "is_private": isPrivate ?? null,
        "lockedAt": lockedAt == null ? null : lockedAt!.toIso8601String(),
        "minimumMembers": minimumMembers ?? null,
        "paymentMethod": paymentMethod ?? null,
        "receiveUpdates": receiveUpdates ?? null,
        "state": state ?? null,
        "isCheckedIn": isCheckedIn ?? null,
        "isFeatured": isFeatured ?? null,
        "viewersCount": viewersCount ?? null,
        "community": community == null ? null : community!.toJson(),
        "users": users == null
            ? null
            : List<dynamic>.from(users!.map((x) => x.toJson())),
        "tag": tag == null ? null : tag!.toJson(),
        "isWaiting": isWaiting ?? null,
        "isJoined": isJoined ?? null,
        "joinedUsersCount": joinedUsersCount ?? null,
        "checkedInCount": checkedInCount ?? null,
        "paidAmount": paidAmount ?? null,
        "ownerEarnings": ownerEarnings ?? null,
      };
}

class Community {
  Community({
    this.id,
    this.title,
    this.image,
    this.bio,
    this.points,
    this.ratingCount,
    this.connectionCount,
    this.eventCount,
    this.profilePicture,
    this.deeplink,
    this.linkExpiry,
    this.state,
  });

  final int? id;
  final String? title;
  final String? image;
  final String? bio;
  final int? points;
  final int? ratingCount;
  final int? connectionCount;
  final int? eventCount;
  final String? profilePicture;
  final String? deeplink;
  final DateTime? linkExpiry;
  final String? state;

  factory Community.fromJson(Map<String, dynamic> json) => Community(
        id: json["id"] ?? null,
        title: json["title"] ?? null,
        image: json["image"] ?? null,
        bio: json["bio"] ?? null,
        points: json["points"] ?? null,
        ratingCount: json["rating_count"] ?? null,
        connectionCount: json["connection_count"] ?? null,
        eventCount: json["event_count"] ?? null,
        profilePicture: json["profile_picture"] ?? null,
        deeplink: json["deeplink"] ?? null,
        linkExpiry: json["link_expiry"] == null
            ? null
            : DateTime.parse(json["link_expiry"]),
        state: json["state"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "title": title ?? null,
        "image": image ?? null,
        "bio": bio ?? null,
        "points": points ?? null,
        "rating_count": ratingCount ?? null,
        "connection_count": connectionCount ?? null,
        "event_count": eventCount ?? null,
        "profile_picture": profilePicture ?? null,
        "deeplink": deeplink ?? null,
        "link_expiry":
            linkExpiry == null ? null : linkExpiry!.toIso8601String(),
        "state": state ?? null,
      };
}

class Image {
  Image({
    this.url,
  });

  final String? url;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json["url"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "url": url ?? null,
      };
}

class Tag {
  Tag({
    this.id,
    this.title,
    this.icon,
  });

  final int? id;
  final String? title;
  final String? icon;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        id: json["id"] ?? null,
        title: json["title"] ?? null,
        icon: json["icon"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "title": title ?? null,
        "icon": icon ?? null,
      };
}

class User {
  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.bio,
    this.profilePicture,
    this.points,
    this.mobile,
    this.countryCode,
    this.isVerified,
    this.isTrusted,
  });

  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? bio;
  final String? profilePicture;
  final int? points;
  final String? mobile;
  final String? countryCode;
  final bool? isVerified;
  final bool? isTrusted;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] ?? null,
        firstName: json["first_name"] ?? null,
        lastName: json["last_name"] ?? null,
        email: json["email"] ?? null,
        bio: json["bio"] ?? null,
        profilePicture: json["profile_picture"] ?? null,
        points: json["points"] ?? null,
        mobile: json["mobile"] ?? null,
        countryCode: json["country_code"] ?? null,
        isVerified: json["is_verified"] ?? null,
        isTrusted: json["isTrusted"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "first_name": firstName ?? null,
        "last_name": lastName ?? null,
        "email": email ?? null,
        "bio": bio ?? null,
        "profile_picture": profilePicture ?? null,
        "points": points ?? null,
        "mobile": mobile ?? null,
        "country_code": countryCode ?? null,
        "is_verified": isVerified ?? null,
        "isTrusted": isTrusted ?? null,
      };
}
