import 'package:toolo_gostar/data/enum/counter_party_kinds.dart';
import 'package:toolo_gostar/domain/entities/common/counterparty.dart';

class CardReader extends Counterparty {
  CardReader({required Counterparty counterparty})
      : super(
          id: counterparty.id,
          currencyType: counterparty.currencyType,
          code: counterparty.code,
          kind: CounterPartyKinds.cardReader.value,
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
          customerStatus: counterparty.customerStatus
        );

  @override
  List<Object?> get props => [code, name, type, description];


}
