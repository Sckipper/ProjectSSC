using System.Web.Mvc;
using DatabaseModel;
using System.Net;
using ProjectSSC.Models;
using System.Web;
using System.IO;
using System;

namespace ProjectSSC.Controllers
{
    [Authorize]
    public class MarketsController : Controller
    {
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (SessionAccessor.LoggedUser == null)
            {
                filterContext.Result = RedirectToAction("Login", "Home");
                return;
            }

            if ((int)Session["role"] < UserManager.UserRoleToNumber())
            {
                filterContext.Result = RedirectToAction("Home", "Home");
                return;
            }
        }

        // GET: Markets
        public ActionResult Index()
        {
            var markets = MarketContainer.GetMarkets();

            return View(markets);
        }

        // GET: Markets/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Markets/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(HttpPostedFileBase postedFile, Market market)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (postedFile != null && ProductsContainer.validateImage(postedFile.FileName))
                    {
                        var filename = "img_" + market.Denumire.ToLower() + ".png";
                        var path = Path.Combine(Server.MapPath("~/Content/ProductsImages/"), filename);
                        postedFile.SaveAs(path);
                        market.Imagine = "img_" + market.Denumire.ToLower();
                    }

                    MarketContainer.SaveMarket(market);

                    return RedirectToAction("Index");
                }
                var model = new MarketModel();
                model.Market = market;

                return View(model);
            }catch(Exception ex)
            {
                return View();
            }
        }

        // POST: Markets/Edit
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(HttpPostedFileBase postedFile, Market market)
        {
            if (ModelState.IsValid)
            {
                if (postedFile != null)
                {
                    var filename = "img_" + market.Denumire.ToLower() + ".png";
                    var path = Path.Combine(Server.MapPath("~/Content/ProductsImages/"), filename);
                    postedFile.SaveAs(path);
                    market.Imagine = "img_" + market.Denumire.ToLower();
                }

                MarketContainer.SaveMarket(market);
                return RedirectToAction("Index");
            }

            return View(market);
        }


        // GET: Markets/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            var model = new MarketModel();
            model.Market = MarketContainer.getMarketById((int) id);

            return View(model);
        }

        // GET: Markets/Delete/5
        public ActionResult Delete(int id)
        {
            if (id < 1)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            string serverpath = Server.MapPath("~/Content/ProductsImages/");
            MarketContainer.DeleteMatket(id, serverpath);

            return RedirectToAction("Index");
        }
    }
}