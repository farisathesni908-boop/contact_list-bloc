class Contactlist {
  final String name;
  final String phone;

  Contactlist({
    required this.name,
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
    };
  }

  factory Contactlist.fromJson(Map<String, dynamic> json) {
    return Contactlist(
      name: json['name'],
      phone: json['phone'],
    );
  }
}