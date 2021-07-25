using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace StoreFrontV3.DATA.EF//.StoreFrontV3Metadata
{
    #region Brand Metadata

    public class BrandMetadata
    {
        //public int BrandID { get; set; }

        [Display(Name = "Brand Name")]
        [Required(ErrorMessage = "*Brand Name is required")]
        [StringLength(20, ErrorMessage = "*Value must be 20 characters or less")]
        public string BrandName { get; set; }

        [Required(ErrorMessage = "*City is required")]
        [StringLength(20, ErrorMessage = "*Value must be 20 characters or less")]
        public string City { get; set; }

        [StringLength(2, MinimumLength = 2, ErrorMessage = "*Must be 2 characters")]
        [DisplayFormat(NullDisplayText = "[N/A]")]
        public string State { get; set; }

        [StringLength(30, ErrorMessage = "*Value must be 30 characters or less")]
        [Required(ErrorMessage = "*Country is required")]
        public string Country { get; set; }
    }

    [MetadataType(typeof(BrandMetadata))]
    public partial class Brand
    {

    }
    #endregion

    #region Department Metadata

    public class DepartmentMetadata
    {
        //public int DeptID { get; set; }

        [Display(Name = "Department Name")]
        [Required(ErrorMessage = "*Department Name is required")]
        [StringLength(10, ErrorMessage = "*Value must be 10 characters or less")]
        public string DeptName { get; set; }
    }

    [MetadataType(typeof(DepartmentMetadata))]
    public partial class Department
    {

    }

    #endregion

    #region Employee Metadata

    public class EmployeeMetadata
    {
        //public int EmpID { get; set; }

        [Required(ErrorMessage = "*First Name is required")]
        [StringLength(20, ErrorMessage = "*Value must be 20 characters or less")]
        [Display(Name = "First Name")]
        public string FName { get; set; }

        [StringLength(20, ErrorMessage = "*Value must be 20 characters or less")]
        [Required(ErrorMessage = "*Last Name is required")]
        public string LName { get; set; }


        [Range(1, 5, ErrorMessage = "*Value must be a valid number between 1-5 characters in length")]
        [Required(ErrorMessage = "*Department ID is required")]
        [Display(Name = "Department ID")]
        public int DeptID { get; set; }

        [Display(Name = "Direct Report")]
        [StringLength(20, ErrorMessage = "*Value must be 20 characters or less")]
        [DisplayFormat(NullDisplayText = "[N/A]")]
        public string DirectReport { get; set; }

        [Display(Name = "Hire Date")]
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true, NullDisplayText = "[N/A]")]
        public Nullable<System.DateTime> HireDate { get; set; }

        [Range(1, (Double)decimal.MaxValue, ErrorMessage = "*Value must be a valid number, 1 or larger")]
        [DisplayFormat(DataFormatString = "{0:c}", NullDisplayText = "[N/A]")]
        public Nullable<int> Salary { get; set; }
    }

    [MetadataType(typeof(EmployeeMetadata))]
    public partial class Employee
    {
        public string FullName
        {
            get { return FName + " " + LName; }
        }
    }

    #endregion

    #region Guitar Metadata

    public class GuitarMetadata
    {
        //public int GuitarID { get; set; }

        [Display(Name = "Guitar Model")]
        [Required(ErrorMessage = "*Guitar Model is required")]
        [StringLength(50, ErrorMessage = "*Value must be 50 characters or less")]
        public string GuitarModel { get; set; }

        [Display(Name = "Guitar Description")]
        [DisplayFormat(NullDisplayText = "[N/A]")]
        [Required(ErrorMessage = "*Value must be 1 character or more")]
        [UIHint("MultilineText")]
        public string GuitarDescription { get; set; }

        [Display(Name = "Guitar Image")]
        [DisplayFormat(NullDisplayText = "[N/A]")]
        public string GuitarImage { get; set; }

        [Range(0, (Double)decimal.MaxValue, ErrorMessage = "*Value must be a valid number, 1 or larger")]
        [DisplayFormat(DataFormatString = "{0:c}", NullDisplayText = "[-N/A-]")]
        public Nullable<decimal> Price { get; set; }

        [Display(Name = "Units in Stock")]
        [DisplayFormat(NullDisplayText = "[N/A]")]
        [Range(0, int.MaxValue, ErrorMessage = "*Value must be a valid number, 0 or larger")]
        public Nullable<int> UnitsInStock { get; set; }

        [Display(Name = "Units on Order")]
        [DisplayFormat(NullDisplayText = "[N/A]")]
        [Range(0, int.MaxValue, ErrorMessage = "*Value must be a valid number, 0 or larger")]
        public Nullable<int> UnitsOnOrder { get; set; }

        [Display(Name = "Units Sold")]
        [DisplayFormat(NullDisplayText = "[N/A]")]
        [Range(0, int.MaxValue, ErrorMessage = "*Value must be a valid number, 0 or larger")]
        public Nullable<int> UnitsSold { get; set; }

        [Display(Name = "Production Date")]
        [Required(ErrorMessage = "*Production Date is required")]
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true)]
        public System.DateTime ProductionDate { get; set; }

        [Display(Name = "Brand ID")]
        [DisplayFormat(NullDisplayText = "[N/A]")]
        [Range(1, int.MaxValue, ErrorMessage = "*Value must be a valid number, 1 or larger")]
        public Nullable<int> BrandID { get; set; }

        [Display(Name = "Guitar Inventory ID")]
        [Required(ErrorMessage = "*Guitar Inventory ID is required")]
        [Range(0, int.MaxValue, ErrorMessage = "*Value must be a valid number, 0 or larger")]
        public int GuitarInventoryID { get; set; }

        [Display(Name = "Guitar Category")]
        [Required(ErrorMessage = "*Guitar Category is required")]
        [Range(1, 20, ErrorMessage = "Value must be 1-20")]
        public int GuitarCategory { get; set; }

        [Display(Name = "Department ID")]
        [Required(ErrorMessage = "*Department ID is required")]
        [Range(1, 10, ErrorMessage = "Value must be 1-10")]
        public int DeptID { get; set; }
    }

    [MetadataType(typeof(GuitarMetadata))]
    public partial class Guitar
    {

    }
    #endregion

    #region Guitar Category Metadata

    public class GuitarCategoryMetadata
    {
        //public int GuitarCategoryID { get; set; }

        [Display(Name = "Guitar Category")]
        [DisplayFormat(NullDisplayText = "[N/A]")]
        [StringLength(20, ErrorMessage = "*Value must be 20 characters or less")]
        public string GuitarCategory { get; set; }
    }

    [MetadataType(typeof(GuitarCategoryMetadata))]
    public partial class GuitarCategory
    {

    }
    #endregion

    #region Guitar Inventory Metadata

    public class GuitarInventoryMetadata
    {
        //public int GuitarInventoryID { get; set; }

        [Display(Name = "Guitar Inventory Name")]
        [Required(ErrorMessage = "*Guitar Inventory Name is required")]
        [StringLength(20, ErrorMessage = "*Value must be 20 characters or less")]
        public string GuitarInventoryName { get; set; }
    }

    [MetadataType(typeof(GuitarInventoryMetadata))]
    public partial class GuitarInventory
    {

    }
    #endregion

}
