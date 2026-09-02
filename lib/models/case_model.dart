class CaseModel {
  final String id;
  final String caseNumber;
  final String title;
  final String description;
  final String status;
  final String priority;
  final String assignedOfficerId;

  CaseModel({
    required this.id,
    required this.caseNumber,
    required this.title,
    required this.description,
    this.status = 'OPEN',
    this.priority = 'NORMAL',
    required this.assignedOfficerId,
  });

  factory CaseModel.fromJson(Map<String, dynamic> json) => CaseModel(
        id: json['id'],
        caseNumber: json['case_number'],
        title: json['title'],
        description: json['description'],
        status: json['status'] ?? 'OPEN',
        priority: json['priority'] ?? 'NORMAL',
        assignedOfficerId: json['assigned_officer_id'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'case_number': caseNumber,
        'title': title,
        'description': description,
        'status': status,
        'priority': priority,
        'assigned_officer_id': assignedOfficerId,
      };
}
