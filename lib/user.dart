class User {
  String? name, address;
  int? number;
  User(this.name, this.number, this.address);
  //json to object
  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        number = json['number'],
        address=json['address'];
        //object to json
        Map<String, dynamic> toJson() => {
        'name': name,
        'number':number,
        'address':address
      };
}
