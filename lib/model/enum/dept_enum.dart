enum DeptEnum {
  noneSelected,
  acct,
  sales,
  plant,
  shipping,
  qc;

  String get label {
    switch (this) {
      case DeptEnum.noneSelected:
        return "--None Selected--";
      case DeptEnum.acct:
        return "Accounting";
      case DeptEnum.sales:
        return "Sales";
      case DeptEnum.plant:
        return "Plant";
      case DeptEnum.shipping:
        return "Shipping";
      case DeptEnum.qc:
        return "Quality Control";
    }
  }
}
