using BethanysPieShopHRM.App.Models;
using BethanysPieShopHRM.App.Services;
using BethanysPieShopHRM.Shared.Domain;
using Microsoft.AspNetCore.Components;

namespace BethanysPieShopHRM.App.Pages
{
    public partial class EmployeeDetail
    {
        [Inject]
        public IEmployeeDataService? EmployeeDataService { get; set; }

        [Parameter]
        public string EmployeeId { get; set; }

        public Employee? Employee { get; set; } = new Employee();

        private string Title = "Employee Detail";

        protected async override Task OnInitializedAsync()
        {
            //Title = (EmployeeId == null) ? "Employee Detail" : $"Employee Detail: {Employee.EmployeeId}";

            Employee = await EmployeeDataService.GetEmployeeDetails(int.Parse(EmployeeId));
            //Title = Employee == null ? "Employee Detail" : $"Employee Detail: {Employee.FirstName} {Employee.LastName}";
            
        }
    }
}
