class LoginModel {
  bool status;
  String message;
  Data? data;

  LoginModel({required this.status, required this.message, this.data});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      // Kita buat fleksibel: kalau statusnya bool true atau tulisan "success", dianggap true
      status: json['status'] == true || json['status'] == 'success',
      message: json['message'] ?? "",
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }
}

class Data {
  String? accessToken;
  String? role;

  Data({this.accessToken, this.role});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      // Kita ambil 'accessToken' atau 'accesToken' (jaga-jaga kalau ada typo)
      accessToken: json['accessToken'] ?? json['accesToken'],
      role: json['role'],
    );
  }
}
