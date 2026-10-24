

import 'dart:convert';

PersonData personDataFromJson(String str) => PersonData.fromJson(json.decode(str));

String personDataToJson(PersonData data) => json.encode(data.toJson());

class PersonData {
    final bool success;
    final String message;
    final Data data;

    PersonData({
        required this.success,
        required this.message,
        required this.data,
    });

    factory PersonData.fromJson(Map<String, dynamic> json) => PersonData(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    final List<Complaint> complaints;
    final Pagination pagination;

    Data({
        required this.complaints,
        required this.pagination,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        complaints: List<Complaint>.from(json["complaints"].map((x) => Complaint.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
    );

    Map<String, dynamic> toJson() => {
        "complaints": List<dynamic>.from(complaints.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
    };
}

class Complaint {
    final String id;
    final String complaintNumber;
    final String userId;
    final String title;
    final String category;
    final String description;
    final String location;
    final double latitude;
    final double longitude;
    final String photoUrl;
    final String status;
    final Priority priority;
    final String? assignedTo;
    final String? resolutionNote;
    final DateTime submittedAt;
    final DateTime createdAt;
    final DateTime updatedAt;
    final dynamic deletedAt;
    final Citizen citizen;
    final Citizen? assignedOfficer;

    Complaint({
        required this.id,
        required this.complaintNumber,
        required this.userId,
        required this.title,
        required this.category,
        required this.description,
        required this.location,
        required this.latitude,
        required this.longitude,
        required this.photoUrl,
        required this.status,
        required this.priority,
        required this.assignedTo,
        required this.resolutionNote,
        required this.submittedAt,
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt,
        required this.citizen,
        required this.assignedOfficer,
    });

    factory Complaint.fromJson(Map<String, dynamic> json) => Complaint(
        id: json["id"],
        complaintNumber: json["complaintNumber"],
        userId: json["userId"],
        title: json["title"],
        category: json["category"],
        description: json["description"],
        location: json["location"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        photoUrl: json["photoUrl"],
        status: json["status"],
        priority: priorityValues.map[json["priority"]]!,
        assignedTo: json["assignedTo"],
        resolutionNote: json["resolutionNote"],
        submittedAt: DateTime.parse(json["submittedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        citizen: Citizen.fromJson(json["citizen"]),
        assignedOfficer: json["assignedOfficer"] == null ? null : Citizen.fromJson(json["assignedOfficer"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "complaintNumber": complaintNumber,
        "userId": userId,
        "title": title,
        "category": category,
        "description": description,
        "location": location,
        "latitude": latitude,
        "longitude": longitude,
        "photoUrl": photoUrl,
        "status": status,
        "priority": priorityValues.reverse[priority],
        "assignedTo": assignedTo,
        "resolutionNote": resolutionNote,
        "submittedAt": submittedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
        "citizen": citizen.toJson(),
        "assignedOfficer": assignedOfficer?.toJson(),
    };
}

class Citizen {
    final String id;
    final String fullName;
    final String mobileNumber;
    final String email;
    final Role role;

    Citizen({
        required this.id,
        required this.fullName,
        required this.mobileNumber,
        required this.email,
        required this.role,
    });

    factory Citizen.fromJson(Map<String, dynamic> json) => Citizen(
        id: json["id"],
        fullName: json["fullName"],
        mobileNumber: json["mobileNumber"],
        email: json["email"],
        role: roleValues.map[json["role"]]!,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "mobileNumber": mobileNumber,
        "email": email,
        "role": roleValues.reverse[role],
    };
}

enum Role {
    ADMIN,
    CITIZEN,
    GRAM_SEVAK
}

final roleValues = EnumValues({
    "ADMIN": Role.ADMIN,
    "CITIZEN": Role.CITIZEN,
    "GRAM_SEVAK": Role.GRAM_SEVAK
});

enum Priority {
    HIGH,
    LOW,
    MEDIUM
}

final priorityValues = EnumValues({
    "HIGH": Priority.HIGH,
    "LOW": Priority.LOW,
    "MEDIUM": Priority.MEDIUM
});

class Pagination {
    final int total;
    final int page;
    final int limit;
    final int totalPages;

    Pagination({
        required this.total,
        required this.page,
        required this.limit,
        required this.totalPages,
    });

    factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        total: json["total"],
        page: json["page"],
        limit: json["limit"],
        totalPages: json["totalPages"],
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "page": page,
        "limit": limit,
        "totalPages": totalPages,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
