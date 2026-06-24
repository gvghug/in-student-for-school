using System;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class account_list : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void cbx_header_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chk = sender as CheckBox;
        if (chk != null)
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                CheckBox chk_item = row.FindControl("cbx_item") as CheckBox;
                chk_item.Checked = chk.Checked;
            }
        }
    }

    protected void btn_delete_Click(object sender, ImageClickEventArgs e)
    {
        foreach (GridViewRow row in GridView1.Rows)
        {
            CheckBox chk_item = row.FindControl("cbx_item") as CheckBox;
            if (chk_item != null && chk_item.Checked)
            {
                int keyId = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Value);
                SqlDataSource1.DeleteParameters["accountId"].DefaultValue = keyId.ToString();
                SqlDataSource1.Delete();
            }
        }
        GridView1.DataBind();
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;
        int accountId = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Value);

        if (e.CommandName == "Edit")
        {
            Response.Redirect("edit.aspx?accountId=" + accountId);
        }
        else if (e.CommandName == "Delete")
        {
            SqlDataSource1.DeleteParameters["accountId"].DefaultValue = accountId.ToString();
            SqlDataSource1.Delete();
            GridView1.DataBind();
        }
    }

    protected void btn_add_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("add.aspx");
    }
}
