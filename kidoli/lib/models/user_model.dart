class userModel{
  String? nic;
  String? uid;
  String? email;
  String? address;
  String? age;
  String? cid;
  String? contact;
  String? firstname;
  String? gender;
  String? lastname;
  String? points;
  String? size;

  userModel({this.uid,this.nic , this.email, this.address,this.age,this.cid,this.contact,this.firstname,this.gender,this.lastname,this.points,this.size,});
  factory userModel.fromMap(map){
    return userModel(
      uid: map['uid'],
      nic: map['nic'],
      email: map['email'],
      address: map['address'],
      age: map['age'],
      cid: map['cid'],
      contact: map['contact'],
      firstname: map['firstname'],
      gender: map['gender'],
      lastname: map['lastname'],
      points: map['points'],
      size: map['size'],

    );
  }
  Map<String,dynamic> toMap(){
    return{
      'nic': nic,
      'email': email,
      'address':address,
      'age':age,
      'cid':cid,
      'contact':contact,
      'firstname':firstname,
      'gender':gender,
      'lastname':lastname,
      'points':points,
      'size':size,
    };
  }
}