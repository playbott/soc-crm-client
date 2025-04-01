class RoleRequest {
  int? id;
  String? name;

  RoleRequest({
    this.id,
    this.name,
  });

  factory RoleRequest.fromJson(Map<String, dynamic> json) => RoleRequest(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toMap() {
    if (id == null && name == null) {
      return {};
    }

    return {
    if (id != null) "id": id,
    if (name != null) "name": name,
  };
  }
}
