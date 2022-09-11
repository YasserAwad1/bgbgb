enum Role { Default, seller }

class UserModel {
  final String id;
  final String name;
  final String phoneNumber;
  final Role role;

  UserModel(
      {required this.id,
      required this.name,
      required this.phoneNumber,
      this.role = Role.Default});
}
