//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace StoreFrontV3.DATA.EF
{
    using System;
    using System.Collections.Generic;
    
    public partial class Employee
    {
        public int EmpID { get; set; }
        public string FName { get; set; }
        public string LName { get; set; }
        public int DeptID { get; set; }
        public string DirectReport { get; set; }
        public Nullable<System.DateTime> HireDate { get; set; }
        public Nullable<int> Salary { get; set; }
    
        public virtual Department Department { get; set; }
    }
}
