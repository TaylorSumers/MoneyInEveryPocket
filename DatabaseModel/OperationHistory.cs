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
    
    public partial class OperationHistory
    {
        public int OpID { get; set; }
        public int OpType { get; set; }
        public System.DateTime OpDate { get; set; }
        public decimal OpAmount { get; set; }
        public long OpAccount { get; set; }
    
        public virtual Account Account { get; set; }
        public virtual OperationType OperationType { get; set; }
    }
}
