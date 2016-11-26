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
    public class CarroesController : Controller
    {
        private parcial4Entities db = new parcial4Entities();

        // GET: Carroes
        public ActionResult Index()
        {
            var carro = db.Carro.Include(c => c.Disco).Include(c => c.Usuario);
            return View(carro.ToList());
        }

        public int getItemsCarro()
        {
            //Leer la variable de session que contiene el Rut
            string usu_rut = HttpContext.Session["Rut"].ToString();

            var carro = db.Carro.Include(c => c.Disco).Include(c => c.Usuario);
            return carro.ToList().Where(c => c.usu_rut == usu_rut).ToList().Count;
        }

        public ActionResult getMiniCarro()
        {
            //Leer la variable de session que contiene el Rut
            string usu_rut = HttpContext.Session["Rut"].ToString();

            var carro = db.Carro.Include(c => c.Disco).Include(c => c.Usuario);
            return View(carro.ToList().Where(c => c.usu_rut == usu_rut).ToList());
        }

        // GET: Carroes/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Carro carro = db.Carro.Find(id);
            if (carro == null)
            {
                return HttpNotFound();
            }
            return View(carro);
        }

        // GET: Carroes/Create
        public ActionResult Create()
        {
            ViewBag.dis_id = new SelectList(db.Disco, "dis_id", "dis_alb");
            ViewBag.usu_rut = new SelectList(db.Usuario, "usu_rut", "usu_nom");
            return View();
        }

        // POST: Carroes/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "usu_rut,dis_id,car_can")] Carro carro)
        {
            if (ModelState.IsValid)
            {
                db.Carro.Add(carro);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.dis_id = new SelectList(db.Disco, "dis_id", "dis_alb", carro.dis_id);
            ViewBag.usu_rut = new SelectList(db.Usuario, "usu_rut", "usu_nom", carro.usu_rut);
            return View(carro);
        }

        // GET: Carroes/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Carro carro = db.Carro.Find(id);
            if (carro == null)
            {
                return HttpNotFound();
            }
            ViewBag.dis_id = new SelectList(db.Disco, "dis_id", "dis_alb", carro.dis_id);
            ViewBag.usu_rut = new SelectList(db.Usuario, "usu_rut", "usu_nom", carro.usu_rut);
            return View(carro);
        }

        // POST: Carroes/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "usu_rut,dis_id,car_can")] Carro carro)
        {
            if (ModelState.IsValid)
            {
                db.Entry(carro).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.dis_id = new SelectList(db.Disco, "dis_id", "dis_alb", carro.dis_id);
            ViewBag.usu_rut = new SelectList(db.Usuario, "usu_rut", "usu_nom", carro.usu_rut);
            return View(carro);
        }

        // GET: Carroes/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Carro carro = db.Carro.Find(id);
            if (carro == null)
            {
                return HttpNotFound();
            }
            return View(carro);
        }

        // POST: Carroes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Carro carro = db.Carro.Find(id);
            db.Carro.Remove(carro);
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
