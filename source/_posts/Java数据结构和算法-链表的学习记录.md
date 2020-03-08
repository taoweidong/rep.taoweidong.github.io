----------
title: Java数据结构和算法-链表的学习记录

date: 2020-3-8 14:28:57

toc: true

tag: 

- 数据结构
- 算法
- 链表

----------

# 链表介绍

> 链表是有序的列表

- 链表是以节点的方式来存储数据的
- 每个节点包含data域，next域(指向下一个节点)
- 每个节点不一定是连续存储
- 链表分为带头结点的链表和没有头结点的链表，根据实际的需求来确定

# 代码实现

```java
package com.data.structure;

import java.util.Objects;

import com.alibaba.fastjson.JSON;

/**
 * 单链表实现
 * @author Taoweidong
 */
public class HeroNode {

	public static void main(String[] args) {

		HeroNode node = new HeroNode(10, "晁盖");
		HeroNode node1 = new HeroNode(25, "宋江");
		HeroNode node2 = new HeroNode(22, "武松");

		node.add(node2);
		node.add(node1);

		node.showAll();

	}

	/**
	 * 添加节点
	 * @param node
	 */
	public void add(HeroNode node) {

		// 遍历链表
		HeroNode tmp = this;
		while (Objects.nonNull(tmp.getNext())) {
			tmp = tmp.getNext();
		}
		tmp.setNext(node);
	}

	/**
	 * 显示链表信息
	 */
	public void showAll() {

		// 遍历链表
		HeroNode tmp = this;
		while (Objects.nonNull(tmp)) {
			System.out.printf("name=%s,age=%d\n", tmp.getName(), tmp.getAge());
			tmp = tmp.getNext();
		}
	}

	/**
	 * 年龄
	 */
	private int age;

	/**
	 * 姓名
	 */
	private String name;

	/**
	 * 下一个人物信息
	 */
	private HeroNode next;

	public HeroNode(int age, String name) {

		this.age = age;
		this.name = name;
	}

	@Override
	public String toString() {

		return JSON.toJSONString(this);
	}

	public int getAge() {

		return age;
	}

	public void setAge(int age) {

		this.age = age;
	}

	public String getName() {

		return name;
	}

	public void setName(String name) {

		this.name = name;
	}

	public HeroNode getNext() {

		return next;
	}

	public void setNext(HeroNode next) {

		this.next = next;
	}
}

```

