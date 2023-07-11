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
    public partial class Divyaraj_EventMaster : System.Web.UI.Page
    {
        public string ConnectionString = ConfigurationManager.ConnectionStrings["dbs_cnstr"].ConnectionString;
        SqlConnection con;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(ConnectionString);
            if(!IsPostBack)
            {
                ShowData();
            }
        }

        private void ShowData()
        {
            SqlDataAdapter adpt = new SqlDataAdapter(@"SELECT Event_ID, Event_Name, Start_Date, End_Date, CoOrdinater_Name, CoOrdinater_EmailID,CoOrdinater_MobileNo, EventNoPart FROM Event_Master", con);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            gvEventMaster.DataSource = dt;
            gvEventMaster.DataBind();
        }

        private void Clear()
        {
            txtEventName.Text = string.Empty;
            calStartDate.SelectedDates.Clear();
            calEndDate.SelectedDates.Clear();
            txtCoordinatorEmail.Text = string.Empty;
            txtCoordinatorName.Text = string.Empty;
            txtCoordinatorMobile.Text = string.Empty;
            txtEventNoPart.Text = string.Empty;
        }

        protected void btnSaveEntry_Click(object sender, EventArgs e)
        {
            if(btnSaveEntry.Text.Equals("Save Entry"))
            { 
                try
                {
                    string eventName = txtEventName.Text;
                    string dateStart = calStartDate.SelectedDate.ToString("yyyy-MM-dd");
                    string dateEnd = calEndDate.SelectedDate.ToString("yyyy-MM-dd");
                    string coordinatorName = txtCoordinatorName.Text;
                    string coordinatorEmail = txtCoordinatorEmail.Text;
                    string coordinatorMobile = txtCoordinatorMobile.Text;
                    string eventNoPart = txtEventNoPart.Text;

                    if(dateStart.Equals(dateEnd))
                    {
                        lblOutput.Text = "<span class='text-danger'>Error: Invalid Start and/or End Date!</span>";
                        return;
                    }
                    else if (calStartDate.SelectedDate > calEndDate.SelectedDate)
                    {
                        lblOutput.Text = "<span class='text-danger'>Error: Invalid Start and/or End Date!</span>";
                        return;
                    }

                    string query = string.Format(@"INSERT INTO Event_Master VALUES('{0}',CONVERT(DATETIME,'{1}',120),CONVERT(DATETIME,'{2}',120),'{3}','{4}','{5}','{6}')", eventName, dateStart, dateEnd, coordinatorName, coordinatorEmail, coordinatorMobile, eventNoPart);

                    SqlCommand cmd = new SqlCommand(query, con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Clear();
                    lblOutput.Text = "<span class='text-success'>Event Added Successfully!</span>";
                    ShowData();
                }
                catch (Exception ex)
                {
                    lblOutput.Text = "<span class='text-danger'>Error: " + ex.Message + "!</span>";
                }
            }
            else if(btnSaveEntry.Text.Equals("Update Entry"))
            {
                try
                {
                    string eventName = txtEventName.Text;
                    string dateStart = calStartDate.SelectedDate.ToString("yyyy-MM-dd");
                    string dateEnd = calEndDate.SelectedDate.ToString("yyyy-MM-dd");
                    string coordinatorName = txtCoordinatorName.Text;
                    string coordinatorEmail = txtCoordinatorEmail.Text;
                    string coordinatorMobile = txtCoordinatorMobile.Text;
                    string eventNoPart = txtEventNoPart.Text;

                    if (dateStart.Equals(dateEnd))
                    {
                        lblOutput.Text = "<span class='text-danger'>Error: Invalid Start and/or End Date!</span>";
                        return;
                    }
                    else if(calStartDate.SelectedDate > calEndDate.SelectedDate)
                    {
                        lblOutput.Text = "<span class='text-danger'>Error: Invalid Start and/or End Date!</span>";
                        return;
                    }

                    string query = string.Format(@"UPDATE Event_Master SET Event_Name = '{0}', Start_Date = CONVERT(DATETIME,'{1}',120), End_Date = CONVERT(DATETIME,'{2}',120), CoOrdinater_Name = '{3}', CoOrdinater_EmailID = '{4}', CoOrdinater_MobileNo = '{5}', EventNoPart = '{6}' WHERE Event_ID = '{7}'", eventName, dateStart, dateEnd, coordinatorName, coordinatorEmail, coordinatorMobile, eventNoPart, ViewState["id"]);

                    SqlCommand cmd = new SqlCommand(query, con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Clear();
                    lblOutput.Text = "<span class='text-success'>Event Updated Successfully!</span>";
                    ShowData();
                }
                catch (Exception ex)
                {
                    lblOutput.Text = "<span class='text-danger'>Error: " + ex.Message + "!</span>";
                }
                finally
                {
                    btnSaveEntry.Text = "Save Entry";
                }
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string query = string.Format(@"DELETE FROM Event_Master WHERE Event_ID = '{0}'", btn.CommandArgument);
            SqlCommand cmd = new SqlCommand(query, con);

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                lblOutput.Text = "<span class='text-success'>Event Deleted Successfully!</span>";
                ShowData();
            }
            catch (Exception ex)
            {
                lblOutput.Text = "<span class='text-danger'>Error: " + ex.Message + "!</span>";
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string query = string.Format(@"SELECT Event_ID, Event_Name, Start_Date, End_Date, CoOrdinater_Name, CoOrdinater_EmailID,CoOrdinater_MobileNo, EventNoPart FROM Event_Master WHERE Event_ID = '{0}'", btn.CommandArgument);
            Clear();
            SqlDataAdapter adpt = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            txtEventName.Text = dt.Rows[0][1].ToString();
            DateTime startDate = Convert.ToDateTime(dt.Rows[0][2]);
            DateTime endDate = Convert.ToDateTime(dt.Rows[0][3]);
            calStartDate.SelectedDate = startDate;
            calStartDate.VisibleDate = startDate;
            calEndDate.SelectedDate = endDate;
            calEndDate.VisibleDate = endDate;
            txtCoordinatorName.Text = dt.Rows[0][4].ToString();
            txtCoordinatorEmail.Text = dt.Rows[0][5].ToString();
            txtCoordinatorMobile.Text = dt.Rows[0][6].ToString();
            txtEventNoPart.Text = dt.Rows[0][7].ToString();
            ViewState["id"] = btn.CommandArgument;
            btnSaveEntry.Text = "Update Entry";
        }
    }
}