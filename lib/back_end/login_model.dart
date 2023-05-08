class LoginModel {
  final String accountName;
  final String password;
  final String user_id;

  LoginModel(this.accountName, this.password, this.user_id);

  LoginModel.fromJson(Map<String, dynamic> json)
      : accountName = json['accountName'],
        password = json['password'],
        user_id = json['user_id'];

  Map<String, dynamic> toJson() => {
    'accountName': accountName,
    'password': password,
    'user_id': user_id,
  };
}