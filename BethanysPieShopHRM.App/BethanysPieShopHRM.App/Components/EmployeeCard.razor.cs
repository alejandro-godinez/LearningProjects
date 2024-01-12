using BethanysPieShopHRM.Shared.Domain;
using Microsoft.AspNetCore.Components;
using System.Security.Cryptography.X509Certificates;

namespace BethanysPieShopHRM.App.Components
{
    public partial class EmployeeCard
    {
        [Parameter]
        public Employee Employee { get; set; } = default!;

        [Parameter]
        public EventCallback<Employee> EmployeeQuickViewClicked { get; set; }
    }
}
