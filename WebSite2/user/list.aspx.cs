using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_list : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


    }

    protected void cbx_header_CheckedChanged(object sender, EventArgs e)
    {
        //将触发事件的对象强转为复选框控件（全选框）
        CheckBox chk = sender as CheckBox;
        //判断控件转换是否成功，避免空对象报错
        if (chk != null)
        {
            //遍历GridView中所有数据行
            foreach (GridViewRow row in GridView1.Rows)
            {
                //在当前行中查找行内复选框控件cbx_item
                CheckBox chk_item = row.FindControl("cbx_item") as CheckBox;
                //将行内复选框状态与全选框状态保持一致
                chk_item.Checked = chk.Checked;
            }
        }
    }

    protected void btn_delete_Click(object sender, ImageClickEventArgs e)
    {
        foreach (GridViewRow row in GridView1.Rows)
        {
            //在当前行中查找行内复选框控件CheckBox1
            CheckBox chk_item = row.FindControl("cbx_item") as CheckBox;
            //判断复选框存在 且 处于勾选状态
            if (chk_item != null && chk_item.Checked)
            {
                //通过DataKeys标准方式获取当前行主键systemId，转为整型
                int keyId = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Value);
                //给SqlDataSource删除语句参数赋值，绑定当前删除主键
                SqlDataSource1.DeleteParameters["systemId"].DefaultValue = keyId.ToString();
                //执行SqlDataSource预定义的DeleteCommand，删除数据库数据
                SqlDataSource1.Delete();
            }
        }
        //重新绑定数据源，刷新表格，展示删除后最新数据
        GridView1.DataBind();
    }


    // 正确：GridView 行命令（编辑/删除）
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        // 获取当前点击按钮所在的行
        GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;

        // 从 DataKeys 中安全获取主键 systemId
        int systemId = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Value);

        if (e.CommandName == "Edit")
        {
            // 编辑跳转
            Response.Redirect("~/user/edit_new.aspx?systemId=" + systemId);
        }
        else if (e.CommandName == "Delete")
        {
            // 单条删除
            SqlDataSource1.DeleteParameters["systemId"].DefaultValue = systemId.ToString();
            SqlDataSource1.Delete();

            // 删除后刷新表格
            GridView1.DataBind();
        }
    }
    protected void btn_add_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("add.aspx");
    }

}