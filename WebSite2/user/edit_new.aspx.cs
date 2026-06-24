using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_edit_new : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // 首次加载时，根据systemId加载数据
            LoadData();
        }
    }

    private void LoadData()
    {
        string systemId = Request.QueryString["systemId"];
        if (string.IsNullOrEmpty(systemId))
        {
            Response.Write("<script>alert('参数错误');window.location='list.aspx'</script>");
            return;
        }

        string connStr = ConfigurationManager.ConnectionStrings["FMSDB"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            conn.Open();
            string sql = "SELECT userId, userName, realName, userPassword FROM familyInformation WHERE systemId=@systemId";
            using (SqlCommand comm = new SqlCommand(sql, conn))
            {
                comm.Parameters.AddWithValue("@systemId", systemId);
                using (SqlDataReader reader = comm.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        txtUserId.Text = reader["userId"].ToString();
                        txtUserName.Text = reader["userName"].ToString();
                        txtRealName.Text = reader["realName"].ToString();
                        txtPassword.Text = reader["userPassword"].ToString();
                        txtConfirmPassword.Text = reader["userPassword"].ToString();
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
        // 验证两次密码是否一致
        if (txtPassword.Text != txtConfirmPassword.Text)
        {
            Response.Write("<script>alert('两次输入的密码不一致')</script>");
            return;
        }

        string systemId = Request.QueryString["systemId"];
        string connStr = ConfigurationManager.ConnectionStrings["FMSDB"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            conn.Open();
            string sql = "UPDATE familyInformation SET userId=@userId, userName=@userName, realName=@realName, userPassword=@userPassword WHERE systemId=@systemId";
            using (SqlCommand comm = new SqlCommand(sql, conn))
            {
                comm.Parameters.AddWithValue("@userId", txtUserId.Text);
                comm.Parameters.AddWithValue("@userName", txtUserName.Text);
                comm.Parameters.AddWithValue("@realName", txtRealName.Text);
                comm.Parameters.AddWithValue("@userPassword", txtPassword.Text);
                comm.Parameters.AddWithValue("@systemId", systemId);
                comm.ExecuteNonQuery();
            }
        }

        // 保存成功后跳转回列表页
        Response.Redirect("list.aspx");
    }

    protected void btn_cancel_Click(object sender, ImageClickEventArgs e)
    {
        // 取消，返回列表页
        Response.Redirect("list.aspx");
    }
}
