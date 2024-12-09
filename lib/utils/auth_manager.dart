class AuthManager {
  UserType? currentUserType;

  List<Map<String,dynamic>> users = [
    {
    "email": "yomi1965@yahoo.co.uk",
    "password":"OLAWORE"
  },
  {
    "email": "olushola.abolaji@gmail.com",
    "password":"Abolaji"
  }
  ];

}

enum UserType { admin, youth, guest }
