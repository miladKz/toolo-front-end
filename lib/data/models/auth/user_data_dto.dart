import 'package:toolo_gostar/domain/entities/auth/user_data.dart';

class UserDataDto extends UserData {
  UserDataDto(
      {required super.id,
      required super.workGroupID,
      required super.userType,
      required super.userGroupsID,
      required super.defaultDatabaseID,
      required super.displayName,
      required super.userName});

  factory UserDataDto.fromMap(Map<String, dynamic> map) {
    return UserDataDto(
      id: map['ID'],
      workGroupID: map['WorkGroupID'],
      userType: map['UserType'],
      userGroupsID: map['UserGroupsID'],
      defaultDatabaseID: map['DefaultDatabaseID'],
      displayName: map['DisplayName'],
      userName: map['UserName'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "ID": id,
      "WorkGroupID": workGroupID,
      "UserType": userType,
      "UserGroupsID": userGroupsID,
      "DefaultDatabaseID": defaultDatabaseID,
      "DisplayName": displayName,
      "UserName": userName
    };
  }
}
