class employee{
  int? id;
  String? name;
  int? salary;
  employee({this.id,this.name,this.salary});

  factory employee.fromJson(Map<String,dynamic> json)=>employee(
    id:json['id'],
    name:json['name'],
      salary: json['salary']
  );

  Map<String,dynamic> toJson() =>{
    "id":id ?? 0,
    "name":name ?? '',
    "salary":salary ?? 0
  };

}