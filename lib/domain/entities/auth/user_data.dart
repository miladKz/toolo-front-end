class UserData {
  int id;
  int workGroupID;
  int userType;
  String userGroupsID;
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
}
