using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NodeManagement;

namespace WebNodeManagment
{
    public partial class MngNode : System.Web.UI.Page
    {      
        static NodeManager nMng = new NodeManager();
        static TreeNode TreePNode = new TreeNode();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {                
            }
            try
            {
                getConnectionStatus();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #region Thresholds

        public int getClientsThreshold()
        {
            try
            {
                int nodeID = Int32.Parse(TreeView1.SelectedNode.Value);
                Node nd = (Node)nMng.GetNode(nodeID);
                return (int)nd.ClientsThreshold;
            }
            catch (Exception ex)
            {
                throw ex;
            }            
        }

        public int getDownloadThreshold()
        {
            try
            {
                int nodeID = Int32.Parse(TreeView1.SelectedNode.Value);
                Node nd = (Node)nMng.GetNode(nodeID);
                return (int)nd.DownloadThreshold;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public int getErrorThreshold()
        {
            try
            {
                int nodeID = Int32.Parse(TreeView1.SelectedNode.Value);
                Node nd = (Node)nMng.GetNode(nodeID);
                return (int)nd.ErrorThreshold;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public int getUploadThreshold()
        {
            try
            {
                int nodeID = Int32.Parse(TreeView1.SelectedNode.Value);
                Node nd = (Node)nMng.GetNode(nodeID);
                return (int)nd.UploadThreshold;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion 

        public void createNode(int id,string City)
        {
            try
            {
                Node newNode = new Node(id, City, new Random());
                newNode.UploadThreshold = float.Parse(txtUpload.Text);
                newNode.DownloadThreshold = float.Parse(txtDownload.Text);
                newNode.ErrorThreshold = float.Parse(txtError.Text);
                newNode.ClientsThreshold = uint.Parse(txtClients.Text);

                nMng.AddNode(newNode);

                TreeNode TreeCNode = new TreeNode
                {
                    Text = id.ToString(),
                    Value = id.ToString()
                };
                //TreePNode.ChildNodes.Add(TreeCNode);
                TreeView1.Nodes.Add(TreeCNode);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }       

        protected void PrButton_Click(object sender, EventArgs e)
        {           
            createNode(Int32.Parse(TextBoxNodeId.Text),TextBoxCity.Text);            
        }

        protected void ButtonRemove_Click(object sender, EventArgs e)
        {
            try
            {
                int nodeID = Int32.Parse(TreeView1.SelectedNode.Value);
                nMng.RemoveNode(nodeID);
                TreeView1.Nodes.Remove(TreeView1.SelectedNode);
            }
            catch (Exception ex)
            {
                throw ex;
            }          
        }

        protected void ButtonOnline_Click(object sender, EventArgs e)
        {
            try
            {
                int nodeID = Int32.Parse(TreeView1.SelectedNode.Value);

                foreach (Node nd in nMng.GetNodes())
                {
                    if (nd.NodeId == nodeID)
                    {
                        nd.SetOnline();
                    }
                }
                getConnectionStatus();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void ButtonOffliine_Click(object sender, EventArgs e)
        {
            try
            {
                int nodeID = Int32.Parse(TreeView1.SelectedNode.Value);

                foreach (Node nd in nMng.GetNodes())
                {
                    if (nd.NodeId == nodeID)
                    {
                        nd.SetOffline();
                    }
                }
                getConnectionStatus();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
        {
            getConnectionStatus();
        }

        public void getConnectionStatus()
        {
            try
            {
                if (TreeView1.SelectedNode != null)
                {
                    int nodeID = Int32.Parse(TreeView1.SelectedNode.Value);
                    foreach (Node nd in nMng.GetNodes())
                    {
                        if (nd.NodeId == nodeID)
                        {
                            txtConnection.Text = nd.IsOnline.ToString();
                            txtID.Text = nd.NodeId.ToString();
                            txtCity.Text = nd.City;
                            txtConnectedClients.Text = nd.ConnectedClients.ToString();
                            txtDownloadUtilization.Text = nd.DownloadUtilization.ToString();
                            txtErrorRate.Text = nd.ErrorRate.ToString();
                            txtOnlineTime.Text = nd.OnlineTime.ToString();
                            txtCity.Text = nd.UploadUtilization.ToString();
                            TextBoxNodeId.Text = nd.NodeId.ToString();

                            if (nd.ConnectedClients > getClientsThreshold())
                            {
                                lblConnectedClientsTr.Text = "Threshold";
                            }
                            else
                                lblConnectedClientsTr.Text = "";
                            if (nd.UploadUtilization > getUploadThreshold())
                            {
                                lblErrorRateTr.Text = "Threshold";
                            }
                            else
                                lblErrorRateTr.Text = "";
                            if (nd.DownloadThreshold > getDownloadThreshold())
                            {
                                lblDownloadUtilizationTr.Text = "Threshold";
                            }
                            else
                                lblDownloadUtilizationTr.Text = "";
                            if (nd.ErrorRate > getErrorThreshold())
                            {
                                lblErrorRateTr.Text = "Threshold";
                            }
                            else
                                lblErrorRateTr.Text = "";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}