<%@ Page Language="C#" AutoEventWireup="true" CodeFile="add.aspx.cs" Inherits="item_add" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>收支项目管理--添加</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript" src="../js/common.js"></script>
</head>
<body leftmargin="0" topmargin="0" onLoad="MM_preloadImages('../images/login_10.gif','../images/login_12.gif','../images/login_09.gif','../images/login_11.gif')">
    <form id="form1" runat="server">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="32" align="left" valign="top" class="text006"><table width="98%" border="0" cellspacing="0" cellpadding="0">
        <tr valign="top">
          <td>【 收支项目管理 】</td>
          <td align="right">&nbsp;</td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td height="215" valign="top"><table width="98%" border="0" cellspacing="0" cellpadding="0">
      <tr align="left" class="bg03">
        <td width="100%" height="29"><span class="text001">&nbsp;&nbsp;新增收支分类</span></td>
      </tr>
    </table>
      <table width="98%" border="0" cellpadding="0" cellspacing="0" class="text008">
        <tr align="center">
          <td width="12%" height="35" align="right">收支类型</td>
          <td width="88%" align="left">
              <asp:RadioButtonList ID="rblItemType" runat="server" RepeatDirection="Horizontal" CssClass="inp005">
                  <asp:ListItem Value="1" Selected="True">收入</asp:ListItem>
                  <asp:ListItem Value="0">支出</asp:ListItem>
              </asp:RadioButtonList>
          </td>
        </tr>
        <tr align="center" class="bg04">
          <td width="12%" height="35" align="right">项目名称</td>
          <td width="88%" align="left"><asp:TextBox ID="txtItemName" runat="server" CssClass="inp001"></asp:TextBox></td>
        </tr>
        <tr align="center">
          <td width="12%" height="35" align="right">排序号</td>
          <td width="88%" align="left"><asp:TextBox ID="txtSortOrder" runat="server" CssClass="inp001" Text="1"></asp:TextBox></td>
        </tr>
      </table>
      <table width="98%" border="0" cellpadding="0" cellspacing="0" class="bor001">
        <tr>
          <td width="22%" height="40" align="center">
              <asp:ImageButton ID="btn_save" runat="server" ImageUrl="~/images/index_12_0.gif" Width="75" Height="24"
                  onMouseOver="MM_swapImage('Image1','','../images/index_12_1.gif',1)"
                  onMouseOut="MM_swapImgRestore()"
                  onMouseDown="MM_swapImage('Image1','','../images/index_12_2.gif',1)"
                  onMouseUp="MM_swapImage('Image1','','../images/index_12_1.gif',1)" OnClick="btn_save_Click" />
              &nbsp;&nbsp;&nbsp;&nbsp;
              <asp:ImageButton ID="btn_cancel" runat="server" ImageUrl="~/images/login_07.gif" Width="75" Height="24"
                  onMouseOver="MM_swapImage('Image2','','../images/login_09.gif',1)"
                  onMouseOut="MM_swapImgRestore()"
                  onMouseDown="MM_swapImage('Image2','','../images/login_11.gif',1)"
                  onMouseUp="MM_swapImage('Image2','','../images/login_09.gif',1)" OnClick="btn_cancel_Click" />
          </td>
          <td width="78%" align="right">&nbsp;</td>
        </tr>
      </table></td>
  </tr>
</table>
    </form>
</body>
</html>
