using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Disquera_PrograIV.Models;

namespace Disquera_PrograIV.Controllers
{
    public class DiscoVentasController : Controller
    {
        private parcial4Entities db = new parcial4Entities();
   
        // GET: DiscoVentas
        public ActionResult Index(int id)
        {
            var discoVenta = db.DiscoVenta.Include(d => d.Disco).Include(d => d.Venta);
            return View(discoVenta.Where(e => e.ven_id == id).ToList());
        }

        // GET: DiscoVentas/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DiscoVenta discoVenta = db.DiscoVenta.Find(id);
            if (discoVenta == null)
            {
                return HttpNotFound();
            }
            return View(discoVenta);
        }

        // GET: DiscoVentas/Create
        public ActionResult Create()
        {
            ViewBag.dis_id = new SelectList(db.Disco, "dis_id", "dis_alb");
            ViewBag.ven_id = new SelectList(db.Venta, "ven_id", "usu_rut_eje");
            return View();
        }

        // POST: DiscoVentas/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "dis_id,ven_id,dive_can")] DiscoVenta discoVenta)
        {
            if (ModelState.IsValid)
            {
                db.DiscoVenta.Add(discoVenta);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.dis_id = new SelectList(db.Disco, "dis_id", "dis_alb", discoVenta.dis_id);
            ViewBag.ven_id = new SelectList(db.Venta, "ven_id", "usu_rut_eje", discoVenta.ven_id);
            return View(discoVenta);
        }

        // GET: DiscoVentas/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DiscoVenta discoVenta = db.DiscoVenta.Find(id);
            if (discoVenta == null)
            {
                return HttpNotFound();
            }
            ViewBag.dis_id = new SelectList(db.Disco, "dis_id", "dis_alb", discoVenta.dis_id);
            ViewBag.ven_id = new SelectList(db.Venta, "ven_id", "usu_rut_eje", discoVenta.ven_id);
            return View(discoVenta);
        }

        // POST: DiscoVentas/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "dis_id,ven_id,dive_can")] DiscoVenta discoVenta)
        {
            if (ModelState.IsValid)
            {
                db.Entry(discoVenta).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.dis_id = new SelectList(db.Disco, "dis_id", "dis_alb", discoVenta.dis_id);
            ViewBag.ven_id = new SelectList(db.Venta, "ven_id", "usu_rut_eje", discoVenta.ven_id);
            return View(discoVenta);
        }

        // GET: DiscoVentas/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DiscoVenta discoVenta = db.DiscoVenta.Find(id);
            if (discoVenta == null)
            {
                return HttpNotFound();
            }
            return View(discoVenta);
        }

        // POST: DiscoVentas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            DiscoVenta discoVenta = db.DiscoVenta.Find(id);
            db.DiscoVenta.Remove(discoVenta);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
