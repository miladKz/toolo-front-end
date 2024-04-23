import '../../../data/enum/counter_party_kinds.dart';
import 'counterparty.dart';

class People extends Counterparty {
  People({required Counterparty counterparty})
      : super(
          id: counterparty.id,
          currencyType: counterparty.currencyType,
          code: counterparty.code,
          kind: CounterPartyKinds.people.value,
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
          customerStatus: counterparty.customerStatus,
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
        );

  @override
  List<Object?> get props => [id, name, firstName, nationalCode];
}
