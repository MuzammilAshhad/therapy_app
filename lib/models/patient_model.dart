import 'dart:convert';

PatientModel patientModelFromJson(String str) =>
    PatientModel.fromJson(json.decode(str));

String patientModelToJson(PatientModel data) =>
    json.encode(data.toJson());

class PatientModel {
  bool success;
  int statusCode;
  String message;
  Data data;

  PatientModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory PatientModel.fromJson(Map<String, dynamic> json) =>
      PatientModel(
        success: json["success"],
        statusCode: json["statusCode"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
    "success": success,
    "statusCode": statusCode,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  PatientInfo patientInfo;
  List<dynamic> visits;
  List<dynamic> packages;
  List<dynamic> therapySessions;
  List<dynamic> invoices;
  Assessments assessments;

  Data({
    required this.patientInfo,
    required this.visits,
    required this.packages,
    required this.therapySessions,
    required this.invoices,
    required this.assessments,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    patientInfo: PatientInfo.fromJson(json["patient_info"]),
    visits: List<dynamic>.from(json["visits"].map((x) => x)),
    packages: List<dynamic>.from(json["packages"].map((x) => x)),
    therapySessions:
    List<dynamic>.from(json["therapy_sessions"].map((x) => x)),
    invoices: List<dynamic>.from(json["invoices"].map((x) => x)),
    assessments: Assessments.fromJson(json["assessments"]),
  );

  Map<String, dynamic> toJson() => {
    "patient_info": patientInfo.toJson(),
    "visits": List<dynamic>.from(visits),
    "packages": List<dynamic>.from(packages),
    "therapy_sessions": List<dynamic>.from(therapySessions),
    "invoices": List<dynamic>.from(invoices),
    "assessments": assessments.toJson(),
  };
}

class Assessments {
  List<dynamic> amAssessments;
  List<dynamic> consultantAssessments;

  Assessments({
    required this.amAssessments,
    required this.consultantAssessments,
  });

  factory Assessments.fromJson(Map<String, dynamic> json) => Assessments(
    amAssessments:
    List<dynamic>.from(json["am_assessments"].map((x) => x)),
    consultantAssessments:
    List<dynamic>.from(json["consultant_assessments"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "am_assessments": List<dynamic>.from(amAssessments),
    "consultant_assessments":
    List<dynamic>.from(consultantAssessments),
  };
}

class PatientInfo {
  BasicInfo basicInfo;
  Statistics statistics;

  PatientInfo({
    required this.basicInfo,
    required this.statistics,
  });

  factory PatientInfo.fromJson(Map<String, dynamic> json) => PatientInfo(
    basicInfo: BasicInfo.fromJson(json["basic_info"]),
    statistics: Statistics.fromJson(json["statistics"]),
  );

  Map<String, dynamic> toJson() => {
    "basic_info": basicInfo.toJson(),
    "statistics": statistics.toJson(),
  };
}

class BasicInfo {
  int id;
  String name;
  String email;
  dynamic address;
  String phone;
  String cnic;
  String gender;
  dynamic birthDate;
  int age;
  String bloodGroup;
  String referBy;
  String insurance;
  String image;
  String status;
  String cardUid;
  DateTime createdAt;
  DateTime updatedAt;
  int createdBy;
  int updatedBy;
  dynamic deletedAt;
  int userId;
  User user;

  BasicInfo({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    required this.cnic,
    required this.gender,
    required this.birthDate,
    required this.age,
    required this.bloodGroup,
    required this.referBy,
    required this.insurance,
    required this.image,
    required this.status,
    required this.cardUid,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.updatedBy,
    required this.deletedAt,
    required this.userId,
    required this.user,
  });

  factory BasicInfo.fromJson(Map<String, dynamic> json) => BasicInfo(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    address: json["address"],
    phone: json["phone"],
    cnic: json["cnic"],
    gender: json["gender"],
    birthDate: json["birth_date"],
    age: json["age"],
    bloodGroup: json["blood_group"],
    referBy: json["refer_by"],
    insurance: json["insurance"],
    image: json["image"],
    status: json["status"],
    cardUid: json["card_uid"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    deletedAt: json["deleted_at"],
    userId: json["user_id"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "address": address,
    "phone": phone,
    "cnic": cnic,
    "gender": gender,
    "birth_date": birthDate,
    "age": age,
    "blood_group": bloodGroup,
    "refer_by": referBy,
    "insurance": insurance,
    "image": image,
    "status": status,
    "card_uid": cardUid,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "created_by": createdBy,
    "updated_by": updatedBy,
    "deleted_at": deletedAt,
    "user_id": userId,
    "user": user.toJson(),
  };
}

class User {
  int id;
  String name;
  String username;
  String email;
  dynamic emailVerifiedAt;
  String profilePicture;
  int isLogin;
  int userType;
  int createdBy;
  int updatedBy;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic clinicId;
  dynamic roomId;
  dynamic departmentId;
  dynamic designationId;
  dynamic shiftId;
  String phone;
  String cnic;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.emailVerifiedAt,
    required this.profilePicture,
    required this.isLogin,
    required this.userType,
    required this.createdBy,
    required this.updatedBy,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.clinicId,
    required this.roomId,
    required this.departmentId,
    required this.designationId,
    required this.shiftId,
    required this.phone,
    required this.cnic,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    profilePicture: json["profile_picture"],
    isLogin: json["is_login"],
    userType: json["user_type"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    deletedAt: json["deleted_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    clinicId: json["clinic_id"],
    roomId: json["room_id"],
    departmentId: json["department_id"],
    designationId: json["designation_id"],
    shiftId: json["shift_id"],
    phone: json["phone"],
    cnic: json["cnic"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "username": username,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "profile_picture": profilePicture,
    "is_login": isLogin,
    "user_type": userType,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "deleted_at": deletedAt,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "clinic_id": clinicId,
    "room_id": roomId,
    "department_id": departmentId,
    "designation_id": designationId,
    "shift_id": shiftId,
    "phone": phone,
    "cnic": cnic,
  };
}

class Statistics {
  int totalVisits;
  int totalPackages;
  int activePackages;
  int totalSessions;
  int totalInvoices;
  int totalPaid;
  int totalPending;

  Statistics({
    required this.totalVisits,
    required this.totalPackages,
    required this.activePackages,
    required this.totalSessions,
    required this.totalInvoices,
    required this.totalPaid,
    required this.totalPending,
  });

  factory Statistics.fromJson(Map<String, dynamic> json) => Statistics(
    totalVisits: json["total_visits"],
    totalPackages: json["total_packages"],
    activePackages: json["active_packages"],
    totalSessions: json["total_sessions"],
    totalInvoices: json["total_invoices"],
    totalPaid: json["total_paid"],
    totalPending: json["total_pending"],
  );

  Map<String, dynamic> toJson() => {
    "total_visits": totalVisits,
    "total_packages": totalPackages,
    "active_packages": activePackages,
    "total_sessions": totalSessions,
    "total_invoices": totalInvoices,
    "total_paid": totalPaid,
    "total_pending": totalPending,
  };
}
