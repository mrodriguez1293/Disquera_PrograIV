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
    public class VentasController : Controller
    {
        private parcial4Entities db = new parcial4Entities();

        public ActionResult venta_eje(int id)
        {
            return RedirectToAction("Index", "DiscoVentas", new { id = id });
        }
        public ActionResult yo_compro()
        {
            var venta = db.Venta.Include(v => v.Usuario).Include(v => v.Usuario1);
            //leer la variable session qe contiene rut
            string rut = HttpContext.Session["Rut"].ToString();
            return View(venta.Where(e => e.usu_rut_cli == rut).ToList());
        }

        public ActionResult autorizar_rechazar([Bind(Include = "ven_id,ven_date,ven_autorizada,ven_tot,usu_rut_eje,usu_rut_cli")] Venta venta)
        {
            if (ModelState.IsValid)
            {
                db.Entry(venta).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
                //return View("Index");
            }
            ViewBag.usu_rut_cli = new SelectList(db.Usuario, "usu_rut", "usu_nom", venta.usu_rut_cli);
            ViewBag.usu_rut_eje = new SelectList(db.Usuario, "usu_rut", "usu_nom", venta.usu_rut_eje);
            //return View("Index");
            return RedirectToAction("Index");
        }
        
        // GET: Ventas
        public ActionResult Index()
        {
            var venta = db.Venta.Include(v => v.Usuario).Include(v => v.Usuario1);
            //leer la variable session qe contiene rut
            string rut = HttpContext.Session["Rut"].ToString();
            ViewBag.rut = rut;
            //Si el usuario es Cliente, listamos solo sus comrpras
            if (Request.IsAuthenticated && User.IsInRole("Cliente"))
            {
                return View(venta.Where(e => e.usu_rut_eje == rut).ToList());
            }

            return View(venta.ToList());
        }

        // GET: Ventas/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Venta venta = db.Venta.Find(id);
            if (venta == null)
            {
                return HttpNotFound();
            }
            return View(venta);
        }

        // GET: Ventas/Create
        public ActionResult Create()
        {
            ViewBag.usu_rut_cli = new SelectList(db.Usuario, "usu_rut", "usu_nom");
            ViewBag.usu_rut_eje = new SelectList(db.Usuario, "usu_rut", "usu_nom");
            return View();
        }

        // POST: Ventas/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ven_id,ven_date,ven_autorizada,ven_tot,usu_rut_eje,usu_rut_cli")] Venta venta)
        {
            if (ModelState.IsValid)
            {
                db.Venta.Add(venta);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.usu_rut_cli = new SelectList(db.Usuario, "usu_rut", "usu_nom", venta.usu_rut_cli);
            ViewBag.usu_rut_eje = new SelectList(db.Usuario, "usu_rut", "usu_nom", venta.usu_rut_eje);
            return View(venta);
        }

        // GET: Ventas/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Venta venta = db.Venta.Find(id);
            if (venta == null)
            {
                return HttpNotFound();
            }
            ViewBag.usu_rut_cli = new SelectList(db.Usuario, "usu_rut", "usu_nom", venta.usu_rut_cli);
            ViewBag.usu_rut_eje = new SelectList(db.Usuario, "usu_rut", "usu_nom", venta.usu_rut_eje);
            return View(venta);
        }

        // POST: Ventas/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ven_id,ven_date,ven_autorizada,ven_tot,usu_rut_eje,usu_rut_cli")] Venta venta)
        {
            if (ModelState.IsValid)
            {
                db.Entry(venta).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.usu_rut_cli = new SelectList(db.Usuario, "usu_rut", "usu_nom", venta.usu_rut_cli);
            ViewBag.usu_rut_eje = new SelectList(db.Usuario, "usu_rut", "usu_nom", venta.usu_rut_eje);
            return View(venta);
        }

        // GET: Ventas/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Venta venta = db.Venta.Find(id);
            if (venta == null)
            {
                return HttpNotFound();
            }
            return View(venta);
        }

        // POST: Ventas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Venta venta = db.Venta.Find(id);
            db.Venta.Remove(venta);
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
