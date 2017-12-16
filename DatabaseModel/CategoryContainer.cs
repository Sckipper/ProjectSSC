﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace DatabaseModel
{
    public class CategoryContainer
    {
        public static List<Category> GetCategories()
        {
            return new ShopAppEntities().Categorie.OrderBy(el => el.Nume).Select(el => new Category()
            {
                ID = el.ID,
                CategorieID = el.CategorieID,
                Nume = el.Nume,
                Cod = el.Cod,
                Descriere = el.Descriere,
                Imagine = el.Imagine
            }).ToList();
        }

        public static List<Category> GetSupperiorCategories()
        {
            return new ShopAppEntities().Categorie.OrderBy(el => el.Nume)
                .Where(el => el.CategorieID == null)
                .Select(el => new Category()
                {
                    ID = el.ID,
                    CategorieID = el.CategorieID,
                    Nume = el.Nume,
                    Cod = el.Cod,
                    Descriere = el.Descriere,
                    Imagine = el.Imagine
                }).ToList();
        }

        public static int getNrOfCategories()
        {
            return new ShopAppEntities().Categorie.Count();
        }

        public static bool ValidateCode(string code)
        {
            int id = 0, id2 = -1, id3 = 0;
            if (code.Contains("-"))
            {
                var ids = code.Split('-');
                if(ids.Length == 3)
                {
                    Int32.TryParse(ids[0], out id);
                    Int32.TryParse(ids[1], out id2);
                    Int32.TryParse(ids[2], out id3);
                }
            }else Int32.TryParse(code, out id);
           
            if (id != 0 && id2 <= id3)
                return new ShopAppEntities().Categorie.Where(el => el.ID == id).Count() > 0;

            return false;
        }

        public static int getNrOfPrimaryCategories()
        {
            return new ShopAppEntities().Categorie.Where(el => el.CategorieID == null).Count();
        }

        public static Category getCategoryById(int id)
        {
            using (var db = new ShopAppEntities())
            {
                Categorie cat = db.Categorie.FirstOrDefault(el => el.ID == id);
                return new Category()
                {
                    ID = cat.ID,
                    CategorieID = cat.CategorieID,
                    Nume = cat.Nume,
                    Cod = cat.Cod,
                    Descriere = cat.Descriere,
                    Imagine = cat.Imagine
                };
            }
        }

        public static void SaveCategory(Category category)
        {
            if (category == null)
                throw new ArgumentNullException("Category");
            try
            {
                using (var db = new ShopAppEntities())
                {
                    Categorie categ = db.Categorie.FirstOrDefault(el => el.ID == category.ID);
                    if (categ == null)
                    {
                        categ = new Categorie();
                        db.Categorie.Add(categ);
                    }

                    if (db.Categorie.FirstOrDefault(el => el.ID == category.CategorieID) != null)
                    {
                        categ.CategorieID = category.CategorieID;
                        categ.Nume = category.Nume;
                        categ.Cod = category.Cod;
                        categ.Descriere = category.Descriere;
                        categ.Imagine = category.Imagine;

                        db.SaveChanges();
                    }

                }
            }
            catch (Exception ex)
            {

            }
        }

        public static void DeleteCategory(int id, string path)
        {
            using (var db = new ShopAppEntities())
            {
                Categorie categ = db.Categorie.FirstOrDefault(el => el.ID == id);
                if (categ != null)
                {
                    string fullPath = Path.Combine(path, categ.Imagine + ".png");
                    if (File.Exists(fullPath))
                        File.Delete(fullPath);

                    db.Categorie.Remove(categ);
                    db.SaveChanges();
                }
            }
        }

    }
}
