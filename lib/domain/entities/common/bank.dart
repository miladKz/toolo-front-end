import 'package:toolo_gostar/domain/entities/common/counterparty.dart';

import '../../../data/enum/counter_party_kinds.dart';

class Bank extends Counterparty {
  Bank({required Counterparty counterparty})
      : super(
          id: counterparty.id,
          currencyType: counterparty.currencyType,
          code: counterparty.code,
          kind: CounterPartyKinds.bank.value,
          customerStatus: counterparty.customerStatus,
          address: counterparty.address,
          bankAccType: counterparty.bankAccType,
          bankCardNumber: counterparty.bankCardNumber,
          bursType: counterparty.bursType,
          cityId: counterparty.cityId,
          nationalCode: counterparty.nationalCode,
          postalCode: counterparty.postalCode,
          companyName: counterparty.companyName,
          sharePercentage: counterparty.sharePercentage,
          foundationDate: counterparty.foundationDate,
          description: counterparty.description,
          chequeCredit: counterparty.chequeCredit,
          rialCredit: counterparty.rialCredit,
          fax: counterparty.fax,
          firstName: counterparty.firstName,
          groupValueId: counterparty.groupValueId,
          responsibleBoard: counterparty.responsibleBoard,
          isActive: counterparty.isActive,
          isBoardMember: counterparty.isBoardMember,
          isEmployee: counterparty.isEmployee,
          isCustomer: counterparty.isCustomer,
          isInvestor: counterparty.isInvestor,
          isOtherParty: counterparty.isOtherParty,
          isShareholder: counterparty.isShareholder,
          isSupplier: counterparty.isSupplier,
          isLender: counterparty.isLender,
          isBorrower: counterparty.isBorrower,
          isDependent: counterparty.isDependent,
          isIntermediary: counterparty.isIntermediary,
          lastName: counterparty.lastName,
          name: counterparty.name,
          parentId: counterparty.parentId,
          passportNumber: counterparty.passportNumber,
          prefixId: counterparty.prefixId,
          jobTitle: counterparty.jobTitle,
          shebaNumber: counterparty.shebaNumber,
          registrationNumber: counterparty.registrationNumber,
          nationality: counterparty.nationality,
          detailId: counterparty.detailId,
          phone: counterparty.phone,
          type: counterparty.type,
          birthCertificateNumber: counterparty.birthCertificateNumber,
          economicCode: counterparty.economicCode,
          brand: counterparty.brand,
        );

  @override
  List<Object?> get props => [firstName, code, name, type];
}
