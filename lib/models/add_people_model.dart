class AddPeopleModel {
  const AddPeopleModel({
    required this.imageUrl,
    required this.name,
    this.role,
  });

  final String? imageUrl;
  final String? name;
  final String? role;
}
