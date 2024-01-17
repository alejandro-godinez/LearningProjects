﻿using BethanysPieShopHRM.App.Models;
using BethanysPieShopHRM.App.Services;
using BethanysPieShopHRM.Shared.Domain;
using BethanysPieShopHRM.Shared.Model;
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

        public List<Marker> MapMarkers { get; set; } = new List<Marker>();

        private string Title = "Employee Detail";

        protected async override Task OnInitializedAsync()
        {
            //Title = (EmployeeId == null) ? "Employee Detail" : $"Employee Detail: {Employee.EmployeeId}";

            Employee = await EmployeeDataService.GetEmployeeDetails(int.Parse(EmployeeId));
            //Title = Employee == null ? "Employee Detail" : $"Employee Detail: {Employee.FirstName} {Employee.LastName}";

            if (Employee.Longitude.HasValue && Employee.Latitude.HasValue)
            {
                MapMarkers = new List<Marker>
                {
                    new Marker{Description = $"{Employee.FirstName} {Employee.LastName}", 
                        ShowPopup = false, 
                        X = Employee.Longitude.Value, 
                        Y = Employee.Latitude.Value},
                };
            }
            
        }
    }
}
