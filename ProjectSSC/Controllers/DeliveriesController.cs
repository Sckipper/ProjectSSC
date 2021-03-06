﻿using System;
using System.Web.Mvc;
using DatabaseModel;
using System.Net;
using System.Linq;
using ProjectSSC.Models;

namespace ProjectSSC.Controllers
{
    [Authorize]
    public class DeliveriesController : Controller
    {
        private static string[] ValidStatus = new string[] { "Initiata", "Procesare", "Livrata", "Refuzata" };

        private static bool validateStatus(int role, string status)
        {
            if (role != 3 && status.Equals("Refuzata"))
                return false;

            if (ValidStatus.Any(status.Contains))
                return true;

            return false;
        }

        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (SessionAccessor.LoggedUser == null)
            {
                filterContext.Result = RedirectToAction("Login", "Home");
                return;
            }

            if ((int)Session["role"] < 2 && (int)Session["role"] != 0)
            {
                filterContext.Result = RedirectToAction("Home", "Home");
                return;
            }
        }

        // GET: Deliveries
        [Authorize]
        public ActionResult Index()
        {
            var markets = MarketContainer.GetMarkets();
            var suppliers = SupplierContainer.GetSuppliers();
            var delivery = DeliveryContainer.GetDeliveries();

            foreach (var del in delivery)
            {
                del.SupplierName = suppliers.FirstOrDefault(x => x.ID == del.FurnizorID).Nume;
                del.MarketName = markets.FirstOrDefault(x => x.ID == del.MagazinID).Denumire;
            }

            return View(delivery);
        }

        // GET: Deliveries/Create
        [Authorize]
        public ActionResult Create()
        {
            var model = new DeliveryModel();
            model.Markets = MarketContainer.GetMarkets();
            model.Suppliers = SupplierContainer.GetSuppliers();

            return View(model);
        }

        // POST: Deliveries/Create
        [HttpPost]
        [Authorize]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Delivery delivery)
        {
            if (ModelState.IsValid)
            {
                delivery.Status = delivery.Status != null ? delivery.Status : "Initiata";
                delivery.DataSolicitare = DateTime.Now;
                DeliveryContainer.SaveDelivery(delivery);
                return RedirectToAction("Index");
            }
            var model = new DeliveryModel();
            model.Delivery = delivery;
            model.Suppliers = SupplierContainer.GetSuppliers();
            model.Markets = MarketContainer.GetMarkets();
            return View(model);
        }

        // POST: Deliveries/Edit
        [HttpPost]
        [Authorize]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Delivery delivery)
        {
            if (ModelState.IsValid && DeliveriesController.validateStatus((int)Session["role"], delivery.Status))
            {
                DeliveryContainer.SaveDelivery(delivery);
                return RedirectToAction("Index");
            }

            var model = new DeliveryModel();
            model.Delivery = delivery;
            model.Suppliers = SupplierContainer.GetSuppliers();
            model.Markets = MarketContainer.GetMarkets();
            return View(model);
        }


        // GET: Deliveries/Edit/5
        [Authorize]
        public ActionResult Edit(int? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            var model = new DeliveryModel();
            model.Delivery = DeliveryContainer.getDeliveryById((int)id);
            if ((int)Session["role"] != 3)
                model.Statuses.Remove("Refuzata");
            model.Markets = MarketContainer.GetMarkets();
            model.Suppliers = SupplierContainer.GetSuppliers();

            return View(model);
        }

        // GET: Deliveries/Delete/5
        [Authorize]
        public ActionResult Delete(int id)
        {
            if (id < 1)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            if((int)Session["role"] > 0)
                DeliveryContainer.DeleteDelivery(id);

            return RedirectToAction("Index");
        }
    }
}