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
    public class AutorsController : Controller
    {
        private parcial4Entities db = new parcial4Entities();
        public ActionResult dis_autor(int? id) {
            return RedirectToAction("lista_discos1", "Discoes", new { id = id });
        }
        // GET: Autors
        public ActionResult Index()
        {
            var autor = db.Autor.Include(a => a.Nacionalidad);
            return View(autor.ToList());
        }

        // GET: Autors/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Autor autor = db.Autor.Find(id);
            if (autor == null)
            {
                return HttpNotFound();
            }
            return View(autor);
        }

        // GET: Autors/Create
        public ActionResult Create()
        {
            ViewBag.nac_id = new SelectList(db.Nacionalidad, "nac_id", "nac_nom");
            return View();
        }

        // POST: Autors/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "aut_id,aut_nom,aut_ape,nac_id")] Autor autor)
        {
            if (ModelState.IsValid)
            {
                db.Autor.Add(autor);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.nac_id = new SelectList(db.Nacionalidad, "nac_id", "nac_nom", autor.nac_id);
            return View(autor);
        }

        // GET: Autors/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Autor autor = db.Autor.Find(id);
            if (autor == null)
            {
                return HttpNotFound();
            }
            ViewBag.nac_id = new SelectList(db.Nacionalidad, "nac_id", "nac_nom", autor.nac_id);
            return View(autor);
        }

        // POST: Autors/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "aut_id,aut_nom,aut_ape,nac_id")] Autor autor)
        {
            if (ModelState.IsValid)
            {
                db.Entry(autor).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.nac_id = new SelectList(db.Nacionalidad, "nac_id", "nac_nom", autor.nac_id);
            return View(autor);
        }

        // GET: Autors/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Autor autor = db.Autor.Find(id);
            if (autor == null)
            {
                return HttpNotFound();
            }
            return View(autor);
        }

        // POST: Autors/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Autor autor = db.Autor.Find(id);
            db.Autor.Remove(autor);
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
