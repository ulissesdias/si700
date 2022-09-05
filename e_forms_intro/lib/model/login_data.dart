class LoginData {
  String username;
  String password;
  bool confirmed = false;

  LoginData({required this.username, required this.password});

  doSomething() {
    print("Username: $username");
    print("Password: $password");
  }
}
