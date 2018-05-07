package com.detailList.dto;

import java.util.ArrayList;
import java.util.List;

public class NodeDto {
	private String nodeId;
	private String pid;
	private String text;
	private List<NodeDto> nodes;
	public String getNodeId() {
		return nodeId;
	}
	public void setNodeId(String nodeId) {
		this.nodeId = nodeId;
	}
	public NodeDto() {
		this.nodes=new ArrayList<NodeDto>();
	}
	public List<NodeDto> getNodes() {
		return nodes;
	}
	public void setNodes(List<NodeDto> nodes) {
		this.nodes = nodes;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
	public NodeDto(String nodeId, String pid, String text) {
		super();
		this.nodeId = nodeId;
		this.pid = pid;
		this.text = text;
		this.nodes=new ArrayList<NodeDto>();
	}
	/**
     * 生成一颗多叉树，根节点为root
     * @param Nodes 生成多叉树的节点集合
     * @return root
     */
    public NodeDto createTree(List<NodeDto> Nodes) {
        if (Nodes == null || Nodes.size() < 0)
            return null;
        NodeDto root = new NodeDto("50020020","0","三一集团");//根节点自定义，但是要和pid对应好
        // 将所有节点添加到多叉树中
        for (NodeDto node : Nodes) {
            if (node.getPid()!=null&&node.getPid().equals("50020020")) {//根节点自定义，但是要和pid对应好
                // 向根添加一个节点
                root.getNodes().add(node);
            } else {
                addChild(root, node);
            }
        }
        return root;
    }

    /**
     * 向指定多叉树节点添加子节点
     * @param Node 多叉树节点
     * @param child 节点
     */
    public void addChild(NodeDto Node, NodeDto child) {
        for (NodeDto item : Node.getNodes()) {
            if (item.getNodeId().equals(child.getPid())) {
                // 找到对应的父亲
                item.getNodes().add(child);
                break;
            } else {
                if (item.getNodes() != null && item.getNodes().size() > 0) {
                    addChild(item, child);
                }
            }
        }
    }

    /**
     * 遍历多叉树
     * @param Node 多叉树节点
     * @return
     */
    public String iteratorTree(NodeDto Node) {
        StringBuilder buffer = new StringBuilder();
        buffer.append("\n");
        if (Node != null) {
            for (NodeDto index : Node.getNodes()) {
                buffer.append(index.getNodeId() + ",");
                if (index.getNodes() != null && index.getNodes().size() > 0) {
                    buffer.append(iteratorTree(index));
                }
            }
        }
        buffer.append("\n");
        return buffer.toString();
    }
}
