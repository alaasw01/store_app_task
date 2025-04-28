class Auth {
  Data? data;
  String? token;

  Auth({this.data, this.token});

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
        'token': token,
      };
}

class Data {
  String? id;
  String? name;
  String? email;
  String? role;
  bool? active;
  List<dynamic>? wishlist;
  List<dynamic>? addresses;
  DateTime? createdAt;
  DateTime? updatedAt;
  num? v;

  Data({
    this.id,
    this.name,
    this.email,
    this.role,
    this.active,
    this.wishlist,
    this.addresses,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        role: json['role'] as String?,
        active: json['active'] as bool?,
        wishlist: json['wishlist'] as List<dynamic>?,
        addresses: json['addresses'] as List<dynamic>?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as num?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'email': email,
        'role': role,
        'active': active,
        'wishlist': wishlist,
        'addresses': addresses,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}
