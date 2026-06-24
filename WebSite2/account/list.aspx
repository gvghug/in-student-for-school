<%@ Page Language="C#" AutoEventWireup="true" CodeFile="list.aspx.cs" Inherits="account_list" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>帐薄管理</title>
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
          <td>【 账簿管理 】</td>
          <td align="right">
              <asp:ImageButton ID="btn_add" runat="server" ImageUrl="~/images/index_10_0.gif"
                  onMouseOver="MM_swapImage('btn_add','','../images/index_10_1.gif',1)"
                  onMouseOut="MM_swapImgRestore()"
                  onMouseDown="MM_swapImage('btn_add','','../images/index_10_2.gif',1)"
                  onMouseUp="MM_swapImage('btn_add','','../images/index_10_1.gif',1)" Height="24px" OnClick="btn_add_Click" />
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
            AutoGenerateColumns="False"
            DataSourceID="SqlDataSource1"
            GridLines="None" CellPadding="0" CellSpacing="0"
            HeaderStyle-CssClass="bg03 text007"
            RowStyle-CssClass="row"
            AlternatingRowStyle-CssClass="altRow bg04"
            Width="98%" DataKeyNames="accountId" OnRowCommand="GridView1_RowCommand">
            <AlternatingRowStyle CssClass="altRow bg04" />
            <Columns>
                <asp:TemplateField HeaderText="全选" ItemStyle-Width="8%" HeaderStyle-Width="8%">
                    <HeaderTemplate>
                        <asp:CheckBox ID="cbx_header" runat="server" OnCheckedChanged="cbx_header_CheckedChanged" AutoPostBack="True" />
                        <span class="text007">全选</span>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="cbx_item" runat="server" />
                    </ItemTemplate>
                    <HeaderStyle Width="8%" /><ItemStyle Width="8%" />
                </asp:TemplateField>
                <asp:BoundField DataField="accountName" HeaderText="账户名称" ItemStyle-Width="18%" HeaderStyle-Width="18%" />
                <asp:BoundField DataField="accountType" HeaderText="账户类型" ItemStyle-Width="14%" HeaderStyle-Width="14%" />
                <asp:BoundField DataField="initialBalance" HeaderText="初始余额" ItemStyle-Width="14%" HeaderStyle-Width="14%" DataFormatString="{0:F2}" />
                <asp:BoundField DataField="currentBalance" HeaderText="当前余额" ItemStyle-Width="14%" HeaderStyle-Width="14%" DataFormatString="{0:F2}" />
                <asp:BoundField DataField="remark" HeaderText="备注" ItemStyle-Width="18%" HeaderStyle-Width="18%" />
                <asp:TemplateField HeaderText="操作" ItemStyle-Width="14%" HeaderStyle-Width="14%">
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/icon_set.gif" BorderWidth="0" CommandName="Edit" CommandArgument='<%# Eval("accountId") %>' />
                        &nbsp;&nbsp;
                        <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/delete.gif" BorderWidth="0" CommandName="Delete" CommandArgument='<%# Eval("accountId") %>' OnClientClick="return confirm('确定要删除该账户吗？');" />
                    </ItemTemplate>
                    <HeaderStyle Width="14%" /><ItemStyle Width="14%" />
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="bg03 text007" />
            <RowStyle CssClass="row" />
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FMSDB %>"
            SelectCommand="SELECT accountId, accountName, accountType, initialBalance, currentBalance, remark, createDate FROM accountTable ORDER BY accountId DESC"
            DeleteCommand="DELETE FROM accountTable WHERE accountId=@accountId">
            <DeleteParameters>
                <asp:Parameter Name="accountId" Type="Int32" />
            </DeleteParameters>
        </asp:SqlDataSource>

        <hr class="bor005" size="1" />
    </td></tr>
</table>
        </div>
    </form>
</body>
</html>
