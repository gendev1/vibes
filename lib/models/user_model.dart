class UserModel {
  final String uid;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String address;
  final String nodeAddress;
  final String profilePicURL;

  UserModel({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.address,
    required this.nodeAddress,
    required this.profilePicURL,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      phone: map['phone'],
      address: map['address'],
      nodeAddress: map['nodeAddress'],
      profilePicURL: map['profilePicURL'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'address': address,
      'nodeAddress': nodeAddress,
      'profilePicURL': profilePicURL,
    };
  }
}
