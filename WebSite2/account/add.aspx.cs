using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class account_add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
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

        string connStr = ConfigurationManager.ConnectionStrings["FMSDB"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            conn.Open();
            string sql = "INSERT INTO accountTable (accountName, accountType, initialBalance, currentBalance, remark) VALUES (@accountName, @accountType, @initialBalance, @currentBalance, @remark)";
            using (SqlCommand comm = new SqlCommand(sql, conn))
            {
                comm.Parameters.AddWithValue("@accountName", txtAccountName.Text);
                comm.Parameters.AddWithValue("@accountType", ddlAccountType.SelectedValue);
                comm.Parameters.AddWithValue("@initialBalance", initialBalance);
                comm.Parameters.AddWithValue("@currentBalance", initialBalance);
                comm.Parameters.AddWithValue("@remark", txtRemark.Text);
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
