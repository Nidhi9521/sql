import 'dart:convert';
/// _id : "62bd82f1aba35ec4d95312bb"
/// EmpId : 1
/// FirstName : "vcb"
/// LastName : "India"
/// Assignments : [{"AssignmentId":1,"AssignmentCategory":"Nodejs","AssignmentName":"Customer Rest Api","AssignmentStatus":"Completed","_id":"62bd82f1aba35ec4d95312bc"},{"AssignmentId":2,"AssignmentCategory":"Nodejs","AssignmentName":"Emplyees Rest Api","AssignmentStatus":"Pending","_id":"62bd82f1aba35ec4d95312bd"}]
/// __v : 0

EmployeeModel employeeModelFromJson(String str) => EmployeeModel.fromJson(json.decode(str));
String employeeModelToJson(EmployeeModel data) => json.encode(data.toJson());
class EmployeeModel {
  EmployeeModel({
      this.id, 
      this.empId, 
      this.firstName, 
      this.lastName, 
      this.assignments, 
      this.v,});

  EmployeeModel.fromJson(dynamic json) {
    id = json['_id'];
    empId = json['EmpId'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    if (json['Assignments'] != null) {
      assignments = [];
      json['Assignments'].forEach((v) {
        assignments?.add(Assignments.fromJson(v));
      });
    }
    v = json['__v'];
  }
  String? id;
  int? empId;
  String? firstName;
  String? lastName;
  List<Assignments>? assignments;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['EmpId'] = empId;
    map['FirstName'] = firstName;
    map['LastName'] = lastName;
    if (assignments != null) {
      map['Assignments'] = assignments?.map((v) => v.toJson()).toList();
    }
    map['__v'] = v;
    return map;
  }

}

/// AssignmentId : 1
/// AssignmentCategory : "Nodejs"
/// AssignmentName : "Customer Rest Api"
/// AssignmentStatus : "Completed"
/// _id : "62bd82f1aba35ec4d95312bc"

Assignments assignmentsFromJson(String str) => Assignments.fromJson(json.decode(str));
String assignmentsToJson(Assignments data) => json.encode(data.toJson());
class Assignments {
  Assignments({
      this.assignmentId, 
      this.assignmentCategory, 
      this.assignmentName, 
      this.assignmentStatus, 
      this.id,});

  Assignments.fromJson(dynamic json) {
    assignmentId = json['AssignmentId'];
    assignmentCategory = json['AssignmentCategory'];
    assignmentName = json['AssignmentName'];
    assignmentStatus = json['AssignmentStatus'];
    id = json['_id'];
  }
  int? assignmentId;
  String? assignmentCategory;
  String? assignmentName;
  String? assignmentStatus;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['AssignmentId'] = assignmentId;
    map['AssignmentCategory'] = assignmentCategory;
    map['AssignmentName'] = assignmentName;
    map['AssignmentStatus'] = assignmentStatus;
    map['_id'] = id;
    return map;
  }

}