class BranchesAddresses {
  late List<Branch> branches;
  String? msg;
  bool? status;

  BranchesAddresses({required this.branches, this.msg, this.status});

  BranchesAddresses.fromJson(  json) {
    if (json['data'] != null) {
      branches = <Branch>[];
      json['data'].forEach((v) {
        branches.add(new Branch.fromJson(v));
      });
    }
    msg = json['msg'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.branches != null) {
      data['data'] = this.branches.map((v) => v.toJson()).toList();
    }
    data['msg'] = this.msg;
    data['status'] = this.status;
    return data;
  }
}

class Branch {
  int? id;
  String? name_en;
  String? lat;
  String? lng;
  String? restaurantName;
  String? restaurantId;
  String? address_ar;
  String? address_en;
  String? createdAt;
  String? database;
  String? name_ar;
  String? updatedAt;
  bool? available;

  Branch(
      {this.id,
      this.name_en,
      this.lat,
      this.lng,
      this.restaurantName,
      this.restaurantId,
      this.address_ar,
      this.address_en,
      this.database,
      this.name_ar,
      this.available,
      this.createdAt,
      this.updatedAt});

  Branch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name_en = json['name_en'];
    name_ar = json['name_ar'];
    lat = json['lat'];
    lng = json['lng'];
    restaurantName = json['restaurant_name'];
    restaurantId = json['restaurant_id'];
    address_ar = json['address_ar'];
    address_en = json['address_en'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    available = json['available'];
    database = json['database'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.name_en;
    data['name_ar'] = this.name_ar;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['restaurant_name'] = this.restaurantName;
    data['restaurant_id'] = this.restaurantId;
    data['address_ar'] = this.address_ar;
    data['address_en'] = this.address_en;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['available'] = this.available;
    data['database'] = this.database;
    return data;
  }
}




