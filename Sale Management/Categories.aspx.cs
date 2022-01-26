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
        public static int IdCategorie { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetCategories();
                HideUpdateControls();
            }
            

        }
        DataClassesDataContext db = new DataClassesDataContext();

        private void HideUpdateControls()
        {
            btn_submit.Visible = false;
            btn_reset.Visible = false;
            btn_insert.Visible = true;
            txt_libelle.Text = "";

        }
        private void ShowUpdateControls()
        {
            btn_submit.Visible = true;
            btn_reset.Visible = true;
            btn_insert.Visible = false;
        }
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

        private void DeleteCategorie(int Id_Categorie)
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

        protected void LinkButtonEdit_Click(object sender, EventArgs e)
        {

            var rowIndex = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            var Id = Convert.ToInt32(list_categories.Rows[rowIndex].Cells[1].Text);
            IdCategorie = Id;
           
            EditCategorie(Id);
            ShowUpdateControls();


        }

        private void EditCategorie(int Id_Categorie)
        {
            var categorieEdit = (from c in db.Categories where c.Id_categorie == Id_Categorie select c).First();
            var libelle = categorieEdit.Libelle;
            txt_libelle.Text = libelle.ToString();
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine(IdCategorie);

            try
            {
                string libelle = txt_libelle.Text;
                var categorieUpdate = (from c in db.Categories where c.Id_categorie == IdCategorie select c).First();
                categorieUpdate.Libelle = libelle;
                db.SubmitChanges();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully Updated');", true);
                GetCategories();
                HideUpdateControls();
                txt_libelle.Text = "";
                btn_insert.Enabled = true;
            }
            catch (Exception ex) {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('" + ex.Message.ToString() + "');", true);

            }

        }

        protected void btn_cancel_Click(object sender, EventArgs e)
        {
           
            HideUpdateControls();
        }
    }
}