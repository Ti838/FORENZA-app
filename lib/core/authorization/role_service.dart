import '../../models/user_model.dart';

class RoleService {
  final UserModel currentUser;

  RoleService(this.currentUser);

  bool get canCaptureEvidence => currentUser.role == UserRole.investigatingOfficer;
  
  bool get canAccessVault => 
      currentUser.role == UserRole.vaultCustodian ||
      currentUser.role == UserRole.investigatingOfficer ||
      currentUser.role == UserRole.systemAdministrator;
      
  bool get canManageUsers => currentUser.role == UserRole.systemAdministrator;

  bool get canViewAuditLogs => 
      currentUser.role == UserRole.complianceOfficer ||
      currentUser.role == UserRole.systemAdministrator ||
      currentUser.role == UserRole.judicialChamber;
      
  String getDashboardRoute() {
    switch (currentUser.role) {
      case UserRole.investigatingOfficer:
        return '/officer/dashboard';
      case UserRole.vaultCustodian:
        return '/vault/dashboard';
      case UserRole.systemAdministrator:
        return '/admin/dashboard';
      case UserRole.complianceOfficer:
        return '/compliance/dashboard';
      case UserRole.forensicLaboratory:
        return '/lab/dashboard';
      case UserRole.judicialChamber:
        return '/judicial/dashboard';
      case UserRole.supervisor:
        return '/supervisor/dashboard';
    }
  }
}
