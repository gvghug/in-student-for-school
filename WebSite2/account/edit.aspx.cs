using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class account_edit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadData();
        }
    }

    private void LoadData()
    {
        string accountId = Request.QueryString["accountId"];
        if (string.IsNullOrEmpty(accountId))
        {
            Response.Write("<script>alert('参数错误');window.location='list.aspx'</script>");
            return;
        }

        string connStr = ConfigurationManager.ConnectionStrings["FMSDB"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            conn.Open();
            string sql = "SELECT accountName, accountType, initialBalance, remark FROM accountTable WHERE accountId=@accountId";
            using (SqlCommand comm = new SqlCommand(sql, conn))
            {
                comm.Parameters.AddWithValue("@accountId", accountId);
                using (SqlDataReader reader = comm.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        txtAccountName.Text = reader["accountName"].ToString();
                        ddlAccountType.SelectedValue = reader["accountType"].ToString();
                        txtInitialBalance.Text = reader["initialBalance"].ToString();
                        txtRemark.Text = reader["remark"].ToString();
                    }
                    else
                    {
                        Response.Write("<script>alert('未找到该记录');window.location='list.aspx'</script>");
                    }
                }
            }
        }
    }

    protected void btn_save_Click(object sender, ImageClickEventArgs e)
    {
        if (string.IsNullOrWhiteSpace(txtAccountName.Text))
        {
            Response.Write("<script>alert('请输入账户名称')</script>");
            return;
        }

        decimal initialBalance;
        if (!decimal.TryParse(txtInitialBalance.Text, out initialBalance))
        {
            Response.Write("<script>alert('请输入有效的初始余额')</script>");
            return;
        }

        string accountId = Request.QueryString["accountId"];
        string connStr = ConfigurationManager.ConnectionStrings["FMSDB"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            conn.Open();
            string sql = "UPDATE accountTable SET accountName=@accountName, accountType=@accountType, initialBalance=@initialBalance, remark=@remark WHERE accountId=@accountId";
            using (SqlCommand comm = new SqlCommand(sql, conn))
            {
                comm.Parameters.AddWithValue("@accountName", txtAccountName.Text);
                comm.Parameters.AddWithValue("@accountType", ddlAccountType.SelectedValue);
                comm.Parameters.AddWithValue("@initialBalance", initialBalance);
                comm.Parameters.AddWithValue("@remark", txtRemark.Text);
                comm.Parameters.AddWithValue("@accountId", accountId);
                comm.ExecuteNonQuery();
            }
        }

        Response.Redirect("list.aspx");
    }

    protected void btn_cancel_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("list.aspx");
    }
}
