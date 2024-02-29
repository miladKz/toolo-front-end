import 'package:toolo_gostar/data/models/auth/user_data_dto.dart';
import 'package:toolo_gostar/domain/entities/auth/auth_base_data.dart';

class AuthBaseDataDto extends AuthBaseData {
  AuthBaseDataDto({required super.userData, required super.token});

  factory AuthBaseDataDto.fromMap(Map<String, dynamic> map) {
    return AuthBaseDataDto(
      token: map['Token'],
      userData: UserDataDto.fromMap(map['User']),
    );
  }

  Map<String, dynamic> toMap() {
    return {"Token": token, "User": _getUserDataAsDto().toMap()};
  }

  UserDataDto _getUserDataAsDto() {
    return UserDataDto(
        id: userData.id,
        workGroupID: userData.workGroupID,
        userType: userData.userType,
        userGroupsID: userData.userGroupsID,
        defaultDatabaseID: userData.defaultDatabaseID,
        displayName: userData.displayName,
        userName: userData.userName);
  }
}
