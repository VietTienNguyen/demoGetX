class User {
  final Object id;
  final String name;
  final String comments;
  final String postdetails;

  User({this.id, this.name, this.comments, this.postdetails});

  factory User.fromJson(Map<String,dynamic> user){
    return User(
      id: user['id'] as Object ,
      name: user['name'] as String,
      comments: user['comments'] as String,
      postdetails: user['postdetails'] as String
    );
  }
}
