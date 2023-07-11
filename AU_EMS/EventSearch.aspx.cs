using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace AU_EMS
{
    public partial class EventSearch : System.Web.UI.Page
    {
        public string ConnectionString = ConfigurationManager.ConnectionStrings["dbs_cnstr"].ConnectionString;
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(ConnectionString);
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (txtEntryNumber.Text == "")
            {
                gvSearchResults.DataSource = null;
                gvSearchResults.DataBind();
                lblOutput.Text = "<span class='text-danger'>Error: Invalid Registration Number!</span>";
                return;
            }
            else
            {
                string entryNo = txtEntryNumber.Text;
                string query = string.Format("SELECT DISTINCT Entry_No, UniqueID, Event_Name, Category_Name, Name, Gender, EmailID, MobileNo, City, State, Status_ID FROM Event_Registration LEFT JOIN Event_Category ON Event_Registration.Event_ID = Event_Category.Event_ID LEFT JOIN Event_Master ON Event_Registration.Event_ID = Event_Master.Event_ID WHERE Event_Category.Category_ID = Event_Registration.Category_ID AND Entry_No = '{0}'", entryNo);
                SqlDataAdapter adpt = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                adpt.Fill(dt);
                if(dt.Rows.Count <= 0)
                {
                    gvSearchResults.DataSource = null;
                    gvSearchResults.DataBind();
                    lblOutput.Text = "<span class='text-danger'>Error: Invalid Registration Number!</span>";
                    return;
                }
                lblOutput.Text = string.Empty;
                gvSearchResults.DataSource = dt;
                gvSearchResults.DataBind();
            }
        }
    }
}