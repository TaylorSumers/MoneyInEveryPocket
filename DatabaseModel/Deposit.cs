//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MoneyInEveryPocket.DatabaseModel
{
    using System;
    using System.Collections.Generic;
    
    public partial class Deposit
    {
        public int DepositID { get; set; }
        public string DepositName { get; set; }
        public bool DepositRefillable { get; set; }
        public bool DepositWithdrawable { get; set; }
        public bool DepositCapitalization { get; set; }
        public int DepositMinTerm { get; set; }
        public decimal DepositPercent { get; set; }
    }
}
