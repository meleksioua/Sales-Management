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
            HideAddControls();

        }

        private void HideAddControls()
        {
            
            txt_name.Visible = false;
            lib_name.Visible = false;
            btn_save.Visible = false;
            btn_cancel.Visible = false;
        }
        private void ShowAddControls()
        {
            txt_name.Visible = true;
            lib_name.Visible = true;
            btn_save.Visible = true;
            btn_cancel.Visible = true;
        }

        protected void Add_Click(object sender, EventArgs e)
        {
            ShowAddControls();

        }



        protected void Delete_Click(object sender, EventArgs e)
        {

        }

        protected void Save_Click(object sender, EventArgs e)
        {

        }

        protected void Cancel_Click(object sender, EventArgs e)
        {

        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void chk_CheckedChange(object sender, EventArgs e)
        {

            var rowIndex = ((GridView)(sender as Control).NamingContainer).SelectedRow;
            Console.WriteLine(rowIndex.ToString());
        }

    }
}