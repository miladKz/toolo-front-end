class UserData {
  int id;
  int workGroupID;
  int userType;
  int userGroupsID;
  int defaultDatabaseID;
  String displayName;
  String userName;

  UserData(
      {required this.id,
      required this.workGroupID,
      required this.userType,
      required this.userGroupsID,
      required this.defaultDatabaseID,
      required this.displayName,
      required this.userName});

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      id: map['ID'],
      workGroupID: map['WorkGroupID'],
      userType: map['UserType'],
      userGroupsID: map['UserGroupsID'],
      defaultDatabaseID: map['DefaultDatabaseID'],
      displayName: map['DisplayName'],
      userName: map['UserName'],
    );
  }
}
