enum RoleEnum {
  ADMIN,
  ACCT_PAY,
  ACCT_RCV,
  EMP_BENEFITS,
  GEN_LEDGER,
  PAYROLL,
  INVENTORY,
  PRODUCTION,
  QUALITY_CTL,
  SALES,
  ORDERS,
  CUSTOMERS,
  SHIPPING,
  RETURNS,
}

extension RoleEnumExtension on RoleEnum {
  String get value {
    switch (this) {
      case RoleEnum.ADMIN:
        return "Administrator";
      case RoleEnum.ACCT_PAY:
        return "Accounts Payable";
      case RoleEnum.ACCT_RCV:
        return "Accounts Receivable";
      case RoleEnum.EMP_BENEFITS:
        return "Employee Benefits";
      case RoleEnum.GEN_LEDGER:
        return "General Ledger";
      case RoleEnum.PAYROLL:
        return "Payroll";
      case RoleEnum.INVENTORY:
        return "Inventory";
      case RoleEnum.PRODUCTION:
        return "Production";
      case RoleEnum.QUALITY_CTL:
        return "Quality Control";
      case RoleEnum.SALES:
        return "Sales";
      case RoleEnum.ORDERS:
        return "Orders";
      case RoleEnum.CUSTOMERS:
        return "Customers";
      case RoleEnum.SHIPPING:
        return "Shipping";
      case RoleEnum.RETURNS:
        return "Returns";
      default:
        return "";
    }
  }
}
