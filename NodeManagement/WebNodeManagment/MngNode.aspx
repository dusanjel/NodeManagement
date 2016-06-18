<%@ Page Title="" Language="C#" MasterPageFile="~/NodeMngMasterPage.Master" AutoEventWireup="true" CodeBehind="MngNode.aspx.cs" Inherits="WebNodeManagment.MngNode" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNav" runat="server">
    <nav id="nav">
        <ul class="container" style="padding: 2px; margin: 2px; height: 25px;">           
            <li><asp:Button ID="PrButton" CssClass="BlueButton" runat="server" Text="Add Node"  Font-Size="Large" Height="30" Width="130" OnClick="PrButton_Click" /></li>                                                                   
            <li><asp:Button ID="ButtonRemove" CssClass="BlueButton" runat="server" Text="Remove"  Font-Size="Large" Height="30" Width="130" OnClick="ButtonRemove_Click" /></li>
            <li><asp:Button ID="ButtonOnline" CssClass="BlueButton" runat="server" Text="Set Online"  Font-Size="Large" Height="30" Width="130" OnClick="ButtonOnline_Click" /></li>
            <li><asp:Button ID="ButtonOffliine" CssClass="BlueButton" runat="server" Text="Set Offline"  Font-Size="Large" Height="30" Width="130" OnClick="ButtonOffliine_Click" /></li>          
        </ul>
    </nav>           
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapperTop wrapper-style1">
		<article id="statistics">
			<header>						
			</header>					
				<div class="row">                            
                    <div class="4u" style="width: 250px">                          
                        <br />   <div>Network Nodes</div>                         
                        <div style="width: 200px; height: 470px; overflow: scroll">
                            <asp:TreeView ID="TreeView1" runat="server" ShowLines="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged" LineImagesFolder="~/TreeLineImages">
                            </asp:TreeView>                                        
                        </div>                 
					</div>                            
					<div class="4u">                                
                        <section>
							   <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/insert.png" Height="50px" Width="50px" />                               
                        <section style="text-align: left">					
                            <div>
                                <span></span>                                        
                                
                                <asp:Label ID="NodeId" runat="server" Text="Node ID" CssClass="plbl" Height="20px">
                                </asp:Label>                                
                                <asp:RangeValidator id="RangeValidator1" runat="server"
                                    ControlToValidate="TextBoxNodeId"
                                    MaximumValue="999999"
                                    MinimumValue="0"
                                    Type="Integer"
                                    ErrorMessage="* ID as integer required"
                                    Display="none"
                                    ForeColor="Red">                                     
                                </asp:RangeValidator>
                                <asp:RequiredFieldValidator Display="none" ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Node ID is required (mandatory)" ControlToValidate="TextBoxNodeId" ForeColor="Red"></asp:RequiredFieldValidator>                                                                              
                                <asp:TextBox ID="TextBoxNodeId" runat="server" CssClass="pctrl" Height="40px" ControlToValidate="TextBoxNodeId"></asp:TextBox>
                                
                                
                                <asp:Label ID="City" runat="server" Text="City" CssClass="plbl" Height="20px">
                                </asp:Label>                                
                                <asp:RequiredFieldValidator Display="none" ID="RequiredFieldValidator2" runat="server" ErrorMessage="* City is required (mandatory)" ControlToValidate="TextBoxCity" ForeColor="Red"></asp:RequiredFieldValidator>                                                                              
                                <asp:TextBox ID="TextBoxCity" runat="server" CssClass="pctrl" Height="40px"></asp:TextBox>                                

                                <asp:Label ID="lblUpload" runat="server" Text="Upload threshold" CssClass="plbl" Height="20px">
                                </asp:Label>
                                <asp:RangeValidator id="RangeValidator2" runat="server"
                                    ControlToValidate="TextBoxNodeId"
                                    MaximumValue="999999"
                                    MinimumValue="0"
                                    Type="Integer"
                                    ErrorMessage="* Upload as integer required"
                                    Display="none"
                                    ForeColor="Red">                                     
                                </asp:RangeValidator>
                                <asp:RequiredFieldValidator Display="none" ID="RequiredFieldValidator3" runat="server" ErrorMessage="* Upload threshold is required (mandatory)" ControlToValidate="txtUpload" ForeColor="Red"></asp:RequiredFieldValidator> 
                                <asp:TextBox ID="txtUpload" runat="server" CssClass="pctrl" Height="40px"></asp:TextBox> 

                                <asp:Label ID="lblDownload" runat="server" Text="Download threshold" CssClass="plbl" Height="20px">
                                </asp:Label>
                                <asp:RangeValidator id="RangeValidator3" runat="server"
                                    ControlToValidate="txtDownload"
                                    MaximumValue="999999"
                                    MinimumValue="0"
                                    Type="Double"
                                    ErrorMessage="* Download as double required"
                                    Display="none"
                                    ForeColor="Red">                                     
                                </asp:RangeValidator>
                                <asp:RequiredFieldValidator Display="none" ID="RequiredFieldValidator4" runat="server" ErrorMessage="* Download threshold is required (mandatory)" ControlToValidate="txtDownload" ForeColor="Red"></asp:RequiredFieldValidator> 
                                <asp:TextBox ID="txtDownload" runat="server" CssClass="pctrl" Height="40px"></asp:TextBox>                        

                                <asp:Label ID="lblError" runat="server" Text="Error threshold" CssClass="plbl" Height="20px">
                                </asp:Label>
                                <asp:RangeValidator id="RangeValidator4" runat="server"
                                    ControlToValidate="txtError"
                                    MaximumValue="999999"
                                    MinimumValue="0"
                                    Type="Double"
                                    ErrorMessage="* Error as double required"
                                    Display="none"
                                    ForeColor="Red">                                     
                                </asp:RangeValidator>
                                <asp:RequiredFieldValidator Display="none" ID="RequiredFieldValidator5" runat="server" ErrorMessage="* Error threshold is required (mandatory)" ControlToValidate="txtError" ForeColor="Red"></asp:RequiredFieldValidator> 
                                <asp:TextBox ID="txtError" runat="server" CssClass="pctrl" Height="40px"></asp:TextBox>                        
                                
                                <asp:Label ID="lblClients" runat="server" Text="Clients threshold" CssClass="plbl" Height="20px">
                                </asp:Label>
                                <asp:RangeValidator id="RangeValidator5" runat="server"
                                    ControlToValidate="txtClients"
                                    MaximumValue="999999"
                                    MinimumValue="0"
                                    Type="Integer"
                                    ErrorMessage="* Clients as integer required"
                                    Display="none"
                                    ForeColor="Red">                                     
                                </asp:RangeValidator>
                                <asp:RequiredFieldValidator Display="none" ID="RequiredFieldValidator6" runat="server" ErrorMessage="* Clients threshold is required (mandatory)" ControlToValidate="txtClients" ForeColor="Red"></asp:RequiredFieldValidator> 
                                <asp:TextBox ID="txtClients" runat="server" CssClass="pctrl" Height="40px"></asp:TextBox>            
                                
                                <%--<asp:Label ID="LabelDate" runat="server" Text="Date" CssClass="plbl" Height="20px">
                                </asp:Label>
                                <br />
                                <asp:TextBox ID="TextBoxDate" style="background-image: url(Images/datepicker.png);  background-position: 95% 50%;   background-repeat:no-repeat" runat="server" Height="40px"></asp:TextBox>--%>
                                
                                                                                      
                                <%--<asp:Button ID="PrButton" CssClass="BlueButton" runat="server" Text="Add Node" Font-Size="Large" Height="40px" OnClick="PrButton_Click" />--%>
                                <asp:ValidationSummary ID="ValidationSummary1" ForeColor="Red" runat="server" />        
                                <asp:Label ID="StatusLabel" runat="server" CssClass="pright" ForeColor="#70BEDF" Height="20px"></asp:Label>                                                         
                            </div>	
						</section>                                 
                        </section>
					</div>
                    <div class="4u" style='float:right;'>                                
                        <section>						                           
                            <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/stat.png" Height="50px" Width="50px" />
                            <br />    
                            <br />                        
                            <div style="height: 310px; width: 350px;"> 
                                <span></span>  
                                <table style="width: 100%;">
                                    <tr>
                                        <td><asp:Label ID="lblID" style='float:left;' runat="server"  Height="45px" Text="ID:"></asp:Label></td>
                                        <td><asp:TextBox ID="txtID" style='float:left;'  width="130" Height="45px" runat="server" Text="" Font-Bold="True" Enabled="False"></asp:TextBox></td>                                        
                                    </tr>
                                    <tr>
                                        <td><asp:Label ID="lblConnection" style='float:left;' runat="server"  Height="45px" Text="Connection:"></asp:Label></td>
                                        <td><asp:TextBox ID="txtConnection" style='float:left;'  width="130" Height="45px" runat="server" Text="" Font-Bold="True" Enabled="False"></asp:TextBox></td>                                        
                                    </tr>
                                    <tr>
                                        <td><asp:Label ID="lblCity" style='float:left;' runat="server"  Height="45px" Text="City:"></asp:Label></td>
                                        <td><asp:TextBox ID="txtCity" style='float:left;'  width="130" Height="45px" runat="server" Text="" Font-Bold="True" Enabled="False"></asp:TextBox></td>                                       
                                    </tr>
                                    <tr>
                                        <td><asp:Label ID="lblOnlineTime" style='float:left;' runat="server"  Height="45px" Text="Online Time"></asp:Label></td>
                                        <td><asp:TextBox ID="txtOnlineTime" style='float:left;'  width="130" Height="45px" runat="server" Text="" Font-Bold="True" Enabled="False"></asp:TextBox></td>                                       
                                    </tr> 
                                    <tr>
                                        <td><asp:Label ID="lblConnectedClients" style='float:left;'  Height="45px" runat="server" Text="Clients"></asp:Label></td>
                                        <td><asp:TextBox ID="txtConnectedClients" style='float:left;'  width="130" Height="45px" runat="server" Text="" Font-Bold="True" Enabled="False"></asp:TextBox></td>                                       
                                        <td><asp:Label ID="lblConnectedClientsTr" style='float:left;' runat="server"  Height="45px" Text="" ForeColor="Red" Width="130"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td><asp:Label ID="lblDownloadUtilization" style='float:left;' Height="45px"  runat="server" Text="Download"></asp:Label></td>
                                        <td><asp:TextBox ID="txtDownloadUtilization" style='float:left;'  width="130" Height="45px" runat="server" Text="" Font-Bold="True" Enabled="False"></asp:TextBox></td>                                       
                                        <td><asp:Label ID="lblDownloadUtilizationTr" style='float:left;' runat="server"  Height="45px" Text="" ForeColor="Red"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td><asp:Label ID="lblUploadUtilization" style='float:left;' runat="server"  Height="45px" Text="Upload"></asp:Label></td>
                                        <td><asp:TextBox ID="txtUploadUtilization" style='float:left;'  width="130" Height="45px" runat="server" Text="" Font-Bold="True" Enabled="False"></asp:TextBox></td>                                       
                                       <td><asp:Label ID="lblUploadUtilizationTr" style='float:left;' runat="server"  Height="45px" Text="" ForeColor="Red"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td><asp:Label ID="lblErrorRate" style='float:left;' runat="server"  Height="45px" Text="ErrorRate"></asp:Label></td>
                                        <td><asp:TextBox ID="txtErrorRate" style='float:left;'  width="130" Height="45px" runat="server" Text="" Font-Bold="True" Enabled="False"></asp:TextBox> </td>                                       
                                        <td><asp:Label ID="lblErrorRateTr" style='float:left;' runat="server"  Height="45px" Text="" ForeColor="Red"></asp:Label></td>
                                    </tr>                                  
                                    
                                </table>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
                            </div>                                                        
                        </section>
					</div>                                                                                							
				</div>					
			<footer>	                                              
                                              
			</footer>
		</article>        
	    </div>	 
</asp:Content>
