import 'dart:convert';

UserDetails userDetailsFromJson(String str) =>
    UserDetails.fromJson(json.decode(str));

String userDetailsToJson(UserDetails data) => json.encode(data.toJson());

class UserDetails {
  String userId;
  Userdata userdata;
  BAddress? bAddress;
  BankDetails? bankDetails;

  UserDetails({
    required this.userId,
    required this.userdata,
    required this.bAddress,
    required this.bankDetails,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        userId: json["User_id"],
        userdata: Userdata.fromJson(json["userdata"]),
        bAddress: BAddress.fromJson(json["b_address"]),
        bankDetails: BankDetails.fromJson(json["bank_details"]),
      );

  Map<String, dynamic> toJson() => {
        "User_id": userId,
        "userdata": userdata.toJson(),
        "b_address": bAddress?.toJson(),
        "bank_details": bankDetails?.toJson(),
      };
}

class BAddress {
  String pin;
  String address;
  String city;
  String state;
  String country;

  BAddress({
    required this.pin,
    required this.address,
    required this.city,
    required this.state,
    required this.country,
  });

  factory BAddress.fromJson(Map<String, dynamic> json) => BAddress(
        pin: json["pin"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "pin": pin,
        "address": address,
        "city": city,
        "state": state,
        "country": country,
      };
}

class BankDetails {
  String accNum;
  String name;
  String ifsc;

  BankDetails({
    required this.accNum,
    required this.name,
    required this.ifsc,
  });

  factory BankDetails.fromJson(Map<String, dynamic> json) => BankDetails(
        accNum: json["acc_num"],
        name: json["name"],
        ifsc: json["ifsc"],
      );

  Map<String, dynamic> toJson() => {
        "acc_num": accNum,
        "name": name,
        "ifsc": ifsc,
      };
}

class Userdata {
  String uid;
  String email;
  String password;
  String name;
  String phone;
  String createdDate;

  Userdata({
    required this.uid,
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
    required this.createdDate,
  });

  factory Userdata.fromJson(Map<String, dynamic> json) => Userdata(
        uid: json["uid"],
        email: json["email"],
        password: json["password"],
        name: json["name"],
        phone: json["phone"],
        createdDate: json["createdDate"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "password": password,
        "name": name,
        "phone": phone,
        "createdDate": createdDate,
      };
}
