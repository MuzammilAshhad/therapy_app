class LoginModel {
  bool success;
  int statusCode;
  String message;
  Data data;

  LoginModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    success: json['success'] ?? false,
    statusCode: json['status_code'] ?? 0,
    message: json['message'] ?? '',
    data: Data.fromJson(json['data'] ?? <String, dynamic>{}),
  );

  Map<String, dynamic> toJson() => {
    'success': success,
    'status_code': statusCode,
    'message': message,
    'data': data.toJson(),
  };
}

class Data {
  String accessToken;
  User user;
  List<String> permissions;
  Roles roles;
  List<AllUser> allUsers;
  List<Employee> allEmployees;
  Summary summary;

  Data({
    required this.accessToken,
    required this.user,
    required this.permissions,
    required this.roles,
    required this.allUsers,
    required this.allEmployees,
    required this.summary,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    accessToken: json['access_token'] ?? '',
    user: User.fromJson(json['user'] ?? <String, dynamic>{}),
    permissions: (json['permissions'] as List<dynamic>?)
        ?.map((e) => e?.toString() ?? '')
        .toList() ??
        [],
    roles: Roles.fromJson(json['roles'] ?? <String, dynamic>{}),
    allUsers: (json['all_users'] as List<dynamic>?)
        ?.map((e) => AllUser.fromJson(e ?? <String, dynamic>{}))
        .toList() ??
        [],
    allEmployees: (json['all_employees'] as List<dynamic>?)
        ?.map((e) => Employee.fromJson(e ?? <String, dynamic>{}))
        .toList() ??
        [],
    summary: Summary.fromJson(json['summary'] ?? <String, dynamic>{}),
  );

  Map<String, dynamic> toJson() => {
    'access_token': accessToken,
    'user': user.toJson(),
    'permissions': permissions,
    'roles': roles.toJson(),
    'all_users': allUsers.map((e) => e.toJson()).toList(),
    'all_employees': allEmployees.map((e) => e.toJson()).toList(),
    'summary': summary.toJson(),
  };
}

class Employee {
  int id;
  int userId;
  String? empId;
  int? departmentId;
  int designationId;
  String phone;
  String? emergencyContact;
  String? emergencyContactName;
  String? emergencyContactRelationship;
  String? cnic;
  Religon? religon;
  String? gender;
  String? bloodGroup;
  DateTime? dob;
  DateTime? joiningDate;
  dynamic terminationReason;
  dynamic terminationDate;
  int? dutyHours;
  int? shiftId;
  String? salary;
  String? presentAddress;
  String? permanentAddress;
  String? experience;
  BanckName? banckName;
  BanckBranch? banckBranch;
  dynamic banckBranchCode;
  String? banckAccountHolder;
  String? banckAccountNumber;
  dynamic banckIbanNumber;
  String? biography;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  int? clinicId;
  int? roomId;
  SalaryType salaryType;
  List<Education>? educations;
  List<Experience>? experiences;
  List<Document>? documents;
  User? user;

