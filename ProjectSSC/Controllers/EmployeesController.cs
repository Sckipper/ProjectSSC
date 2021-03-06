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

        // GET: Employees
        public ActionResult Index()
        {
            var employees = EmployeeContainer.GetEmployeesByRole((int)Session["role"]);
            var markets = MarketContainer.GetMarkets();
            foreach (var emp in employees)
                emp.MarketName = markets.FirstOrDefault(x => x.ID == emp.MagazinID).Denumire;

            return View(employees);
        }

        // GET: Employees/Create
        public ActionResult Create()
        {
            var model = new EmployeeModel();
            model.Markets = MarketContainer.GetMarkets();

            return View(model);
        }

        // POST: Employees/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Employee employee)
        {
            if (ModelState.IsValid)
            {
                if((int)Session["role"] > SessionAccessor.getUserRole(employee.Functie))
                {
                    EmployeeContainer.SaveEmployee(employee);
                    return RedirectToAction("Index");
                }
            }
            var model = new EmployeeModel();
            model.Employee = employee;
            model.Markets = MarketContainer.GetMarkets();

            return View(model);
        }

        // POST: Employees/Edit
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Employee employee)
        {
            if (ModelState.IsValid)
            {
                if((int)Session["role"] >= SessionAccessor.getUserRole(employee.Functie))
                {
                    EmployeeContainer.SaveEmployee(employee);
                    return RedirectToAction("Index");
                }
            }

            var model = new EmployeeModel();
            model.Employee = employee;
            model.Markets = MarketContainer.GetMarkets();

            return View(model);
        }


        // GET: Employees/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            var model = new EmployeeModel();
            model.Employee = EmployeeContainer.getEmployeeById((int) id);
            model.Markets = MarketContainer.GetMarkets();

            return View(model);
        }

        // GET: Employees/Delete/5
        public ActionResult Delete(int id)
        {
            if (id < 1)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            EmployeeContainer.DeleteEmployee(id);

            return RedirectToAction("Index");
        }
    }
}