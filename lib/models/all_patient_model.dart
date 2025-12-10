import 'dart:convert';

AllPatientModel allPatientModelFromJson(String str) =>
    AllPatientModel.fromJson(json.decode(str));

String allPatientModelToJson(AllPatientModel data) =>
    json.encode(data.toJson());

class AllPatientModel {
  bool success;
  int statusCode;
  String message;
  Data data;

  AllPatientModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory AllPatientModel.fromJson(Map<String, dynamic> json) =>
      AllPatientModel(
        success: json["success"],
        statusCode: json["status_code"],
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
  int currentPage;
  List<Datum> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  List<Link> links;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  Data({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    currentPage: json["current_page"],
    data: List<Datum>.from(
        json["data"].map((x) => Datum.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    links:
    List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "links": List<dynamic>.from(links.map((x) => x.toJson())),
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class Datum {
  int id;
  String name;
  String email;
  String phone;
  String cnic;
  String? image;
  dynamic address;
  String status;
  DateTime createdAt;
  int visitsCount;
  int packagesCount;
  int invoicesCount;
  dynamic user;

  Datum({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.cnic,
    required this.image,
    required this.address,
    required this.status,
    required this.createdAt,
    required this.visitsCount,
    required this.packagesCount,
    required this.invoicesCount,
    required this.user,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    cnic: json["cnic"],
    image: json["image"],
    address: json["address"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    visitsCount: json["visits_count"],
    packagesCount: json["packages_count"],
    invoicesCount: json["invoices_count"],
    user: json["user"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "cnic": cnic,
    "image": image,
    "address": address,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "visits_count": visitsCount,
    "packages_count": packagesCount,
    "invoices_count": invoicesCount,
    "user": user,
  };
}

class Link {
  String? url;
  String label;
  int? page;
  bool active;

  Link({
    required this.url,
    required this.label,
    required this.page,
    required this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    url: json["url"],
    label: json["label"],
    page: json["page"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "label": label,
    "page": page,
    "active": active,
  };
}
