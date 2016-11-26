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
    public class CancionsController : Controller
    {
        private parcial4Entities db = new parcial4Entities();
        public ActionResult ListaDiscos()
        {

            return RedirectToAction("Index", "Discoes");
        }
        // GET: Cancions
        public ActionResult Index(int id)
        {
            Disco discos = db.Disco.Find(id);
            ViewBag.al = discos.dis_alb;
            ViewBag.cod = discos.dis_id;
     
            var cancion = db.Cancion.Include(c => c.Disco);
            return View(cancion.Where(e => e.dis_id == id).ToList());
        }

        // GET: Cancions/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Cancion cancion = db.Cancion.Find(id);
            if (cancion == null)
            {
                return HttpNotFound();
            }
            return View(cancion);
        }

        // GET: Cancions/Create
        public ActionResult Create()
        {
            ViewBag.dis_id = new SelectList(db.Disco, "dis_id", "dis_alb");
            return View();
        }

        // POST: Cancions/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "can_id,can_nom,can_dur,dis_id")] Cancion cancion)
        {
            if (ModelState.IsValid)
            {
                db.Cancion.Add(cancion);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.dis_id = new SelectList(db.Disco, "dis_id", "dis_alb", cancion.dis_id);
            return View(cancion);
        }

        // GET: Cancions/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Cancion cancion = db.Cancion.Find(id);
            if (cancion == null)
            {
                return HttpNotFound();
            }
            ViewBag.dis_id = new SelectList(db.Disco, "dis_id", "dis_alb", cancion.dis_id);
            return View(cancion);
        }

        // POST: Cancions/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "can_id,can_nom,can_dur,dis_id")] Cancion cancion)
        {
            if (ModelState.IsValid)
            {
                db.Entry(cancion).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.dis_id = new SelectList(db.Disco, "dis_id", "dis_alb", cancion.dis_id);
            return View(cancion);
        }

        // GET: Cancions/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Cancion cancion = db.Cancion.Find(id);
            if (cancion == null)
            {
                return HttpNotFound();
            }
            return View(cancion);
        }

        // POST: Cancions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Cancion cancion = db.Cancion.Find(id);
            db.Cancion.Remove(cancion);
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
