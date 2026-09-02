enum UserRole {
  investigatingOfficer,
  vaultCustodian,
  forensicLaboratory,
  supervisor,
  judicialChamber,
  complianceOfficer,
  systemAdministrator,
}

class UserModel {
  final String id;
  final String name;
  final String email;
  final String? phone;
  final UserRole role;
  final String? organizationId;
  final String status;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    required this.role,
    this.organizationId,
    this.status = 'ACTIVE',
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        role: _parseRole(json['role']),
        organizationId: json['organization_id'],
        status: json['status'] ?? 'ACTIVE',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'role': role.name,
        'organization_id': organizationId,
        'status': status,
      };

  static UserRole _parseRole(String? roleString) {
    switch (roleString?.toLowerCase()) {
      case 'vaultcustodian':
        return UserRole.vaultCustodian;
      case 'forensiclaboratory':
        return UserRole.forensicLaboratory;
      case 'supervisor':
        return UserRole.supervisor;
      case 'judicialchamber':
        return UserRole.judicialChamber;
      case 'complianceofficer':
        return UserRole.complianceOfficer;
      case 'systemadministrator':
        return UserRole.systemAdministrator;
      case 'investigatingofficer':
      default:
        return UserRole.investigatingOfficer;
    }
  }
}
