using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sale_Management
{
    public partial class Products : System.Web.UI.Page
    {
        DataClassesDataContext db = new DataClassesDataContext();
        public static int IdProduct { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetProducts();
                BindDropDownCategories();
                HideUpdateControls();
            }
        }

        private void GetProducts()
        {
            var product = (from p in db.Produits
                           join c in db.Categories
                           on p.Id_categorie equals c.Id_categorie 
                           select new
                           {
                               p.Id_Produit,
                               p.Libelle,
                               p.Description,
                               p.Prix,
                               Categories = c.Libelle
                           } ) ;
            
            
            list_products.DataSource = product;
            list_products.DataBind();
        }

        private void EmptyControl()
        {
            txt_libelle.Text = "";
            txt_description.Text = "";
            txt_prix.Text = "";

        }
        private void HideUpdateControls()
        {
            btn_submit.Visible = false;
            btn_reset.Visible = false;
            btn_insert.Visible = true;
            EmptyControl();

        }
        private void ShowUpdateControls()
        {
            btn_submit.Visible = true;
            btn_reset.Visible = true;
            btn_insert.Visible = false;
        }

        private void BindDropDownCategories ()
        {
            var categories = from c in db.Categories select c;
            list_categories.DataSource = db.Categories.ToList();
            list_categories.DataTextField = "Libelle";
            list_categories.DataValueField = "Id_Categorie";
            list_categories.DataBind();
        }

        protected void btn_insert_Click(object sender, EventArgs e)
        {

            try
            {
                string libelle = txt_libelle.Text;
                string description = txt_description.Text;
                int idCategorie = Convert.ToInt32(list_categories.SelectedItem.Value);
                float prix = Convert.ToSingle(txt_prix.Text);
                
                Produit product = new Produit()
                {
                    Libelle = libelle,
                    Description = description,
                    Prix = prix,
                    Id_categorie = idCategorie

                };

                db.Produits.InsertOnSubmit(product);
                db.SubmitChanges();
                EmptyControl();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully Inserted');", true);
                GetProducts();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('" + ex.Message.ToString() + "');", true);
            }
        }

        protected void LinkButtonDelete_Click(object sender, EventArgs e)
        {
            var rowIndex = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            var IdProduct = Convert.ToInt32(list_products.Rows[rowIndex].Cells[1].Text);
            System.Diagnostics.Debug.WriteLine(IdProduct);
            DeleteProduct(IdProduct);

        }

        private void DeleteProduct(int Id_Product)
        {

            try
            {
                var ProductDelete = (from p in db.Produits where p.Id_Produit == Id_Product select p).First();
                db.Produits.DeleteOnSubmit(ProductDelete);
                db.SubmitChanges();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully Deleted');", true);
                GetProducts();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('" + ex.Message.ToString() + "');", true);
            }


        }


        protected void LinkButtonEdit_Click(object sender, EventArgs e)
        {

            var rowIndex = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            var Id = Convert.ToInt32(list_products.Rows[rowIndex].Cells[1].Text);
            IdProduct = Id;

            EditCategorie(Id);
            ShowUpdateControls();


        }

        private void EditCategorie(int Id_Product)
        {
            var productEdit = (from p in db.Produits where p.Id_Produit == Id_Product select p).First();
            var libelle = productEdit.Libelle;
            var description = productEdit.Description;
            var prix = productEdit.Prix;
            var categorie = productEdit.Id_categorie;
            txt_libelle.Text = libelle.ToString();
            txt_description.Text = description.ToString();
            txt_prix.Text = prix.ToString();
            list_categories.SelectedValue = categorie.ToString();

        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine(IdProduct);

            try
            {
                string libelle = txt_libelle.Text;
                string description = txt_description.Text;
                float prix = Convert.ToSingle(txt_prix.Text);
                int Idcategorie = Convert.ToInt32(list_categories.SelectedItem.Value);

                var productUpdate = (from p in db.Produits where p.Id_Produit == IdProduct select p).First();
                productUpdate.Libelle = libelle;
                productUpdate.Description = description;
                productUpdate.Prix = prix;
                productUpdate.Id_categorie = Idcategorie;
                db.SubmitChanges();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully Updated');", true);
                GetProducts();
                HideUpdateControls();
                EmptyControl();
                
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('" + ex.Message.ToString() + "');", true);

            }
        }

        protected void btn_cancel_Click(object sender, EventArgs e)
        {
            HideUpdateControls();
        }
    }
}