using BethanysPieShopHRM.App.Models;
using BethanysPieShopHRM.Shared.Domain;
using Microsoft.AspNetCore.Components;

namespace BethanysPieShopHRM.App.Pages
{
    public partial class EmployeeDetail
    {
        [Parameter]
        public string EmployeeId { get; set; }

        public Employee? Employee { get; set; } = new Employee();

        private string Title = "Employee Detail";

        protected override Task OnInitializedAsync()
        {
            Employee = MockDataService.Employees.FirstOrDefault(e => e.EmployeeId == int.Parse(EmployeeId));
            Title = Employee == null ? "Employee Detail" : $"Employee Detail: {Employee.FirstName} {Employee.LastName}";
            return base.OnInitializedAsync();
        }
    }
}
