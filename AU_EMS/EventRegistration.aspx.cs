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
    public partial class Shahnawaz_EventRegistration : System.Web.UI.Page
    {
        public string ConnectionString = ConfigurationManager.ConnectionStrings["dbs_cnstr"].ConnectionString;
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(ConnectionString);
            if(!IsPostBack)
            {
                ShowData();
                BindEventDropDown();
                BindCategoryDropDown();
            }
        }

        private void BindFullEventDropDown()
        {
            SqlDataAdapter adpt = new SqlDataAdapter(@"SELECT Event_ID, Event_Name FROM Event_Master", con);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            ddlEventName.DataSource = dt;
            ddlEventName.DataTextField = "Event_Name";
            ddlEventName.DataValueField = "Event_ID";
            ddlEventName.DataBind();
        }

        private void BindFullCategoryDropDown()
        {
            int selectedId = int.Parse(ddlEventName.SelectedItem.Value);
            string query = string.Format(@"SELECT * FROM Event_Category WHERE Event_ID = {0}", selectedId);
            SqlDataAdapter adpt = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            ddlCategory.DataSource = dt;
            ddlCategory.DataTextField = "Category_Name";
            ddlCategory.DataValueField = "Category_ID";
            ddlCategory.DataBind();
        }

        private void BindEventDropDown()
        {
            SqlDataAdapter adpt = new SqlDataAdapter(@"SELECT DISTINCT Event_Master.Event_ID, Event_Name FROM Event_Master LEFT JOIN Event_Category ON Event_Master.Event_ID = Event_Category.Event_ID WHERE End_Date >= cast(getdate() as date) AND Start_Date < cast(getdate() + 1 as date) AND (SELECT COUNT(*) FROM Event_Registration WHERE Event_Registration.Category_ID = Event_Category.Category_ID) < TotalNoOf_Participents", con);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            ddlEventName.DataSource = dt;
            ddlEventName.DataTextField = "Event_Name";
            ddlEventName.DataValueField = "Event_ID";
            ddlEventName.DataBind();
        }
        private void BindCategoryDropDown()
        {
            int selectedId = int.Parse(ddlEventName.SelectedItem.Value);
            string query = string.Format(@"SELECT * FROM Event_Category WHERE Event_ID = {0} AND Reg_EndDate >= cast(getdate() as date) AND Reg_StartDate < cast(getdate() + 1 as date) AND (SELECT COUNT(*) FROM Event_Registration WHERE Event_Registration.Category_ID = Event_Category.Category_ID) < TotalNoOf_Participents", selectedId);
            SqlDataAdapter adpt = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            ddlCategory.DataSource = dt;
            ddlCategory.DataTextField = "Category_Name";
            ddlCategory.DataValueField = "Category_ID";
            ddlCategory.DataBind();
        }

        protected void ddlEventName_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindCategoryDropDown();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if(btnSave.Text.Equals("Save Entry"))
            {
                int eventId = int.Parse(ddlEventName.SelectedItem.Value);
                int categoryId = int.Parse(ddlCategory.SelectedItem.Value);
                string name = txtName.Text;
                string gender = string.Empty;
                string email = txtEmail.Text;
                string mobile = txtMobile.Text;
                string city = txtCityVillage.Text;
                string taluka = txtTaluka.Text;
                string district = txtDistrict.Text;
                string state = txtState.Text;
                string uniqueId = string.Empty;
                int statusId = 1;
                string eventNoPart = string.Empty;
                string entryNo = string.Empty;
            
                if(rbMale.Checked)
                {
                    gender = rbMale.Text;
                }
                else
                {
                    gender = rbFemale.Text;
                }
                Guid guid = Guid.NewGuid();
                uniqueId = guid.ToString().ToLower().Substring(0,8);
                eventNoPart = GetEventNoPart(eventId);
                entryNo = GenerateEntryNumber(eventNoPart, categoryId);

                string query = string.Format(@"INSERT INTO Event_Registration VALUES ('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}','{12}')",eventId, categoryId, name, gender, email, mobile, city, taluka, district, state, uniqueId, statusId, entryNo);
                SqlCommand cmd = new SqlCommand(query, con);

                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Clear();
                    lblOutput.Text = "<span class='text-success'>Record Inserted!</span>";
                    ShowData();
                    BindEventDropDown();
                    BindCategoryDropDown();
                }
                catch (Exception ex)
                {
                    lblOutput.Text = "<span class='text-danger'>Error: " + ex.Message + "!</span>";
                }
            }
            else if(btnSave.Text.Equals("Update Entry"))
            {
                btnSave.Text = "Save Entry";
                string name = txtName.Text;
                string gender = string.Empty;
                string email = txtEmail.Text;
                string mobile = txtMobile.Text;
                string city = txtCityVillage.Text;
                string taluka = txtTaluka.Text;
                string district = txtDistrict.Text;
                string state = txtState.Text;
                int status = Convert.ToInt32(ddlStatus.SelectedItem.Value.ToString());

                if(rbMale.Checked)
                {
                    gender = rbMale.Text;
                }
                else
                {
                    gender = rbFemale.Text;
                }

                string query = string.Format("UPDATE Event_Registration SET Name = '{0}', Gender = '{1}', EmailID = '{2}', MobileNo = '{3}', City = '{4}', Taluka = '{5}', District = '{6}', State = '{7}', Status_ID = '{8}' WHERE Registration_ID = '{9}'", name, gender, email, mobile, city, taluka, district, state, status, ViewState["id"]);

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
                    btnSave.Text = "Save Entry";
                    ddlEventName.Enabled = true;
                    ddlCategory.Enabled = true;
                    BindEventDropDown();
                    BindCategoryDropDown();
                }



            }
        }

        private string GetEventNoPart(int eventId)
        {
            string query = string.Format(@"SELECT EventNoPart FROM Event_Master WHERE Event_ID = '{0}'", eventId);
            SqlDataAdapter adpt = new SqlDataAdapter(query,con);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            string eventNoPart = dt.Rows[0][0].ToString();
            return eventNoPart;
        }

        private string GenerateEntryNumber(string eventNoPart, int categoryId)
        {
            string qry = string.Format(@"SELECT COUNT(*) FROM Event_Registration WHERE Event_Registration.Category_ID = '{0}'", categoryId);
            SqlDataAdapter adpt1 = new SqlDataAdapter(qry, con);
            DataTable dt1 = new DataTable();
            adpt1.Fill(dt1);
            string maxId = dt1.Rows[0][0].ToString();
            int maxId1;
            Int32.TryParse(maxId, out maxId1);
            maxId1++;
            string query = string.Format(@"SELECT RIGHT(REPLICATE('0',4) + '{0}',4)", maxId1.ToString());
            SqlDataAdapter adpt2 = new SqlDataAdapter(query, con);
            DataTable dt2 = new DataTable();
            adpt2.Fill(dt2);
            string newMaxId = dt2.Rows[0][0].ToString();
            string entryNo = eventNoPart + "/" + newMaxId;
            return entryNo;
            
        }

        private void Clear()
        {
            ddlEventName.ClearSelection();
            ddlCategory.ClearSelection();
            rbMale.Checked = true;
            rbFemale.Checked = false;
            txtCityVillage.Text = string.Empty;
            txtDistrict.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtMobile.Text = string.Empty;
            txtName.Text = string.Empty;
            txtState.Text = string.Empty;
            txtTaluka.Text = string.Empty;
        }

        private void ShowData()
        {
            SqlDataAdapter adpt = new SqlDataAdapter(@"SELECT DISTINCT Registration_ID, Entry_No, UniqueID, Event_Name, Category_Name, Name, Gender, EmailID, MobileNo, City, State, Status_ID FROM Event_Registration LEFT JOIN Event_Category ON Event_Registration.Event_ID = Event_Category.Event_ID LEFT JOIN Event_Master ON Event_Registration.Event_ID = Event_Master.Event_ID WHERE Event_Category.Category_ID = Event_Registration.Category_ID", con);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            gvRegistration.DataSource = dt;
            gvRegistration.DataBind();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string query = string.Format(@"SELECT Event_Registration.Event_ID, Event_Registration.Category_ID, Name, Gender, EmailID, MobileNo, City, Taluka, District, State, Status_ID FROM Event_Registration LEFT JOIN Event_Category ON Event_Registration.Event_ID = Event_Category.Event_ID LEFT JOIN Event_Master ON Event_Category.Event_ID = Event_Master.Event_ID WHERE (SELECT COUNT(*) FROM Event_Registration WHERE Event_Registration.Category_ID = Event_Category.Category_ID) > 0 AND Registration_ID = '{0}'", btn.CommandArgument);
            SqlDataAdapter adpt = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            Clear();
            BindFullEventDropDown();
            ddlEventName.SelectedValue = dt.Rows[0][0].ToString();
            BindFullCategoryDropDown();
            ddlCategory.SelectedValue = dt.Rows[0][1].ToString();
            ddlEventName.Enabled = false;
            ddlCategory.Enabled = false;
            txtName.Text = dt.Rows[0][2].ToString();
            if(dt.Rows[0][3].ToString().Equals("Male"))
            {
                rbMale.Checked = true;
            }
            else
            {
                rbFemale.Checked = true;
            }
            txtEmail.Text = dt.Rows[0][4].ToString();
            txtMobile.Text = dt.Rows[0][5].ToString();
            txtCityVillage.Text = dt.Rows[0][6].ToString();
            txtTaluka.Text = dt.Rows[0][7].ToString();
            txtDistrict.Text = dt.Rows[0][8].ToString();
            txtState.Text = dt.Rows[0][9].ToString();
            ddlStatus.Visible = true;
            ddlStatus.Enabled = true;
            lblStatus.Visible = true;
            ddlStatus.SelectedValue = dt.Rows[0][10].ToString();
            ViewState["id"] = btn.CommandArgument;
            btnSave.Text = "Update Entry";
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string query = string.Format(@"DELETE FROM Event_Registration WHERE Registration_ID = '{0}'", btn.CommandArgument);
            SqlCommand cmd = new SqlCommand(query, con);

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                lblOutput.Text = "<span class='text-success'>Event Registration Deleted Successfully!</span>";
                ShowData();
                BindEventDropDown();
                BindCategoryDropDown();
            }
            catch (Exception ex)
            {
                lblOutput.Text = "<span class='text-danger'>Error: " + ex.Message + "!</span>";
            }
        }
    }
}