import 'package:toolo_gostar/presentation/widgets/main/generic_tree_view/widget_tree_model_abs.dart';

class Account extends IDataTreeModel {
  String accCode1;
  String accCode2;
  String accCode3;
  String accCode4;
  int accountLevel;
  String accountcd;
  bool canDel;
  String description;
  String groupCode;
  bool hasPooli;
  bool hasTafzili;
  bool hasTaseir;
  int indexOrder1;
  int indexOrder2;
  bool isActive;
  bool isAmalyati;
  int type;
  int mahiatRialy;
  int balanceSheetType;

  Account(
      {
      required this.accCode1,
      required this.accCode2,
      required this.accCode3,
      required this.accCode4,
      required this.accountLevel,
      required this.accountcd,
      required this.canDel,
      required this.description,
      required this.groupCode,
      required this.hasPooli,
      required this.hasTafzili,
      required this.hasTaseir,
      required this.indexOrder1,
      required this.indexOrder2,
      required this.isActive,
      required this.isAmalyati,
      required this.type,
      required this.mahiatRialy,
      required this.balanceSheetType,
       required super.id,
       required super.children,
       required super.hasChildren,
       required super.displayName,
      });

  void updateBalanceSheetType(int value) {
    if (value >= -1 && value < 3) balanceSheetType = value;
  }

  void updateAccCode1(String newAccCode1) {
    if (newAccCode1.isNotEmpty) {
      accCode1 = newAccCode1;
    }
  }

  void updateAccCode2(String newAccCode2) {
    if (newAccCode2.isNotEmpty) {
      accCode2 = newAccCode2;
    }
  }

  void updateAccCode3(String newAccCode3) {
    if (newAccCode3.isNotEmpty) {
      accCode3 = newAccCode3;
    }
  }

  void updateAccCode4(String newAccCode4) {
    if (newAccCode4.isNotEmpty) {
      accCode4 = newAccCode4;
    }
  }

  void updateAccountLevel(int newAccountLevel) {
    if (newAccountLevel >= 0) {
      accountLevel = newAccountLevel;
    }
  }

  void updateAccountcd(String newAccountcd) {
    if (newAccountcd.isNotEmpty) {
      accountcd = newAccountcd;
    }
  }

  void updateCanDel(bool newCanDel) {
    canDel = newCanDel;
  }

  void updateDescription(String newDescription) {
    if (newDescription.isNotEmpty) {
      description = newDescription;
    }
  }

  void updateGroupCode(String newGroupCode) {
    if (newGroupCode.isNotEmpty) {
      groupCode = newGroupCode;
    }
  }

  void updateHasPooli(bool newHasPooli) {
    hasPooli = newHasPooli;
  }

  void updateHasTafzili(bool newHasTafzili) {
    hasTafzili = newHasTafzili;
  }

  void updateHasTaseir(bool newHasTaseir) {
    hasTaseir = newHasTaseir;
  }

  void updateIndexOrder1(int newIndexOrder1) {
    if (newIndexOrder1 > -1) {
      indexOrder1 = newIndexOrder1;
    }
  }

  void updateIndexOrder2(int newIndexOrder2) {
    if (newIndexOrder2 > -1) {
      indexOrder2 = newIndexOrder2;
    }
  }

  void updateIsActive(bool newIsActive) {
    isActive = newIsActive;
  }

  void updateIsAmalyati(bool newIsAmalyati) {
    isAmalyati = newIsAmalyati;
  }

  void updateType(int newType) {
    if (newType > -1) {
      type = newType;
    }
  }

  void updateMahiatRialy(int newMahiatRialy) {
    if (newMahiatRialy > -1) {
      mahiatRialy = newMahiatRialy;
    }
  }

  void updateDisplayName(String newDisplayName) {
    if (newDisplayName.trim().isNotEmpty) {
      super.displayName = newDisplayName;
    }
  }

  Account copy() {
    return Account(
        id: id,
        accCode1: accCode1,
        accCode2: accCode2,
        accCode3: accCode3,
        accCode4: accCode4,
        accountLevel: accountLevel,
        accountcd: accountcd,
        canDel: canDel,
        description: description,
        groupCode: groupCode,
        hasPooli: hasPooli,
        hasTafzili: hasTafzili,
        hasTaseir: hasTaseir,
        indexOrder1: indexOrder1,
        indexOrder2: indexOrder2,
        isActive: isActive,
        isAmalyati: isAmalyati,
        type: type,
        mahiatRialy: mahiatRialy,
        displayName: displayName,
        balanceSheetType: balanceSheetType, children: [], hasChildren: false);
  }
  factory  Account.empty() {
    return Account(
        id: 0,
        accCode1: '',
        accCode2: '',
        accCode3: '',
        accCode4: '',
        accountLevel: -1,
        accountcd: '',
        canDel: false,
        description: '',
        groupCode: '',
        hasPooli: false,
        hasTafzili: false,
        hasTaseir: false,
        indexOrder1: -1,
        indexOrder2: -1,
        isActive: false,
        isAmalyati: false,
        type: -1,
        mahiatRialy: -1,
        displayName: '',
        balanceSheetType: -1, children: [], hasChildren: false);
  }
}
