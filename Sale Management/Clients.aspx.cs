using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sale_Management
{
    public partial class Client1 : System.Web.UI.Page
    {
        DataClassesDataContext db = new DataClassesDataContext();
        public static int IdClient { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetClients();
                HideUpdateControls();


            }
        }

        private void GetClients()
        {
            var client = from c in db.Clients select c;
            list_clients.DataSource = client;
            list_clients.DataBind();
        }

        private void EmptyControl()
        {
            txt_firstName.Text = "";
            txt_lastName.Text = "";
            txt_age.Text = "";

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

        protected void btn_insert_Click(object sender, EventArgs e)
        {
            try
            {
                string firstName = txt_firstName.Text;
                string lastName = txt_lastName.Text;
                string gender = RadioButtonList1.SelectedValue.ToString();
                int age = Convert.ToInt32(txt_age.Text);

                Client client = new Client()
                {
                    Nom = lastName,
                    Prenom = firstName,
                    Sexe = gender,
                    Age = age

                };

                db.Clients.InsertOnSubmit(client);
                db.SubmitChanges();
                EmptyControl();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully Inserted');", true);
                GetClients();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('" + ex.Message.ToString() + "');", true);
            }


        }

        protected void LinkButtonDelete_Click(object sender, EventArgs e)
        {
            var rowIndex = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            var IdClient = Convert.ToInt32(list_clients.Rows[rowIndex].Cells[1].Text);
            System.Diagnostics.Debug.WriteLine(IdClient);
            DeleteClient(IdClient);


        }

        private void DeleteClient(int Id_Client)
        {

            try
            {
                var ClientDelete = (from c in db.Clients where c.Id_Client == Id_Client select c).First();
                db.Clients.DeleteOnSubmit(ClientDelete);
                db.SubmitChanges();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully Deleted');", true);
                GetClients();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('" + ex.Message.ToString() + "');", true);
            }


        }

        protected void LinkButtonEdit_Click(object sender, EventArgs e)
        {
            var rowIndex = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            var Id = Convert.ToInt32(list_clients.Rows[rowIndex].Cells[1].Text);
            IdClient = Id;

            EditClient(Id);
            ShowUpdateControls();

        }

        private void EditClient(int Id_Client)
        {
            var ClientEdit = (from c in db.Clients where c.Id_Client == Id_Client select c).First();

            var firstName = ClientEdit.Nom;
            var lastName = ClientEdit.Prenom;
            var gender = ClientEdit.Sexe;
            var age = ClientEdit.Age;

            txt_firstName.Text = firstName.ToString();
            txt_lastName.Text = lastName.ToString();
            txt_age.Text = age.ToString();
            RadioButtonList1.SelectedValue = gender.ToString();


        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            try
            {
                string firstName = txt_firstName.Text;
                string lastName = txt_lastName.Text;
                string gender = RadioButtonList1.SelectedValue.ToString();
                int age = Convert.ToInt32(txt_age.Text);

                var clientUpdate = (from c in db.Clients where c.Id_Client == IdClient select c).First();
                clientUpdate.Nom = lastName;
                clientUpdate.Prenom = firstName;
                clientUpdate.Sexe = gender;
                clientUpdate.Age = age;
                db.SubmitChanges();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully Updated');", true);
                GetClients();
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