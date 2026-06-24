<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>家庭财务管理系统</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript" src="js/common.js"></script>
<style type="text/css">
<!--
body {
	background-color: #c4c3c3;
}
-->
</style>
</head>
<body onLoad="MM_preloadImages('images/login_10.gif','images/login_09.gif')">
    <form id="form1" runat="server">
        <div>
                    <table width="502" border="0"  align="center" cellpadding="0" cellspacing="0" class="mar001">
                      <tr>
                        <td background="images/login_02.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="2%" align="left"><img src="images/login_03.gif" width="12" height="30"></td>
                            <td width="49%" align="left" class="text001">用户登录</td>
                            <td width="49%" align="right"><img src="images/login_01.gif" width="11" height="30"></td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td height="247" valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                          <tr valign="top">
                            <td width="35%" height="232"><img src="images/login_05.gif" width="178" height="269"></td>
                            <td width="65%" align="right" background="images/login_06.gif" class="bg01"><img src="images/login_04.gif" width="268" height="47" class="mar002">
                              <table width="90%" height="125"  border="0" cellpadding="0" cellspacing="0" class="mar003">
                              <tr>
                                <td width="32%" height="38" align="right" class="text002">用户名</td>
                                <td width="68%" align="left" valign="middle">
                                    <asp:TextBox ID="Text1" runat="server"></asp:TextBox>
                                  </td>
                              </tr>
                              <tr>
                                <td height="37" align="right" class="text002">密码</td>
                                <td align="left" valign="middle">
                                    <asp:TextBox ID="Text2" runat="server" TextMode="Password"></asp:TextBox>
                                  </td>
                              </tr>
                              <tr>
                                <td height="50">&nbsp;</td>
                                <td align="left" valign="bottom">&nbsp;<asp:ImageButton ID="but1" runat="server" Height="22px" ImageUrl="~/images/login_08.gif" style="margin-top: 0px" Width="66px" 
                                    onMouseOver="MM_swapImage('but1','','images/login_10.gif',1)" 
                                     onMouseOut="MM_swapImgRestore()" 
                                     onMouseDown="MM_swapImage('but1','','images/login_12.gif',1)" 
                                     onMouseUp="MM_swapImage('but1','','images/login_10.gif',1)" OnClick="btn_login_Click"
                                    
                                    />
                                    &nbsp;&nbsp;&nbsp;<asp:ImageButton ID="but2" runat="server" ImageUrl="~/images/login_07.gif"
                                        onMouseOver="MM_swapImage('but2','','images/login_09.gif',1)" 
                                        onMouseOut="MM_swapImgRestore()"
                                        onMouseDown="MM_swapImage('but2','','images/login_11.gif',1)" 
                                        onMouseUp="MM_swapImage('but2','','images/login_09.gif',1)"
                                        />
                                  </td>
                              </tr>
                            </table></td>
                          </tr>
                        </table></td>
                      </tr>
                    </table>
                        </div>
    </form>
    <p>
        &nbsp;</p>
</body>
</html>

