<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Twitser</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body">
    <form id="form1" runat="server">
    <div>
    
        <asp:Image ID="Image6" runat="server" Height="128px" Width="332px" 
            ImageUrl="~/Content/images/twitser.gif" />
        <div class="welcome">
        <asp:Label ID="Label15" runat="server" Text="Label" 
            Font-Size="22px"></asp:Label>
    </div>
        <br />
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
    <ajaxToolkit:TabContainer ID="TabContainer1" runat="server" Height="100%" 
            Width="60%" ActiveTabIndex="2" BackColor="#003399" 
            VerticalStripWidth="0px" >
        <ajaxToolkit:TabPanel ID="TabPanel1" runat="server" HeaderText="User Info">
            <ContentTemplate>
            <div class="ui1">
                <asp:Image ID="Image1" runat="server" Height="69px" Width="95px" />
                <br />
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                <br />
                <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                <br /></div>
                <div class="ui2">
                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                <br />
                <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                <br />
                <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                <br />
                <asp:Label ID="Label16" runat="server" Text="Label"></asp:Label><br />
                <asp:Label ID="Label17" runat="server" Text="Label"></asp:Label><br />
                <asp:Label ID="Label18" runat="server" Text="Label"></asp:Label></div>
            </ContentTemplate>
        </ajaxToolkit:TabPanel>
        <ajaxToolkit:TabPanel ID="TabPanel2" runat="server" HeaderText="Post Tweet">
        <ContentTemplate>
        
        <asp:TextBox ID="TextBox1" runat="server" Height="71px" 
            Width="400px" TextMode="MultiLine"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Post Tweet" 
            Height="33px" onclick="Button1_Click" />
            <br />
        <asp:Label ID="Label6" runat="server"></asp:Label>
        </ContentTemplate>
        </ajaxToolkit:TabPanel>
        <ajaxToolkit:TabPanel ID="TabPanel3" runat="server" HeaderText="Search Twitter">
        <ContentTemplate>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Search" />
        <br />
        <asp:GridView ID="GridView2" runat="server" 
            onpageindexchanging="GridView2_PageIndexChanging" PageSize="50" 
                AutoGenerateColumns="False" GridLines="Horizontal" Width="100%" 
                Height="100%">
             <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Image ID="Image4" ImageUrl='<%# Eval("pimg") %>' runat="server"/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Search results">
                <ItemTemplate>
                    <asp:Label ID="Label11" Text='<%# Eval("name") %>' runat="server" />&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label12" Text='<%# Eval("scname") %>' runat="server" />
                    <br /><asp:Label ID="lblsearch" Text='<%# Eval("stat") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        
    </ContentTemplate>
        </ajaxToolkit:TabPanel>
    

        <ajaxToolkit:TabPanel ID="TabPanel4" runat="server" HeaderText="TabPanel4">
            <HeaderTemplate>
                Recent status
            </HeaderTemplate>
            <ContentTemplate>
                <asp:GridView ID="GridView1" runat="server" 
                    AutoGenerateColumns="False" GridLines="Horizontal" 
                    OnPageIndexChanging="GridView1_PageIndexChanging" Width="100%" 
                    PageSize="50" Height="100%">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("pimg") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Recently Tweeted">
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Eval("name") %>' />
                                &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label10" runat="server" Text='<%# Eval("scname") %>' />
                                <br />
                                <asp:Label ID="lblstat" runat="server" Text='<%# Eval("stat") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </ContentTemplate>
        </ajaxToolkit:TabPanel>
        <ajaxToolkit:TabPanel ID="TabPanel5" runat="server" HeaderText="TabPanel5">
            <HeaderTemplate>
                Recent Retweets
            </HeaderTemplate>
            <ContentTemplate>
                <asp:GridView ID="GridView3" runat="server" 
                    AutoGenerateColumns="False" GridLines="Horizontal" Height="100%" 
                    OnPageIndexChanging="GridView3_PageIndexChanging" Width="100%" 
                    PageSize="50">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image3" runat="server" ImageUrl='<%# Eval("pimg") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Recently ReTweeted by you">
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("name") %>' />
                                &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label8" runat="server" Text='<%# Eval("scname") %>' />
                                <br />
                                <asp:Label ID="lblretweet" runat="server" Text='<%# Eval("stat") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </ContentTemplate>
        </ajaxToolkit:TabPanel>
        <ajaxToolkit:TabPanel ID="TabPanel6" runat="server" HeaderText="TabPanel6">
            <HeaderTemplate>
                Recent Mentions
            </HeaderTemplate>
            <ContentTemplate>
                <asp:GridView ID="GridView4" runat="server"  
                    AutoGenerateColumns="False" GridLines="Horizontal" Height="100%" 
                    OnPageIndexChanging="GridView4_PageIndexChanging" Width="100%" 
                    PageSize="50">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image5" runat="server" ImageUrl='<%# Eval("pimg") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Recent Mentions">
                            <ItemTemplate>
                                <asp:Label ID="Label13" runat="server" Text='<%# Eval("name") %>' />
                                &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label14" runat="server" Text='<%# Eval("scname") %>' />
                                <br />
                                <asp:Label ID="lblretweet0" runat="server" Text='<%# Eval("stat") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </ContentTemplate>
        </ajaxToolkit:TabPanel>
    

    </ajaxToolkit:TabContainer>
    </div>
    </form>
</body>
</html>
