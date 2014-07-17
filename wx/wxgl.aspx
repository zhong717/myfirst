<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="wxgl.aspx.cs" Inherits="wx.wxgl" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
    <!-- -->
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
    <ContentTemplate>
    
    <div style="height:200px;">
 <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="2" ForeColor="#333333" 
            onrowediting="GridView1_RowEditing" DataKeyNames="序号" 
            onrowcancelingedit="GridView1_RowCancelingEdit" 
            onrowupdating="GridView1_RowUpdating" 
            onpageindexchanging="GridView1_PageIndexChanging" 
            onrowcreated="GridView1_RowCreated" Width="100%" Caption="外协工作计划" 
            CaptionAlign="Top">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="月份" HeaderText="月份" ReadOnly="True" ControlStyle-Width="70px" />
            <asp:BoundField DataField="工作项目" HeaderText="工作项目" ReadOnly="True" ControlStyle-Width="100px" />
            <asp:BoundField DataField="工作内容" HeaderText="工作内容" ReadOnly="True" ControlStyle-Width="100px" />
            <asp:BoundField DataField="计划下达" HeaderText="计划内容" ReadOnly="True" />
            <asp:BoundField DataField="完成汇报" HeaderText="完成汇报" />
            <asp:TemplateField HeaderText="完成情况" ControlStyle-Width="70px">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>Doing</asp:ListItem>
                        <asp:ListItem>Done</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("完成情况") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                        CommandName="Update" Text="提交" />
                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="取消" />
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#FFD39B" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>

    </div>
    <div>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            onrowcancelingedit="GridView2_RowCancelingEdit" 
            onrowediting="GridView2_RowEditing" onrowcreated="GridView2_RowCreated" 
            Width="100%" DataKeyNames="序号" onrowupdating="GridView2_RowUpdating" 
            Caption="实际生产计划" CellPadding="4" ForeColor="#333333">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="计划月份" HeaderText="月份" ReadOnly="True" />
            <asp:BoundField DataField="产品名称" HeaderText="产品名称" ReadOnly="True" />
            <asp:BoundField DataField="交付日期" HeaderText="交付日期" ReadOnly="True" 
                DataFormatString="{0:yyyy-MM-dd}" />
            <asp:TemplateField HeaderText="转件">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" onclick="WdatePicker()" Text='<%# Bind("实际转件日期","{0:yyyy-M-d}") %>'></asp:TextBox>  
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("实际转件日期","{0:yyyy-M-d}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="粗加工">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" onclick="WdatePicker()" Text='<%# Bind("实际粗加工日期","{0:yyyy-M-d}") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("实际粗加工日期","{0:yyyy-M-d}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="精加工">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" onclick="WdatePicker()" Text='<%# Bind("实际精加工日期","{0:yyyy-M-d}") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("实际精加工日期","{0:yyyy-M-d}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="钳工">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" onclick="WdatePicker()" Text='<%# Bind("实际钳工日期","{0:yyyy-M-d}") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("实际钳工日期","{0:yyyy-M-d}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="清洗包装">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" onclick="WdatePicker()" Text='<%# Bind("实际清洗包装日期","{0:yyyy-M-d}") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("实际清洗包装日期","{0:yyyy-M-d}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="发运">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" onclick="WdatePicker()" Text='<%# Bind("实际发运日期","{0:yyyy-M-d}") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("实际发运日期","{0:yyyy-M-d}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="True" 
                        CommandName="Update" Text="更新" />
                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="取消" />
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#FFD39B" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
    </div>

    <div>
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False"
        Width="100%" DataKeyNames="序号" Caption="关键序质量状况" CellPadding="4" 
            ForeColor="#333333" onrowediting="GridView3_RowEditing" 
            onrowcancelingedit="GridView3_RowCancelingEdit" 
            onrowupdating="GridView3_RowUpdating" >
            <Columns>
                <asp:BoundField DataField="计划月份" HeaderText="月份" ReadOnly="True" />
                <asp:BoundField DataField="产品名称" HeaderText="产品名称" ReadOnly="True" />
                <asp:BoundField DataField="交付日期" HeaderText="交付日期" ReadOnly="True"
                DataFormatString="{0:yyyy-MM-dd}" />
                <asp:TemplateField HeaderText="转件节点">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server">
                            <asp:ListItem>正常</asp:ListItem>
                            <asp:ListItem>异常</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("转件节点质量状况") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="粗加节点">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList3" runat="server">
                            <asp:ListItem>正常</asp:ListItem>
                            <asp:ListItem>异常</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("粗加节点质量状况") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="精加">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList4" runat="server">
                            <asp:ListItem>正常</asp:ListItem>
                            <asp:ListItem>异常</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("精加节点质量状况") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="钳工">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList5" runat="server">
                            <asp:ListItem>正常</asp:ListItem>
                            <asp:ListItem>异常</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("钳工节点质量状况") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="包装">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList6" runat="server">
                            <asp:ListItem>正常</asp:ListItem>
                            <asp:ListItem>异常</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("包装节点质量状况") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="发运">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList7" runat="server">
                            <asp:ListItem>正常</asp:ListItem>
                            <asp:ListItem>异常</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("发运节点质量状况") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="备注" HeaderText="备注" />
                <asp:TemplateField HeaderText="评审意见">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList8" runat="server">
                            <asp:ListItem>转序</asp:ListItem>
                            <asp:ListItem>SDR</asp:ListItem>
                            <asp:ListItem>报废</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("评审意见") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="责任单位">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList9" runat="server">
                            <asp:ListItem>铸造问题</asp:ListItem>
                            <asp:ListItem>加工问题</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("责任单位") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:Button ID="LinkButton1" runat="server" CausesValidation="True" 
                            CommandName="Update" Text="更新"></asp:Button>
                        &nbsp;<asp:Button ID="LinkButton2" runat="server" CausesValidation="False" 
                            CommandName="Cancel" Text="取消"></asp:Button>
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
        <EditRowStyle BackColor="#FFD39B" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:TDMConnectionString %>" 
            SelectCommand="select * from liul_yxgl_xmgl_wxkz"></asp:SqlDataSource>
    </div>
        

        


    </ContentTemplate>
    </asp:UpdatePanel>

<!--1234 -->
</asp:Content>