  Employee({
    required this.id,
    required this.userId,
    required this.empId,
    required this.departmentId,
    required this.designationId,
    required this.phone,
    required this.emergencyContact,
    required this.emergencyContactName,
    required this.emergencyContactRelationship,
    required this.cnic,
    required this.religon,
    required this.gender,
    required this.bloodGroup,
    required this.dob,
    required this.joiningDate,
    required this.terminationReason,
    required this.terminationDate,
    required this.dutyHours,
    required this.shiftId,
    required this.salary,
    required this.presentAddress,
    required this.permanentAddress,
    required this.experience,
    required this.banckName,
    required this.banckBranch,
    required this.banckBranchCode,
    required this.banckAccountHolder,
    required this.banckAccountNumber,
    required this.banckIbanNumber,
    required this.biography,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.clinicId,
    required this.roomId,
    required this.salaryType,
    this.educations,
    this.experiences,
    this.documents,
    this.user,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
    id: json['id'] ?? 0,
    userId: json['user_id'] ?? 0,
    empId: json['emp_id']?.toString(),
    departmentId:
    json['department_id'] is int ? json['department_id'] : _tryParseInt(json['department_id']),
    designationId: json['designation_id'] ?? 0,
    phone: json['phone']?.toString() ?? '',
    emergencyContact: json['emergency_contact']?.toString(),
    emergencyContactName: json['emergency_contact_name']?.toString(),
    emergencyContactRelationship:
    json['emergency_contact_relationship']?.toString(),
    cnic: json['cnic']?.toString(),
    religon: _religonFromString(json['religon']),
    gender: json['gender']?.toString(),
    bloodGroup: json['blood_group']?.toString(),
    dob: _parseDateTime(json['dob']),
    joiningDate: _parseDateTime(json['joining_date']),
    terminationReason: json['Termination_reason'],
    terminationDate: json['termination_date'],
    dutyHours:
    json['duty_hours'] is int ? json['duty_hours'] : _tryParseInt(json['duty_hours']),
    shiftId: json['shift_id'] is int ? json['shift_id'] : _tryParseInt(json['shift_id']),
    salary: json['salary']?.toString(),
    presentAddress: json['present_address']?.toString(),
    permanentAddress: json['permanent_address']?.toString(),
    experience: json['experience']?.toString(),
    banckName: _banckNameFromString(json['banck_name']),
    banckBranch: _banckBranchFromString(json['banck_branch']),
    banckBranchCode: json['banck_branch_code'],
    banckAccountHolder: json['banck_account_holder']?.toString(),
    banckAccountNumber: json['banck_account_number']?.toString(),
    banckIbanNumber: json['banck_iban_number'],
    biography: json['biography']?.toString(),
    createdAt: _parseDateTime(json['created_at']) ?? DateTime.now(),
    updatedAt: _parseDateTime(json['updated_at']) ?? DateTime.now(),
    deletedAt: json['deleted_at'],
    clinicId:
    json['clinic_id'] is int ? json['clinic_id'] : _tryParseInt(json['clinic_id']),
    roomId: json['room_id'] is int ? json['room_id'] : _tryParseInt(json['room_id']),
    salaryType: _salaryTypeFromString(json['salary_type']) ?? SalaryType.FIXED,
    educations: (json['educations'] as List<dynamic>?)
        ?.map((e) => Education.fromJson(e ?? <String, dynamic>{}))
        .toList(),
    experiences: (json['experiences'] as List<dynamic>?)
        ?.map((e) => Experience.fromJson(e ?? <String, dynamic>{}))
        .toList(),
    documents: (json['documents'] as List<dynamic>?)
        ?.map((e) => Document.fromJson(e ?? <String, dynamic>{}))
        .toList(),
    user: json['user'] != null ? User.fromJson(json['user']) : null,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'emp_id': empId,
    'department_id': departmentId,
    'designation_id': designationId,
    'phone': phone,
    'emergency_contact': emergencyContact,
    'emergency_contact_name': emergencyContactName,
    'emergency_contact_relationship': emergencyContactRelationship,
    'cnic': cnic,
    'religon': religon?.toJson(),
    'gender': gender,
    'blood_group': bloodGroup,
    'dob': dob?.toIso8601String(),
    'joining_date': joiningDate?.toIso8601String(),
    'Termination_reason': terminationReason,
    'termination_date': terminationDate,
    'duty_hours': dutyHours,
    'shift_id': shiftId,
    'salary': salary,
    'present_address': presentAddress,
    'permanent_address': permanentAddress,
    'experience': experience,
    'banck_name': banckName?.toJson(),
    'banck_branch': banckBranch?.toJson(),
    'banck_branch_code': banckBranchCode,
    'banck_account_holder': banckAccountHolder,
    'banck_account_number': banckAccountNumber,
    'banck_iban_number': banckIbanNumber,
    'biography': biography,
    'created_at': createdAt.toIso8601String(),
    'updated_at': updatedAt.toIso8601String(),
    'deleted_at': deletedAt,
    'clinic_id': clinicId,
    'room_id': roomId,
    'salary_type': salaryType.toJson(),
    'educations': educations?.map((e) => e.toJson()).toList(),
    'experiences': experiences?.map((e) => e.toJson()).toList(),
    'documents': documents?.map((e) => e.toJson()).toList(),
    'user': user?.toJson(),
  };
}

enum BanckBranch { BAGH_AZAD_KASHMMIR, F_8, G_15, MINGORA_BR_SWAT }

extension BanckBranchX on BanckBranch {
  String toJson() => _enumToString(this);
}

BanckBranch? _banckBranchFromString(dynamic v) {
  if (v == null) return null;
  return _enumFromString<BanckBranch>(BanckBranch.values, v);
}

enum BanckName { MEEZAN_BANK }

extension BanckNameX on BanckName {
  String toJson() => _enumToString(this);
}

BanckName? _banckNameFromString(dynamic v) {
  if (v == null) return null;
  return _enumFromString<BanckName>(BanckName.values, v);
}

class Document {
  int id;
  int employeeId;
  String? docTitle;
  dynamic docDescription;
  String? docFile;
  String? docExpiry;
  int createdBy;
  int? updatedBy;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;

