enum Role { Default, seller }

class UserModel {
  final String id;
  final String name;
  final String email;
  final int gender; //1 for male 0 female
  final Role role;
  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.gender,
      this.role = Role.Default});
}
