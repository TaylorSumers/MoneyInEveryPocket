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
    
    public partial class User
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public User()
        {
            this.Account = new HashSet<Account>();
            this.Contract = new HashSet<Contract>();
        }
    
        public int UserID { get; set; }
        public string UserName { get; set; }
        public string UserSurname { get; set; }
        public string UserPatronymic { get; set; }
        public string Серия { get; set; }
        public string Номер { get; set; }
        public string UserPhone { get; set; }
        public Nullable<int> UserAddress { get; set; }
        public string UserEmail { get; set; }
        public string UserPassword { get; set; }
        public Nullable<System.DateTime> ДатаВыдачи { get; set; }
        public Nullable<int> Выдан { get; set; }
        public Nullable<System.DateTime> UserDateOfBirth { get; set; }
        public Nullable<int> UserPlaceOfBirth { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Account> Account { get; set; }
        public virtual Address Address { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Contract> Contract { get; set; }
        public virtual PassportIssueOrganization PassportIssueOrganization { get; set; }
        public virtual PlaceOfBirth PlaceOfBirth { get; set; }
    }
}