class UserModel {
  String? uid; // Add a uid property if you need it
  String fullName;
  String studentId;
  String departmentName;
  String email;
  String phoneNumber;
  String gender; // Optional
  String dateOfBirth; // Optional
  String profilePictureUrl;

  UserModel({
    this.uid,
    required this.fullName,
    required this.studentId,
    required this.departmentName,
    required this.email,
    required this.phoneNumber,
    this.gender = '', // Optional: Provide a default value
    this.dateOfBirth = '', // Optional: Provide a default value
    this.profilePictureUrl = '',
  });

  // Function to convert UserModel to a Map (for Firestore)
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'fullName': fullName,
      'studentId': studentId,
      'departmentName': departmentName,
      'email': email,
      'phoneNumber': phoneNumber,
      'gender': gender,
      'dateOfBirth': dateOfBirth,
      'profilePictureUrl': profilePictureUrl,
    };
  }

  // Function to create a UserModel from a Firestore document snapshot
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      fullName: map['fullName'] ?? '',
      studentId: map['studentId'] ?? '',
      departmentName: map['departmentName'] ?? '',
      email: map['email'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      gender: map['gender'] ?? '',
      dateOfBirth: map['dateOfBirth'] ?? '',
      profilePictureUrl: map['profilePictureUrl'] ?? '',
    );
  }
}