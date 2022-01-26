using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sale_Management
{
    public partial class Categories : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetCategories();
            }
            

        }
        DataClassesDataContext db = new DataClassesDataContext();
        protected void btn_insert_Click(object sender, EventArgs e)
        {
            try
            {
                string libelle = txt_libelle.Text;
                Categorie categorie = new Categorie()
                {
                    Libelle = libelle,

                };

                db.Categories.InsertOnSubmit(categorie);
                db.SubmitChanges();
                txt_libelle.Text = "";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully Inserted');", true);
                GetCategories();
            }
            catch (Exception ex) {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('" + ex.Message.ToString() + "');", true);
            }
        }

        private void GetCategories()
        {
            var categorie = from c in db.Categories select c;

            list_categories.DataSource = categorie;
            list_categories.DataBind();
        }

        protected void LinkButtonDelete_Click(object sender, EventArgs e)
        {

            var rowIndex = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            var IdCategorie = Convert.ToInt32(list_categories.Rows[rowIndex].Cells[1].Text);
            System.Diagnostics.Debug.WriteLine(IdCategorie);
            DeleteCategorie(IdCategorie);


        }

        public void DeleteCategorie(int Id_Categorie)
        {

            try
            {
                var categorieDelete = (from c in db.Categories where c.Id_categorie == Id_Categorie select c).First();
                db.Categories.DeleteOnSubmit(categorieDelete);
                db.SubmitChanges();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully Deleted');", true);
                GetCategories();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('" + ex.Message.ToString() + "');", true);
            }


        }
    }
}