package com.org.common.util;

import java.util.ArrayList;
import java.util.List;

import com.org.sys.model.Resource;

public class TreeNodeUtils {

	// 查找一级菜单目录
	public static List<Resource> buildTree(List<Resource> resources) {
		if (resources == null || resources.isEmpty() || resources.size() <= 0) {
			return null;
		}
		List<Resource> list = new ArrayList<Resource>();
		for (Resource node : resources) {
			if (node.getLevelPid() == 0) {
				// 查找顶级菜单
				list.add(build(node, resources));
			}
			node.setHasSubNode(true);
		}
		return list;
	}

	private static Resource build(Resource node, List<Resource> resources) {
		List<Resource> children = getChildren(node, resources);
		if (!children.isEmpty()) {
			for (Resource child : children) {
				build(child, resources);
			}
			node.setSubMenu(children);
		} else {
		}
		return node;
	}

	private static List<Resource> getChildren(Resource node,
			List<Resource> resources) {
		List<Resource> children = new ArrayList<Resource>();
		Integer id = node.getId();
		for (Resource child : resources) {
			if (id.intValue() == child.getLevelPid()) {
				children.add(child);
			}
		}
		return children;
	}

}
