import 'counterparty.dart';

class RevolvingFund extends Counterparty {
  RevolvingFund({required Counterparty counterparty})
      : super(
          id: counterparty.id,
          code: counterparty.code,
          kind: counterparty.kind,
          address: counterparty.address,
          bankAccType: counterparty.bankAccType,
          bankCardNumber: counterparty.bankCardNumber,
          exchangeType: counterparty.exchangeType,
          cityId: counterparty.cityId,
          nationalCode: counterparty.nationalCode,
          postalCode: counterparty.postalCode,
          companyName: counterparty.companyName,
          sharePercentage: counterparty.sharePercentage,
          foundationDate: counterparty.foundationDate,
          description: counterparty.description,
          creditCheck: counterparty.creditCheck,
          creditRial: counterparty.creditRial,
          fax: counterparty.fax,
          firstName: counterparty.firstName,
          groupValueId: counterparty.groupValueId,
          responsibleBoard: counterparty.responsibleBoard,
          isActive: counterparty.isActive,
          isBlackList: counterparty.isBlackList,
          isBoardMember: counterparty.isBoardMember,
          isStaff: counterparty.isStaff,
          isCustomer: counterparty.isCustomer,
          isInvestee: counterparty.isInvestee,
          isOther: counterparty.isOther,
          isPartner: counterparty.isPartner,
          isSupply: counterparty.isSupply,
          isFacilitator: counterparty.isFacilitator,
          isReceiverFacility: counterparty.isReceiverFacility,
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
          tel: counterparty.tel,
          type: counterparty.type,
        );

  @override
  List<Object?> get props =>
      [code, name, type, description, passportNumber, passportNumber];
}
