enum RoleEnum {
  admin,
  acctPay,
  acctRcv,
  empBenefits,
  genLedger,
  payroll,
  inventory,
  production,
  qualityCtl,
  sales,
  orders,
  customers,
  shipping,
  returns;

  String get label {
    switch (this) {
      case RoleEnum.admin:
        return 'Administrator';
      case RoleEnum.acctPay:
        return 'Accounts Payable';
      case RoleEnum.acctRcv:
        return 'Accounts Receivable';
      case RoleEnum.empBenefits:
        return 'Employee Benefits';
      case RoleEnum.genLedger:
        return 'General Ledger';
      case RoleEnum.payroll:
        return 'Payroll';
      case RoleEnum.inventory:
        return 'Inventory';
      case RoleEnum.production:
        return 'Production';
      case RoleEnum.qualityCtl:
        return 'Quality Control';
      case RoleEnum.sales:
        return 'Sales';
      case RoleEnum.orders:
        return 'Orders';
      case RoleEnum.customers:
        return 'Customers';
      case RoleEnum.shipping:
        return 'Shipping';
      case RoleEnum.returns:
        return 'Returns';
    }
  }
}
