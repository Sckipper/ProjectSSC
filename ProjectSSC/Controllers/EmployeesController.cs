﻿using System;
using System.Web.Mvc;
using DatabaseModel;
using System.Net;
using System.Linq;
using ProjectSSC.Models;

namespace ProjectSSC.Controllers
{
    [Authorize]
    public class EmployeesController : Controller
    {
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (SessionAccessor.LoggedUser == null)
            {
                filterContext.Result = RedirectToAction("Login", "Home");
                return;
            }

            if ((int)Session["role"] < 2)
            {
                filterContext.Result = RedirectToAction("Home", "Home");
                return;
            }
        }

        // GET: Suppliers
        public ActionResult Index()
        {
            var employees = EmployeeContainer.GetEmployees();
            var markets = MarketContainer.GetMarkets();
            foreach (var emp in employees)
                emp.MarketName = markets.FirstOrDefault(x => x.ID == emp.MagazinID).Denumire;

            return View(employees);
        }

        // GET: Deliveries/Create
        public ActionResult Create()
        {
            var model = new EmployeeModel();
            model.Markets = MarketContainer.GetMarkets();

            return View(model);
        }

        // POST: Deliveries/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Employee employee)
        {
            if (ModelState.IsValid)
            {
                EmployeeContainer.SaveEmployee(employee);
                return RedirectToAction("Index");
            }
            var model = new EmployeeModel();
            model.Employee = employee;
            model.Markets = MarketContainer.GetMarkets();

            return View(model);
        }

        // POST: Deliveries/Edit
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Employee employee)
        {
            if (ModelState.IsValid)
            {
                EmployeeContainer.SaveEmployee(employee);
                return RedirectToAction("Index");
            }

            return View(employee);
        }


        // GET: Deliveries/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            var model = new EmployeeModel();
            model.Employee = EmployeeContainer.getEmployeeById((int) id);
            model.Markets = MarketContainer.GetMarkets();

            return View(model);
        }

        // GET: Deliveries/Delete/5
        public ActionResult Delete(int id)
        {
            if (id < 1)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            EmployeeContainer.DeleteEmployee(id);

            return RedirectToAction("Index");
        }
    }
}