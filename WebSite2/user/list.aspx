<%@ Page Language="C#" AutoEventWireup="true" CodeFile="list.aspx.cs" Inherits="user_list" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>家庭成员管理</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
/* 强制让GridView和静态表格样式完全一致 */
#GridView1 {
    width: 98% !important;
    border: 0 !important;
    border-collapse: collapse !important;
    margin: 0 !important;
}
#GridView1 td {
    height: 35px !important;
    text-align: center !important;
    vertical-align: middle !important;
    border: 0 !important;
    padding: 0 !important;
}
#GridView1 th {
    height: 29px !important;
    text-align: center !important;
    vertical-align: middle !important;
    border: 0 !important;
    padding: 0 !important;
    font-weight: normal !important;
}
/* 隔行变色 完全匹配静态页 */
#GridView1 .row { background:none; }
#GridView1 .altRow { background:none; }
    .auto-style1 {
        font-size: 16px;
        color: #12586c;
        font-weight: bold;
        height: 32px;
    }
</style>
</head>
<body topmargin="0" leftmargin="0">
    <form id="form1" runat="server">
        <div>
           <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left" valign="top" class="auto-style1">
      <table width="98%"  border="0" cellspacing="0" cellpadding="0">
        <tr valign="top">
          <td>【 家庭成员管理 】</td>
          <td align="right">
              <asp:ImageButton ID="btn_add" runat="server" ImageUrl="~/images/index_10_0.gif"
                  onMouseOver="MM_swapImage('btn_add','','../images/index_10_1.gif',1)"
                    onMouseOut="MM_swapImgRestore()"
                     onMouseDown="MM_swapImage('btn_add','','../images/index_10_2.gif',1)"
                         onMouseUp="MM_swapImage('btn_add','','../images/index_10_1.gif',1)" CommandName="Edit" Height="24px" OnClick="btn_add_Click" 
                  />
              <asp:ImageButton ID="btn_delete" runat="server" ImageUrl="~/images/index_13_0.gif" 
                  onMouseOver="MM_swapImage('btn_delete','','../images/index_13_1.gif',1)"
                 onMouseOut="MM_swapImgRestore()"
                     onMouseDown="MM_swapImage('btn_delete','','../images/index_13_2.gif',1)"
                        onMouseUp="MM_swapImage('btn_delete','','../images/index_13_1.gif',1)" OnClick="btn_delete_Click" CommandArgument="Delete" CommandName="Delete"  />
                  
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
            GridLines="None" 
            CellPadding="0" 
            CellSpacing="0"
            HeaderStyle-CssClass="bg03 text007"
            RowStyle-CssClass="row"
            AlternatingRowStyle-CssClass="altRow bg04"
            Width="98%"
            DataKeyNames="systemId" OnRowCommand="GridView1_RowCommand">
            
<AlternatingRowStyle CssClass="altRow bg04"></AlternatingRowStyle>
            
           <Columns>
        <asp:TemplateField HeaderText="全选" ItemStyle-Width="15%" HeaderStyle-Width="15%">
            <HeaderTemplate>
                <asp:CheckBox ID="cbx_header" runat="server" OnCheckedChanged="cbx_header_CheckedChanged" AutoPostBack="True" />
                <span class="text007">全选</span>
            </HeaderTemplate>
            <ItemTemplate>
                <asp:CheckBox ID="cbx_item" runat="server" />
            </ItemTemplate>

    <HeaderStyle Width="15%"></HeaderStyle>

    <ItemStyle Width="15%"></ItemStyle>
        </asp:TemplateField>
        <asp:BoundField DataField="userName" HeaderText="用户名" ItemStyle-Width="26%" HeaderStyle-Width="26%" >
    <HeaderStyle Width="26%"></HeaderStyle>

    <ItemStyle Width="26%"></ItemStyle>
                   </asp:BoundField>
        <asp:BoundField DataField="realName" HeaderText="真实姓名" ItemStyle-Width="31%" HeaderStyle-Width="31%" >
    <HeaderStyle Width="31%"></HeaderStyle>

    <ItemStyle Width="31%"></ItemStyle>
                   </asp:BoundField>
        <asp:TemplateField HeaderText="操作" ItemStyle-Width="20%" HeaderStyle-Width="20%">
            <ItemTemplate>
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/icon_set.gif" BorderWidth="0" CommandName="Edit"
             CommandArgument='<%# Eval("systemId") %>'  />
                &nbsp;&nbsp;
                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/delete.gif" BorderWidth="0"  CommandName="Delete"
            CommandArgument='<%# Eval("systemId") %>' />
            </ItemTemplate>

    <HeaderStyle Width="20%"></HeaderStyle>

    <ItemStyle Width="20%"></ItemStyle>
        </asp:TemplateField>
    </Columns>

    <HeaderStyle CssClass="bg03 text007"></HeaderStyle>

    <RowStyle CssClass="row"></RowStyle>
            </asp:GridView>
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FMSDB %>" SelectCommand="SELECT systemId, userName, realName FROM familyInformation"
    DeleteCommand="DELETE FROM familyInformation WHERE systemId=@systemId" InsertCommand="INSERT INTO [familyInformation] ([userId], [realName], [userName], [userPassword], [class]) VALUES (@userId, @realName, @userName, @userPassword, @class)">
            <DeleteParameters>
        <asp:Parameter Name="systemId" Type="Int32" />
    </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="userId" />
                <asp:Parameter Name="realName" />
                <asp:Parameter Name="userName" />
                <asp:Parameter Name="userPassword" />
                <asp:Parameter Name="class" />
            </InsertParameters>
        </asp:SqlDataSource>
        
        <hr class="bor005" size="1" />
	</td></tr>
</table>
        </div>
    </form>
</body>
</html>
