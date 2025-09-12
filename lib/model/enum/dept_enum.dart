enum DeptEnum {
  NONE_SELECTED,
  ACCT,
  SALES,
  PLANT,
  SHIPPING,
  QC;

  String get label {
    switch (this) {
      case DeptEnum.NONE_SELECTED:
        return "--None Selected--";
      case DeptEnum.ACCT:
        return "Accounting";
      case DeptEnum.SALES:
        return "Sales";
      case DeptEnum.PLANT:
        return "Plant";
      case DeptEnum.SHIPPING:
        return "Shipping";
      case DeptEnum.QC:
        return "Quality Control";
    }
  }
}
