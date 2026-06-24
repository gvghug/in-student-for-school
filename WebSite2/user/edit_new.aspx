<%@ Page Language="C#" AutoEventWireup="true" CodeFile="edit_new.aspx.cs" Inherits="user_edit_new" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>家庭成员管理--编辑</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript" src="../js/common.js"></script>
</head>
<body leftmargin="0" topmargin="0" onLoad="MM_preloadImages('../images/login_10.gif','../images/login_12.gif','../images/login_09.gif','../images/login_11.gif')">
    <form id="form1" runat="server">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="32" align="left" valign="top" class="text006"><table width="98%"  border="0" cellspacing="0" cellpadding="0">
        <tr valign="top">
          <td>【 家庭成员管理 】</td>
          <td align="right">&nbsp;</td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td height="215" valign="top"><table width="98%"  border="0" cellspacing="0" cellpadding="0">
      <tr align="left" class="bg03">
        <td width="100%" height="29">
          <span class="text001">&nbsp;&nbsp;修改家庭成员信息</span></td>
        </tr>

    </table>
      <table width="98%"  border="0" cellpadding="0" cellspacing="0" class="text008">
        <tr align="center">
          <td width="12%" height="35" align="right">用户编号</td>
          <td width="88%" align="left">
              <asp:TextBox ID="txtUserId" runat="server" CssClass="inp001"></asp:TextBox>
            </td>
        </tr>
        <tr align="center">
          <td width="12%" height="35" align="right">用户名</td>
          <td width="88%" align="left">
              <asp:TextBox ID="txtUserName" runat="server" CssClass="inp001"></asp:TextBox>
            </td>
        </tr>
        <tr align="center" class="bg04">
          <td height="35" align="right">真实姓名</td>
          <td align="left">
              <asp:TextBox ID="txtRealName" runat="server" CssClass="inp001"></asp:TextBox>
            </td>
        </tr>
        <tr align="center">
          <td height="35" align="right">输入密码</td>
          <td align="left">
              <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="inp001"></asp:TextBox>
            </td>
        </tr>
        <tr align="center" class="bg04">
          <td height="35" align="right">确认密码</td>
          <td align="left">
              <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="inp001"></asp:TextBox>
            </td>
        </tr>
      </table>
      <table width="98%" border="0" cellpadding="0" cellspacing="0" class="bor001">
        <tr>
          <td width="24%" height="40" align="center" >
              <asp:ImageButton ID="btn_save" runat="server" ImageUrl="~/images/index_12_0.gif" Width="75" Height="24"
                  onMouseOver="MM_swapImage('Image1','','../images/index_12_1.gif',1)"
                  onMouseOut="MM_swapImgRestore()"
                  onMouseDown="MM_swapImage('Image1','','../images/index_12_2.gif',1)"
                  onMouseUp="MM_swapImage('Image1','','../images/index_12_1.gif',1)"
                  OnClick="btn_save_Click" />
              &nbsp;&nbsp;&nbsp;&nbsp;
              <asp:ImageButton ID="btn_cancel" runat="server" ImageUrl="~/images/login_07.gif" Width="75" Height="24"
                  onMouseOver="MM_swapImage('Image2','','../images/login_09.gif',1)"
                  onMouseOut="MM_swapImgRestore()"
                  onMouseDown="MM_swapImage('Image2','','../images/login_11.gif',1)"
                  onMouseUp="MM_swapImage('Image2','','../images/login_09.gif',1)"
                  OnClick="btn_cancel_Click" />
          </td>
          <td width="76%" align="right">&nbsp;</td>
        </tr>
      </table></td>
  </tr>
</table>
    </form>
</body>
</html>
