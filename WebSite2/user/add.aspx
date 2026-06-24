<%@ Page Language="C#" AutoEventWireup="true" CodeFile="add.aspx.cs" Inherits="user_add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>家庭成员管理--添加</title>
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
          <span class="text001">&nbsp;&nbsp;新增家庭成员</span></td>
        </tr>

    </table>
      <table width="98%"  border="0" cellpadding="0" cellspacing="0" class="text008">
        <tr align="center">
          <td width="12%" height="35" align="right">用户编号</td>
          <td width="88%" align="left">
              <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr align="center">
          <td width="12%" height="35" align="right">用户名</td>
          <td width="88%" align="left">
              <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr align="center" class="bg04">
          <td height="35" align="right">真实姓名</td>
          <td align="left">
              <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr align="center">
          <td height="35" align="right">输入密码</td>
          <td align="left">
              <asp:TextBox ID="TextBox4" runat="server" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr align="center" class="bg04">
          <td height="35" align="right">确认密码</td>
          <td align="left">
              <asp:TextBox ID="TextBox5" runat="server" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
      </table>
      <table width="98%" border="0" cellpadding="0" cellspacing="0" class="bor001">
        <tr>
          <td width="22%" height="40" align="center" >
              &nbsp;
              <asp:ImageButton ID="ImageButton1" runat="server" Height="31px" Width="88px" OnClick="btn_save_Click" onMouseOver="MM_swapImage('Image1','','../images/index_12_1.gif',1)" 
onMouseOut="MM_swapImgRestore()" 
onMouseDown="MM_swapImage('Image1','','../images/index_12_2.gif',1)" ImageUrl="~/images/index_12_0.gif" />
              &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" OnClick="btn_cancel_Click" ImageUrl="~/images/login_09.gif" 
                  onMouseOver="MM_swapImage('Image2','','../images/login_09.gif',1)" 
onMouseOut="MM_swapImgRestore()" 
onMouseDown="MM_swapImage('Image2','','../images/login_11.gif',1)" 
onMouseUp="MM_swapImage('Image2','','../images/login_09.gif',1)"/>
              &nbsp;&nbsp;</td>
          <td width="78%" align="right">&nbsp;          </td>
        </tr>
      </table></td>
  </tr>
</table>
    </form>
</body>
</html>

