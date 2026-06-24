using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_save_Click(object sender, ImageClickEventArgs e)
    {
        // 验证两次密码是否一致
        if (TextBox4.Text != TextBox5.Text)
        {
            Response.Write("<script>alert('两次输入的密码不一致')</script>");
            return;
        }

        string connStr = ConfigurationManager.ConnectionStrings["FMSDB"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            conn.Open();
            string sql = "INSERT INTO familyInformation (userId, realName, userName, userPassword, class) VALUES (@userId, @realName, @userName, @userPassword, @class)";
            using (SqlCommand comm = new SqlCommand(sql, conn))
            {
                comm.Parameters.AddWithValue("@userId", TextBox1.Text);
                comm.Parameters.AddWithValue("@realName", TextBox3.Text);
                comm.Parameters.AddWithValue("@userName", TextBox2.Text);
                comm.Parameters.AddWithValue("@userPassword", TextBox4.Text);
                comm.Parameters.AddWithValue("@class", 1);
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
