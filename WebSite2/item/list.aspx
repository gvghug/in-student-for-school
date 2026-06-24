<%@ Page Language="C#" AutoEventWireup="true" CodeFile="list.aspx.cs" Inherits="item_list" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>收支项目管理</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#GridView1 { width: 98% !important; border: 0 !important; border-collapse: collapse !important; margin: 0 !important; }
#GridView1 td { height: 35px !important; text-align: center !important; vertical-align: middle !important; border: 0 !important; padding: 0 !important; }
#GridView1 th { height: 29px !important; text-align: center !important; vertical-align: middle !important; border: 0 !important; padding: 0 !important; font-weight: normal !important; }
#GridView1 .row { background:none; }
#GridView1 .altRow { background:none; }
.auto-style1 { font-size: 16px; color: #12586c; font-weight: bold; height: 32px; }
</style>
</head>
<body topmargin="0" leftmargin="0">
    <form id="form1" runat="server">
        <div>
           <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left" valign="top" class="auto-style1">
      <table width="98%" border="0" cellspacing="0" cellpadding="0">
        <tr valign="top">
          <td>【 收支项目管理 】</td>
          <td align="right">
              <asp:ImageButton ID="btn_add" runat="server" ImageUrl="~/images/index_14_0.gif" Height="24px"
                  onMouseOver="MM_swapImage('btn_add','','../images/index_14_1.gif',1)"
                  onMouseOut="MM_swapImgRestore()"
                  onMouseDown="MM_swapImage('btn_add','','../images/index_14_2.gif',1)"
                  onMouseUp="MM_swapImage('btn_add','','../images/index_15_1.gif',1)" OnClick="btn_add_Click" />
              <asp:ImageButton ID="btn_delete" runat="server" ImageUrl="~/images/index_13_0.gif"
                  onMouseOver="MM_swapImage('btn_delete','','../images/index_13_1.gif',1)"
                  onMouseOut="MM_swapImgRestore()"
                  onMouseDown="MM_swapImage('btn_delete','','../images/index_13_2.gif',1)"
                  onMouseUp="MM_swapImage('btn_delete','','../images/index_13_1.gif',1)" OnClick="btn_delete_Click" />
              &nbsp;&nbsp;
          </td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td height="215" valign="top">
        <asp:GridView ID="GridView1" runat="server"
            AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
            GridLines="None" CellPadding="0" CellSpacing="0"
            HeaderStyle-CssClass="bg03 text007"
            RowStyle-CssClass="row" AlternatingRowStyle-CssClass="altRow bg04"
            Width="98%" DataKeyNames="itemId" OnRowCommand="GridView1_RowCommand">
            <AlternatingRowStyle CssClass="altRow bg04" />
            <Columns>
                <asp:TemplateField HeaderText="全选" ItemStyle-Width="13%" HeaderStyle-Width="13%">
                    <HeaderTemplate>
                        <asp:CheckBox ID="cbx_header" runat="server" OnCheckedChanged="cbx_header_CheckedChanged" AutoPostBack="True" />
                        <span class="text007">全选</span>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="cbx_item" runat="server" />
                    </ItemTemplate>
                    <HeaderStyle Width="13%" /><ItemStyle Width="13%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="收入/支出" ItemStyle-Width="22%" HeaderStyle-Width="22%">
                    <ItemTemplate>
                        <%# Convert.ToInt32(Eval("itemType")) == 1 ? "收入" : "支出" %>
                    </ItemTemplate>
                    <HeaderStyle Width="22%" /><ItemStyle Width="22%" />
                </asp:TemplateField>
                <asp:BoundField DataField="itemName" HeaderText="项目名称" ItemStyle-Width="20%" HeaderStyle-Width="20%" />
                <asp:BoundField DataField="sortOrder" HeaderText="排序号" ItemStyle-Width="15%" HeaderStyle-Width="15%" />
                <asp:TemplateField HeaderText="操作" ItemStyle-Width="30%" HeaderStyle-Width="30%">
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/icon_set.gif" BorderWidth="0" CommandName="Edit" CommandArgument='<%# Eval("itemId") %>' />
                        &nbsp;&nbsp;
                        <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/delete.gif" BorderWidth="0" CommandName="Delete" CommandArgument='<%# Eval("itemId") %>' OnClientClick="return confirm('确定要删除该项目吗？');" />
                    </ItemTemplate>
                    <HeaderStyle Width="30%" /><ItemStyle Width="30%" />
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="bg03 text007" />
            <RowStyle CssClass="row" />
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FMSDB %>"
            SelectCommand="SELECT itemId, itemName, itemType, sortOrder, icon FROM itemTable ORDER BY itemType DESC, sortOrder ASC"
            DeleteCommand="DELETE FROM itemTable WHERE itemId=@itemId">
            <DeleteParameters>
                <asp:Parameter Name="itemId" Type="Int32" />
            </DeleteParameters>
        </asp:SqlDataSource>

        <hr class="bor005" size="1" />
    </td></tr>
</table>
        </div>
    </form>
</body>
</html>
