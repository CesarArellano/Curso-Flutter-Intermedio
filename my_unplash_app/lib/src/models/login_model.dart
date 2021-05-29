import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    LoginModel({
        this.ok,
        this.message,
        this.data,
    });

    bool ok;
    String message;
    Data data;

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        ok: json["ok"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        this.user,
        this.token,
    });

    User user;
    String token;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
    };
}

class User {
    User({
        this.username,
        this.email,
        this.profilePhoto,
    });

    String username;
    String email;
    String profilePhoto;

    factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"],
        email: json["email"],
        profilePhoto: json["profile_photo"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "profile_photo": profilePhoto,
    };
}
