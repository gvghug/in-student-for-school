using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class item_edit : System.Web.UI.Page
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
        string itemId = Request.QueryString["itemId"];
        if (string.IsNullOrEmpty(itemId))
        {
            Response.Write("<script>alert('参数错误');window.location='list.aspx'</script>");
            return;
        }

        string connStr = ConfigurationManager.ConnectionStrings["FMSDB"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            conn.Open();
            string sql = "SELECT itemName, itemType, sortOrder FROM itemTable WHERE itemId=@itemId";
            using (SqlCommand comm = new SqlCommand(sql, conn))
            {
                comm.Parameters.AddWithValue("@itemId", itemId);
                using (SqlDataReader reader = comm.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        txtItemName.Text = reader["itemName"].ToString();
                        rblItemType.SelectedValue = reader["itemType"].ToString();
                        txtSortOrder.Text = reader["sortOrder"].ToString();
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
        if (string.IsNullOrWhiteSpace(txtItemName.Text))
        {
            Response.Write("<script>alert('请输入项目名称')</script>");
            return;
        }

        int itemType = int.Parse(rblItemType.SelectedValue);
        int sortOrder;
        if (!int.TryParse(txtSortOrder.Text, out sortOrder))
        {
            sortOrder = 0;
        }

        string itemId = Request.QueryString["itemId"];
        string connStr = ConfigurationManager.ConnectionStrings["FMSDB"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            conn.Open();
            string sql = "UPDATE itemTable SET itemName=@itemName, itemType=@itemType, sortOrder=@sortOrder WHERE itemId=@itemId";
            using (SqlCommand comm = new SqlCommand(sql, conn))
            {
                comm.Parameters.AddWithValue("@itemName", txtItemName.Text);
                comm.Parameters.AddWithValue("@itemType", itemType);
                comm.Parameters.AddWithValue("@sortOrder", sortOrder);
                comm.Parameters.AddWithValue("@itemId", itemId);
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
