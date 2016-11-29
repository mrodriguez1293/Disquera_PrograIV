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
    public class DiscoesController : Controller
    {
        private parcial4Entities db = new parcial4Entities();
        public ActionResult lista_discos2(int id)
        {
            Genero gen = db.Genero.Find(id);
            ViewBag.genero = gen.gen_nom;
            ViewBag.rut = HttpContext.Session["Rut"].ToString();
            var disco = db.Disco.Include(d => d.Autor).Include(d => d.Genero);
            return View(disco.Where(e => e.gen_id == id).ToList());
        }
        public ActionResult lista_discos1(int id) {
            Autor aut = db.Autor.Find(id);
            ViewBag.autor = aut.aut_nom;
            ViewBag.autor_ape = aut.aut_ape;
            ViewBag.rut = HttpContext.Session["Rut"].ToString();
            var disco = db.Disco.Include(d => d.Autor).Include(d => d.Genero);
            return View(disco.Where(e => e.aut_id == id).ToList());
        }

        public ActionResult canciones(int? id)
        {

            return RedirectToAction("Index", "Cancions", new { id = id });

        }
 
       
        // GET: Discoes
        public ActionResult Index()
        {
            ViewBag.rut = HttpContext.Session["Rut"].ToString();
            var disco = db.Disco.Include(d => d.Autor).Include(d => d.Genero);
            return View(disco.ToList());
        }

        // GET: Discoes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Disco disco = db.Disco.Find(id);
            if (disco == null)
            {
                return HttpNotFound();
            }
            return View(disco);
        }

        // GET: Discoes/Create
        public ActionResult Create()
        {
            ViewBag.aut_id = new SelectList(db.Autor, "aut_id", "aut_nom");
            ViewBag.gen_id = new SelectList(db.Genero, "gen_id", "gen_nom");
            return View();
        }

        // POST: Discoes/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "dis_id,dis_alb,dis_val,gen_id,aut_id")] Disco disco)
        {
            if (ModelState.IsValid)
            {
                db.Disco.Add(disco);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.aut_id = new SelectList(db.Autor, "aut_id", "aut_nom", disco.aut_id);
            ViewBag.gen_id = new SelectList(db.Genero, "gen_id", "gen_nom", disco.gen_id);
            return View(disco);
        }

        // GET: Discoes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Disco disco = db.Disco.Find(id);
            if (disco == null)
            {
                return HttpNotFound();
            }
            ViewBag.aut_id = new SelectList(db.Autor, "aut_id", "aut_nom", disco.aut_id);
            ViewBag.gen_id = new SelectList(db.Genero, "gen_id", "gen_nom", disco.gen_id);
            return View(disco);
        }

        // POST: Discoes/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "dis_id,dis_alb,dis_val,gen_id,aut_id")] Disco disco)
        {
            if (ModelState.IsValid)
            {
                db.Entry(disco).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.aut_id = new SelectList(db.Autor, "aut_id", "aut_nom", disco.aut_id);
            ViewBag.gen_id = new SelectList(db.Genero, "gen_id", "gen_nom", disco.gen_id);
            return View(disco);
        }

        // GET: Discoes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Disco disco = db.Disco.Find(id);
            if (disco == null)
            {
                return HttpNotFound();
            }
            return View(disco);
        }

        // POST: Discoes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Disco disco = db.Disco.Find(id);
            db.Disco.Remove(disco);
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
