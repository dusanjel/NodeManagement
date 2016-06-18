using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NodeManagement
{
    public class NodeManager : INodeManager
    {
        private readonly List<INode> _nodes;

        public NodeManager()
        {
            _nodes = new List<INode>();
        }

        public void AddNode(INode node)
        {
            if (!_nodes.Exists(x => x.NodeId == node.NodeId))
            {
                _nodes.Add(node);
            }
            else
            {
                throw new Exception(string.Format("Cannot add node. NodeId {0} already exists.", node.NodeId));
            }
        }

        public void RemoveNode(int nodeId)
        {
            var existingNode = GetNode(nodeId);

            if (existingNode != null)
            {
                _nodes.Remove(existingNode);
            }
            else
            {
                throw new Exception(string.Format("Cannot remove node. NodeId {0} does not exist", nodeId));
            }
        }

        public INode GetNode(int nodeId)
        {
            return _nodes.Find(x => x.NodeId == nodeId);
        }

        public ICollection<INode> GetNodes()
        {
            return _nodes;
        }
    }
}
