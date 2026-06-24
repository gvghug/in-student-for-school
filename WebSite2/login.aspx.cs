using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_login_Click(object sender, ImageClickEventArgs e)
    {
        // 固定用户：用户名=1，密码=1
        if (Text1.Text == "1" && Text2.Text == "1")
        {
            Session["userName"] = "1";
            Response.Redirect("index.aspx");
            return;
        }

        string connStr = ConfigurationManager.ConnectionStrings["FMSDB"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            conn.Open();
            string sql = "select * from FamilyInformation where userName=@userName and userPassword=@userPassword";
            using (SqlCommand comm = new SqlCommand(sql, conn))
            {
                comm.Parameters.AddWithValue("@userName", Text1.Text);
                comm.Parameters.AddWithValue("@userPassword", Text2.Text);
                using (SqlDataReader reader = comm.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        // 登录成功，保存Session并跳转到首页
                        Session["userName"] = reader["userName"].ToString();
                        Response.Redirect("index.aspx");
                    }
                    else
                    {
                        // 用户名或密码不正确
                        Response.Write("<script>alert('用户名或密码不正确')</script>");
                    }
                }
            }
        }
    }
}