  Document({
    required this.id,
    required this.employeeId,
    required this.docTitle,
    required this.docDescription,
    required this.docFile,
    required this.docExpiry,
    required this.createdBy,
    required this.updatedBy,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Document.fromJson(Map<String, dynamic> json) => Document(
    id: json['id'] ?? 0,
    employeeId: json['employee_id'] ?? 0,
    docTitle: json['doc_title']?.toString(),
    docDescription: json['doc_description'],
    docFile: json['doc_file']?.toString(),
    docExpiry: json['doc_expiry']?.toString(),
    createdBy: json['created_by'] ?? 0,
    updatedBy: json['updated_by'] is int ? json['updated_by'] : _tryParseInt(json['updated_by']),
    deletedAt: json['deleted_at'],
    createdAt: _parseDateTime(json['created_at']) ?? DateTime.now(),
    updatedAt: _parseDateTime(json['updated_at']) ?? DateTime.now(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'employee_id': employeeId,
    'doc_title': docTitle,
    'doc_description': docDescription,
    'doc_file': docFile,
    'doc_expiry': docExpiry,
    'created_by': createdBy,
    'updated_by': updatedBy,
    'deleted_at': deletedAt,
    'created_at': createdAt.toIso8601String(),
    'updated_at': updatedAt.toIso8601String(),
  };
}

class Education {
  int id;
  dynamic candidateId;
  Degree degree;
  String university;
  String cgpa;
  String? comments;
  int createdBy;
  int updatedBy;
  DateTime? deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  int employeeId;

  Education({
    required this.id,
    required this.candidateId,
    required this.degree,
    required this.university,
    required this.cgpa,
    required this.comments,
    required this.createdBy,
    required this.updatedBy,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.employeeId,
  });

  factory Education.fromJson(Map<String, dynamic> json) => Education(
    id: json['id'] ?? 0,
    candidateId: json['candidate_id'],
    degree: _degreeFromString(json['degree']) ?? Degree.TEST,
    university: json['university']?.toString() ?? '',
    cgpa: json['cgpa']?.toString() ?? '',
    comments: json['comments']?.toString(),
    createdBy: json['created_by'] ?? 0,
    updatedBy: json['updated_by'] ?? 0,
    deletedAt: _parseDateTime(json['deleted_at']),
    createdAt: _parseDateTime(json['created_at']) ?? DateTime.now(),
    updatedAt: _parseDateTime(json['updated_at']) ?? DateTime.now(),
    employeeId: json['employee_id'] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'candidate_id': candidateId,
    'degree': degree.toJson(),
    'university': university,
    'cgpa': cgpa,
    'comments': comments,
    'created_by': createdBy,
    'updated_by': updatedBy,
    'deleted_at': deletedAt?.toIso8601String(),
    'created_at': createdAt.toIso8601String(),
    'updated_at': updatedAt.toIso8601String(),
    'employee_id': employeeId,
  };
}

enum Degree {
  BA_SOCIAL_SCIENCE,
  DOCTOR_OF_PHYSICAL_THERAPY,
  FSC,
  MARTRIC,
  TEST
}

extension DegreeX on Degree {
  String toJson() => _enumToString(this);
}

Degree? _degreeFromString(dynamic v) {
  if (v == null) return null;
  return _enumFromString<Degree>(Degree.values, v);
}

class Experience {
  int id;
  dynamic candidateId;
  String? companyName;
  String? workingPeriod;
  String? duties;
  Degree? supervisor;
  int createdBy;
  int updatedBy;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  int employeeId;

  Experience({
    required this.id,
    required this.candidateId,
    required this.companyName,
    required this.workingPeriod,
    required this.duties,
    required this.supervisor,
    required this.createdBy,
    required this.updatedBy,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.employeeId,
  });

  factory Experience.fromJson(Map<String, dynamic> json) => Experience(
    id: json['id'] ?? 0,
    candidateId: json['candidate_id'],
    companyName: json['company_name']?.toString(),
    workingPeriod: json['working_period']?.toString(),
    duties: json['duties']?.toString(),
    supervisor: _degreeFromString(json['supervisor']),
    createdBy: json['created_by'] ?? 0,
    updatedBy: json['updated_by'] ?? 0,
    deletedAt: json['deleted_at'],
    createdAt: _parseDateTime(json['created_at']) ?? DateTime.now(),
    updatedAt: _parseDateTime(json['updated_at']) ?? DateTime.now(),
    employeeId: json['employee_id'] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'candidate_id': candidateId,
    'company_name': companyName,
    'working_period': workingPeriod,
    'duties': duties,
    'supervisor': supervisor?.toJson(),
    'created_by': createdBy,
    'updated_by': updatedBy,
    'deleted_at': deletedAt,
    'created_at': createdAt.toIso8601String(),
    'updated_at': updatedAt.toIso8601String(),
    'employee_id': employeeId,
  };
}

enum Religon { ISLAM, PURPLE_ISLAM, RELIGON_ISLAM }

Religon? _religonFromString(dynamic v) {
  if (v == null) return null;
  return _enumFromString<Religon>(Religon.values, v);
}

extension ReligonX on Religon {
  String toJson() => _enumToString(this);
}

enum SalaryType { COMMISSION, FIXED }

SalaryType? _salaryTypeFromString(dynamic v) {
  if (v == null) return null;
  return _enumFromString<SalaryType>(SalaryType.values, v);
}

extension SalaryTypeX on SalaryType {
  String toJson() => _enumToString(this);
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
  int? createdBy;
  int updatedBy;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  int? clinicId;
  int? roomId;
  int? departmentId;
  int? designationId;
  int? shiftId;
  String? phone;
  String? cnic;
  Clinic? clinic;
  Clinic? room;
  Department? department;
  Department? designation;
  Department? shift;
  List<Role>? roles;
  dynamic employee;

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
    required this.clinic,
    required this.room,
    required this.department,
    required this.designation,
    required this.shift,
    this.roles,
    this.employee,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'] ?? 0,
    name: json['name']?.toString() ?? '',
    username: json['username']?.toString() ?? '',
    email: json['email']?.toString() ?? '',
    emailVerifiedAt: json['email_verified_at'],
    profilePicture: json['profile_picture']?.toString() ?? '',
    isLogin: json['is_login'] ?? 0,
    userType: json['user_type'] ?? 0,
    createdBy: json['created_by'] is int ? json['created_by'] : _tryParseInt(json['created_by']),
    updatedBy: json['updated_by'] ?? 0,
    deletedAt: json['deleted_at'],
    createdAt: _parseDateTime(json['created_at']) ?? DateTime.now(),
    updatedAt: _parseDateTime(json['updated_at']) ?? DateTime.now(),
    clinicId: json['clinic_id'] is int ? json['clinic_id'] : _tryParseInt(json['clinic_id']),
    roomId: json['room_id'] is int ? json['room_id'] : _tryParseInt(json['room_id']),
    departmentId: json['department_id'] is int ? json['department_id'] : _tryParseInt(json['department_id']),
    designationId: json['designation_id'] is int ? json['designation_id'] : _tryParseInt(json['designation_id']),
    shiftId: json['shift_id'] is int ? json['shift_id'] : _tryParseInt(json['shift_id']),
    phone: json['phone']?.toString(),
    cnic: json['cnic']?.toString(),
    clinic: json['clinic'] != null ? Clinic.fromJson(json['clinic']) : null,
    room: json['room'] != null ? Clinic.fromJson(json['room']) : null,
    department:
    json['department'] != null ? Department.fromJson(json['department']) : null,
    designation:
    json['designation'] != null ? Department.fromJson(json['designation']) : null,
    shift: json['shift'] != null ? Department.fromJson(json['shift']) : null,
    roles: (json['roles'] as List<dynamic>?)
        ?.map((e) => Role.fromJson(e ?? <String, dynamic>{}))
        .toList(),
    employee: json['employee'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'username': username,
    'email': email,
    'email_verified_at': emailVerifiedAt,
    'profile_picture': profilePicture,
    'is_login': isLogin,
    'user_type': userType,
    'created_by': createdBy,
    'updated_by': updatedBy,
    'deleted_at': deletedAt,
    'created_at': createdAt.toIso8601String(),
    'updated_at': updatedAt.toIso8601String(),
    'clinic_id': clinicId,
    'room_id': roomId,
    'department_id': departmentId,
    'designation_id': designationId,
    'shift_id': shiftId,
    'phone': phone,
    'cnic': cnic,
    'clinic': clinic?.toJson(),
    'room': room?.toJson(),
    'department': department?.toJson(),
    'designation': designation?.toJson(),
    'shift': shift?.toJson(),
    'roles': roles?.map((e) => e.toJson()).toList(),
    'employee': employee,
  };
}

class Clinic {
  int id;
  Name name;
  Location? location;
  dynamic description;
  ColourCode? colourCode;
  int? createdBy;
  int updatedBy;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  int? clinicId;
  String? roomNumber;

  Clinic({
    required this.id,
    required this.name,
    this.location,
    required this.description,
    this.colourCode,
    required this.createdBy,
    required this.updatedBy,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    this.clinicId,
    this.roomNumber,
  });

  factory Clinic.fromJson(Map<String, dynamic> json) => Clinic(
    id: json['id'] ?? 0,
    name: _nameFromString(json['name']) ?? Name.CLINIC_1_FEMALE,
    location: _locationFromString(json['location']),
    description: json['description'],
    colourCode: _colourCodeFromString(json['colour_code']),
    createdBy: json['created_by'] is int ? json['created_by'] : _tryParseInt(json['created_by']),
    updatedBy: json['updated_by'] ?? 0,
    deletedAt: json['deleted_at'],
    createdAt: _parseDateTime(json['created_at']) ?? DateTime.now(),
    updatedAt: _parseDateTime(json['updated_at']) ?? DateTime.now(),
    clinicId: json['clinic_id'] is int ? json['clinic_id'] : _tryParseInt(json['clinic_id']),
    roomNumber: json['room_number']?.toString(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name.toJson(),
    'location': location?.toJson(),
    'description': description,
    'colour_code': colourCode?.toJson(),
    'created_by': createdBy,
    'updated_by': updatedBy,
    'deleted_at': deletedAt,
    'created_at': createdAt.toIso8601String(),
    'updated_at': updatedAt.toIso8601String(),
    'clinic_id': clinicId,
    'room_number': roomNumber,
  };
}

enum ColourCode { FFFFFF, THE_0000_FF, THE_00_BFFF, THE_9_C1_EE9 }

ColourCode? _colourCodeFromString(dynamic v) {
  if (v == null) return null;
  return _enumFromString<ColourCode>(ColourCode.values, v);
}

extension ColourCodeX on ColourCode {
  String toJson() => _enumToString(this);
}

enum Location { KIRAN_PLAZA_BESIDE_IDC_F_8_ISB, PMC_PLAZA_F_8_ISB }

Location? _locationFromString(dynamic v) {
  if (v == null) return null;
  return _enumFromString<Location>(Location.values, v);
}

extension LocationX on Location {
  String toJson() => _enumToString(this);
}

enum Name {
  CLINIC_1_FEMALE,
  CLINIC_1_MALE,
  CLINIC_2_A,
  CLINIC_3_B,
  ROOM_1,
  ROOM_2,
  ROOM_3,
  ROOM_4
}

Name? _nameFromString(dynamic v) {
  if (v == null) return null;
  return _enumFromString<Name>(Name.values, v);
}

extension NameX on Name {
  String toJson() => _enumToString(this);
}

class Department {
  int id;
  String name;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  String? startTime;
  String? endTime;

  Department({
    required this.id,
    required this.name,
    required this.createdBy,
    required this.updatedBy,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    this.startTime,
    this.endTime,
  });

  factory Department.fromJson(Map<String, dynamic> json) => Department(
    id: json['id'] ?? 0,
    name: json['name']?.toString() ?? '',
    createdBy: json['created_by'],
    updatedBy: json['updated_by'],
    deletedAt: json['deleted_at'],
    createdAt: _parseDateTime(json['created_at']) ?? DateTime.now(),
    updatedAt: _parseDateTime(json['updated_at']) ?? DateTime.now(),
    startTime: json['start_time']?.toString(),
    endTime: json['end_time']?.toString(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'created_by': createdBy,
    'updated_by': updatedBy,
    'deleted_at': deletedAt,
    'created_at': createdAt.toIso8601String(),
    'updated_at': updatedAt.toIso8601String(),
    'start_time': startTime,
    'end_time': endTime,
  };
}

class Role {
  int id;
  The1 name;
  GuardName guardName;
  DateTime createdAt;
  DateTime updatedAt;
  Pivot pivot;

  Role({
    required this.id,
    required this.name,
    required this.guardName,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    id: json['id'] ?? 0,
    name: _the1FromString(json['name']) ?? The1.EMPLOYEE,
    guardName: _guardNameFromString(json['guard_name']) ?? GuardName.WEB,
    createdAt: _parseDateTime(json['created_at']) ?? DateTime.now(),
    updatedAt: _parseDateTime(json['updated_at']) ?? DateTime.now(),
    pivot: Pivot.fromJson(json['pivot'] ?? <String, dynamic>{}),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name.toJson(),
    'guard_name': guardName.toJson(),
    'created_at': createdAt.toIso8601String(),
    'updated_at': updatedAt.toIso8601String(),
    'pivot': pivot.toJson(),
  };
}

enum GuardName { WEB }

GuardName? _guardNameFromString(dynamic v) {
  if (v == null) return null;
  return _enumFromString<GuardName>(GuardName.values, v);
}

extension GuardNameX on GuardName {
  String toJson() => _enumToString(this);
}

enum The1 {
  ASSISTANT_MANAGER,
  CONSULTANT,
  EMPLOYEE,
  RECEPTIONIST,
  SUPER_ADMIN,
  THERAPIST
}

The1? _the1FromString(dynamic v) {
  if (v == null) return null;
  return _enumFromString<The1>(The1.values, v);
}

extension The1X on The1 {
  String toJson() => _enumToString(this);
}

class Pivot {
  ModelType modelType;
  int modelId;
  int roleId;

  Pivot({
    required this.modelType,
    required this.modelId,
    required this.roleId,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    modelType: _modelTypeFromString(json['model_type']) ?? ModelType.APP_MODELS_USER,
    modelId: json['model_id'] ?? 0,
    roleId: json['role_id'] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    'model_type': modelType.toJson(),
    'model_id': modelId,
    'role_id': roleId,
  };
}

enum ModelType { APP_MODELS_USER }

ModelType? _modelTypeFromString(dynamic v) {
  if (v == null) return null;
  return _enumFromString<ModelType>(ModelType.values, v);
}

extension ModelTypeX on ModelType {
  String toJson() => _enumToString(this);
}

class AllUser {
  int id;
  String name;
  String username;
  String email;
  String? phone;
  String? cnic;
  String profilePicture;
  int isLogin;
  int userType;
  Clinic? clinic;
  Clinic? room;
  Department? department;
  Department? designation;
  Department? shift;
  Employee? employee;
  List<The1> roles;
  DateTime createdAt;

  AllUser({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.cnic,
    required this.profilePicture,
    required this.isLogin,
    required this.userType,
    required this.clinic,
    required this.room,
    required this.department,
    required this.designation,
    required this.shift,
    required this.employee,
    required this.roles,
    required this.createdAt,
  });

  factory AllUser.fromJson(Map<String, dynamic> json) => AllUser(
    id: json['id'] ?? 0,
    name: json['name']?.toString() ?? '',
    username: json['username']?.toString() ?? '',
    email: json['email']?.toString() ?? '',
    phone: json['phone']?.toString(),
    cnic: json['cnic']?.toString(),
    profilePicture: json['profile_picture']?.toString() ?? '',
    isLogin: json['is_login'] ?? 0,
    userType: json['user_type'] ?? 0,
    clinic: json['clinic'] != null ? Clinic.fromJson(json['clinic']) : null,
    room: json['room'] != null ? Clinic.fromJson(json['room']) : null,
    department:
    json['department'] != null ? Department.fromJson(json['department']) : null,
    designation:
    json['designation'] != null ? Department.fromJson(json['designation']) : null,
    shift: json['shift'] != null ? Department.fromJson(json['shift']) : null,
    employee: json['employee'] != null ? Employee.fromJson(json['employee']) : null,
    roles: (json['roles'] as List<dynamic>?)
        ?.map((e) => _the1FromString(e) ?? The1.EMPLOYEE)
        .toList() ??
        [],
    createdAt: _parseDateTime(json['created_at']) ?? DateTime.now(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'username': username,
    'email': email,
    'phone': phone,
    'cnic': cnic,
    'profile_picture': profilePicture,
    'is_login': isLogin,
    'user_type': userType,
    'clinic': clinic?.toJson(),
    'room': room?.toJson(),
    'department': department?.toJson(),
    'designation': designation?.toJson(),
    'shift': shift?.toJson(),
    'employee': employee?.toJson(),
    'roles': roles.map((e) => e.toJson()).toList(),
    'created_at': createdAt.toIso8601String(),
  };
}

class Roles {
  The1 the1;

  Roles({
    required this.the1,
  });

  factory Roles.fromJson(Map<String, dynamic> json) => Roles(
    the1: _the1FromString(json['1'] ?? json['the1'] ?? json['role'] ) ?? The1.EMPLOYEE,
  );

  Map<String, dynamic> toJson() => {
    // this structure is ambiguous in original; keep generic
    'the1': the1.toJson(),
  };
}

class Summary {
  int totalUsers;
  int totalEmployees;
  int activeUsers;
  int inactiveUsers;
  ByDepartment byDepartment;
  ByDesignation byDesignation;

  Summary({
    required this.totalUsers,
    required this.totalEmployees,
    required this.activeUsers,
    required this.inactiveUsers,
    required this.byDepartment,
    required this.byDesignation,
  });

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
    totalUsers: json['total_users'] ?? 0,
    totalEmployees: json['total_employees'] ?? 0,
    activeUsers: json['active_users'] ?? 0,
    inactiveUsers: json['inactive_users'] ?? 0,
    byDepartment:
    ByDepartment.fromJson(json['by_department'] ?? <String, dynamic>{}),
    byDesignation:
    ByDesignation.fromJson(json['by_designation'] ?? <String, dynamic>{}),
  );

  Map<String, dynamic> toJson() => {
    'total_users': totalUsers,
    'total_employees': totalEmployees,
    'active_users': activeUsers,
    'inactive_users': inactiveUsers,
    'by_department': byDepartment.toJson(),
    'by_designation': byDesignation.toJson(),
  };
}

class ByDepartment {
  int empty;
  int physiotherapy;
  int reception;
  int marketing;

  ByDepartment({
    required this.empty,
    required this.physiotherapy,
    required this.reception,
    required this.marketing,
  });

  factory ByDepartment.fromJson(Map<String, dynamic> json) => ByDepartment(
    empty: json['empty'] ?? 0,
    physiotherapy: json['physiotherapy'] ?? 0,
    reception: json['reception'] ?? 0,
    marketing: json['marketing'] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    'empty': empty,
    'physiotherapy': physiotherapy,
    'reception': reception,
    'marketing': marketing,
  };
}

class ByDesignation {
  int empty;
  int ceo;
  int assistantManager;
  int physiotherapist;
  int receptionist;
  int salesExecutive;

  ByDesignation({
    required this.empty,
    required this.ceo,
    required this.assistantManager,
    required this.physiotherapist,
    required this.receptionist,
    required this.salesExecutive,
  });

  factory ByDesignation.fromJson(Map<String, dynamic> json) => ByDesignation(
    empty: json['empty'] ?? 0,
    ceo: json['ceo'] ?? 0,
    assistantManager: json['assistant_manager'] ?? 0,
    physiotherapist: json['physiotherapist'] ?? 0,
    receptionist: json['receptionist'] ?? 0,
    salesExecutive: json['sales_executive'] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    'empty': empty,
    'ceo': ceo,
    'assistant_manager': assistantManager,
    'physiotherapist': physiotherapist,
    'receptionist': receptionist,
    'sales_executive': salesExecutive,
  };
}

/* -----------------------
   Helper functions
   ----------------------- */

DateTime? _parseDateTime(dynamic value) {
  if (value == null) return null;
  try {
    if (value is DateTime) return value;
    if (value is int) {
      // treat as milliseconds since epoch if large, else seconds
      final v = value;
      if (v > 9999999999) {
        return DateTime.fromMillisecondsSinceEpoch(v);
      } else {
        return DateTime.fromMillisecondsSinceEpoch(v * 1000);
      }
    }
    return DateTime.tryParse(value.toString());
  } catch (_) {
    return null;
  }
}

int? _tryParseInt(dynamic v) {
  if (v == null) return null;
  if (v is int) return v;
  if (v is String) return int.tryParse(v);
  return null;
}

/// Convert an enum value to a normalized string (enum name)
String _enumToString(Object e) {
  return e.toString().split('.').last;
}

/// Generic enum parser using normalization:
/// - turns input to string
/// - keeps only letters/numbers/underscore and uppercase
/// - compares with enum names (which are uppercase by definition)
T? _enumFromString<T>(List<T> enumValues, dynamic input) {
  if (input == null) return null;
  final s = input.toString();
  final normalized = _normalizeEnumKey(s);
  for (var v in enumValues) {
    final name = v.toString().split('.').last;
    if (_normalizeEnumKey(name) == normalized) return v;
  }
  return null;
}

String _normalizeEnumKey(String s) {
  final cleaned = s.replaceAllMapped(RegExp(r'[^A-Za-z0-9]'), (m) => '_');
  return cleaned.toUpperCase();
}

/* Convenience wrappers for specific enums (already used above) */
