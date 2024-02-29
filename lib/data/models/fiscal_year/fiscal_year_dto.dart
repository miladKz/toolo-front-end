import '../../../domain/entities/auth/fiscal/fiscal_year.dart';

class FiscalYearDto extends FiscalYear {
  FiscalYearDto(
      {required super.id,
      required super.displayName,
      required super.activeYear});

  factory FiscalYearDto.fromMap(Map<String, dynamic> map) {
    return FiscalYearDto(
      id: map['ID'],
      displayName: map['DisplayName'],
      activeYear: map['ActiveYear'],
    );
  }
}
