using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class item_add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
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

        string connStr = ConfigurationManager.ConnectionStrings["FMSDB"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            conn.Open();
            string sql = "INSERT INTO itemTable (itemName, itemType, sortOrder) VALUES (@itemName, @itemType, @sortOrder)";
            using (SqlCommand comm = new SqlCommand(sql, conn))
            {
                comm.Parameters.AddWithValue("@itemName", txtItemName.Text);
                comm.Parameters.AddWithValue("@itemType", itemType);
                comm.Parameters.AddWithValue("@sortOrder", sortOrder);
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
