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
    public partial class Bhavya_EventCategory : System.Web.UI.Page
    {
        public string ConnectionString = ConfigurationManager.ConnectionStrings["dbs_cnstr"].ConnectionString;
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(ConnectionString);
            if (!IsPostBack)
            {
                ShowData();
                BindDropDown();
            }
        }

        private void BindDropDown()
        {
            SqlDataAdapter adpt = new SqlDataAdapter(@"SELECT Event_ID, Event_Name FROM Event_Master", con);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            ddlEvent.DataSource = dt;
            ddlEvent.DataTextField = "Event_Name";
            ddlEvent.DataValueField = "Event_ID";
            ddlEvent.DataBind();
        }

        private void ShowData()
        {
            SqlDataAdapter adpt = new SqlDataAdapter(@"SELECT Category_ID, Event_Name, Category_Name, Short_Name, Preference, Reg_StartDate, Reg_EndDate, TotalNoOf_Participents FROM Event_Category LEFT JOIN Event_Master ON Event_Category.Event_ID = Event_Master.Event_ID;", con);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            gvEventCategory.DataSource = dt;
            gvEventCategory.DataBind();
        }

        private void Clear()
        {
            ddlEvent.ClearSelection();
            ddlPrefernce.ClearSelection();
            txtCategoryName.Text = string.Empty;
            txtShortName.Text = string.Empty;
            txtParticipants.Text = string.Empty;
            calStartDate.SelectedDates.Clear();
            calEndDate.SelectedDates.Clear();
        }

        protected void btnSaveCategory_Click(object sender, EventArgs e)
        {
            if(btnSaveCategory.Text.Equals("Save Entry"))
            { 
                int eventId = int.Parse(ddlEvent.SelectedItem.Value);
                string categoryName = txtCategoryName.Text;
                string alias = txtShortName.Text;
                int pref = int.Parse(ddlPrefernce.SelectedItem.Value);
                string dateStart = calStartDate.SelectedDate.ToString("yyyy-MM-dd");
                string dateEnd = calEndDate.SelectedDate.ToString("yyyy-MM-dd");
                int participants = int.Parse(txtParticipants.Text);

                if (dateStart.Equals(dateEnd))
                {
                    lblOutput.Text = "<span class='text-danger'>Error: Invalid Start and/or End Date!</span>";
                    return;
                }
                else if (calStartDate.SelectedDate > calEndDate.SelectedDate)
                {
                    lblOutput.Text = "<span class='text-danger'>Error: Invalid Start and/or End Date!</span>";
                    return;
                }

                string query = string.Format(@"INSERT INTO Event_Category VALUES ('{0}','{1}','{2}','{3}',CONVERT(DATETIME,'{4}',120),CONVERT(DATETIME,'{5}',120),'{6}')",eventId,categoryName,alias,pref,dateStart,dateEnd,participants);

                SqlCommand cmd = new SqlCommand(query, con);

                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Clear();
                    lblOutput.Text = "<span class='text-success'>Record Inserted!</span>";
                    ShowData();
                }
                catch (Exception ex)
                {
                    lblOutput.Text = "<span class='text-danger'>Error: " + ex.Message + "!</span>";
                }
            }
            else if(btnSaveCategory.Text.Equals("Update Entry"))
            {
                string categoryName = txtCategoryName.Text;
                string alias = txtShortName.Text;
                int pref = int.Parse(ddlPrefernce.SelectedItem.Value);
                string dateStart = calStartDate.SelectedDate.ToString("yyyy-MM-dd");
                string dateEnd = calEndDate.SelectedDate.ToString("yyyy-MM-dd");
                int participants = int.Parse(txtParticipants.Text);

                if (dateStart.Equals(dateEnd))
                {
                    lblOutput.Text = "<span class='text-danger'>Error: Invalid Start and/or End Date!</span>";
                    return;
                }
                else if (calStartDate.SelectedDate > calEndDate.SelectedDate)
                {
                    lblOutput.Text = "<span class='text-danger'>Error: Invalid Start and/or End Date!</span>";
                    return;
                }

                string query = string.Format(@"UPDATE Event_Category SET Category_Name = '{0}', Short_Name = '{1}', Preference = '{2}', Reg_StartDate = CONVERT(DATETIME,'{3}',120), Reg_EndDate = CONVERT(DATETIME,'{4}',120), TotalNoOf_Participents = '{5}' WHERE Category_ID = '{6}'",  categoryName, alias, pref, dateStart, dateEnd, participants, ViewState["id"]);

                SqlCommand cmd = new SqlCommand(query, con);

                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Clear();
                    lblOutput.Text = "<span class='text-success'>Record Updated!</span>";
                    ShowData();
                }
                catch (Exception ex)
                {
                    lblOutput.Text = "<span class='text-danger'>Error: " + ex.Message + "!</span>";
                }
                finally
                {
                    btnSaveCategory.Text = "Save Entry";
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string query = string.Format(@"SELECT Category_ID, Event_Name, Category_Name, Short_Name, Preference, Reg_StartDate, Reg_EndDate, TotalNoOf_Participents, Event_Master.Event_ID FROM Event_Category LEFT JOIN Event_Master ON Event_Category.Event_ID = Event_Master.Event_ID WHERE Category_ID = '{0}'", btn.CommandArgument);
            Clear();
            SqlDataAdapter adpt = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            txtCategoryName.Text = dt.Rows[0][2].ToString();
            txtShortName.Text = dt.Rows[0][3].ToString();
            txtParticipants.Text = dt.Rows[0][7].ToString();
            DateTime startDate = Convert.ToDateTime(dt.Rows[0][5]);
            DateTime endDate = Convert.ToDateTime(dt.Rows[0][6]);
            calStartDate.SelectedDate = startDate;
            calStartDate.VisibleDate = startDate;
            calEndDate.SelectedDate = endDate;
            calEndDate.VisibleDate = endDate;
            ddlEvent.SelectedValue = dt.Rows[0][8].ToString();
            ddlEvent.Enabled = false;
            ddlPrefernce.SelectedValue = dt.Rows[0][4].ToString();
            ViewState["id"] = btn.CommandArgument;
            btnSaveCategory.Text = "Update Entry";
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string query = string.Format(@"DELETE FROM Event_Category WHERE Category_ID = '{0}'", btn.CommandArgument);
            SqlCommand cmd = new SqlCommand(query, con);
            
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                lblOutput.Text = "<span class='text-success'>Event Category Deleted Successfully!</span>";
                ShowData();
                BindDropDown();
            }
            catch (Exception ex)
            {
                lblOutput.Text = "<span class='text-danger'>Error: " + ex.Message + "!</span>";
            }
        }
    }
}