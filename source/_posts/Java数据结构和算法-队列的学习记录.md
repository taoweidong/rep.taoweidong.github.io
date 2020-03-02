----------
title: Java数据结构和算法-队列的学习记录

date: 2020-2-29 11:08:38

toc: true

tag: 

- 数据结构
- 算法
- 队列

----------

# 队列的介绍

- 队列是一种**有序列表**，可以用**数组**或者**链表**来实现
- 遵循**先进先出**的原则。即：先存入队列的数据，要先取出。后存入的要后取出。
- **入队** 将一个数据放到队列尾部；**出队** 从队列的头部取出一个元素
- 队列的示意图：(使用数组模拟队列)

![队列的示意图](https://img-blog.csdnimg.cn/20200229111525181.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3Rhb3dlaWRvbmcx,size_16,color_FFFFFF,t_70)



![img](https://upload-images.jianshu.io/upload_images/2005932-76f596a15777939a.png?imageMogr2/auto-orient/strip|imageView2/2/w/1200)

<!-- more -->

## 数组模拟队列

### 思路分析

- 定时变量
  - maxLength：数组的最大容量
  - front：队列头
  - rear：队列尾
  - data：实际的数据存储
- 初始化是对变量进行初初始化
- 添加数据是移动rear尾指针，参照上图
- 移除数据时移动front头指针，参照上图

### 代码实现

```java
package com.data.structure;

/**
 * 队列的学习代码
 * @author Taoweidong
 */
public class QueueDemo {

	public static void main(String[] args) {

		ArrayQueue arrayQueue = new ArrayQueue(10);
		System.out.println(arrayQueue.isEmpty());
		arrayQueue.showQueue();
		// 添加队列数据
		arrayQueue.addQueue(10);
		arrayQueue.addQueue(5);
		arrayQueue.addQueue(8);
		arrayQueue.addQueue(9);
		// 展示队列中的所有数据
		arrayQueue.showQueue();

		// 查看队列头数据
		System.out.println(arrayQueue.headQueue());
		// 取出数据
		System.out.println(arrayQueue.getQueue());

	}

}

/**
 * 用数组实现队列的数据结构
 */
class ArrayQueue {

	/**
	 * 数组的最大容量
	 */
	private int maxLength;

	/**
	 * 队列头
	 */
	private int front;

	/**
	 * 队列尾
	 */
	private int rear;

	private int[] data;

	/**
	 * 创建队列的构造器
	 * @param maxLength 当前栈的最大容量
	 */
	public ArrayQueue(int maxLength) {

		this.maxLength = maxLength;
		data = new int[this.maxLength];
		// 指向队列的头部的前一个位置
		front = -1;
		// 指向队列的尾部
		rear = -1;
	}

	/**
	 * 判断当前队列是否已经满了
	 * @return True:已满 False:未满
	 */
	public boolean isFull() {

		return rear == maxLength - 1;
	}

	/**
	 * 判断当前队列是否为空
	 * @return True:为空 False:不为空
	 */
	public boolean isEmpty() {

		return rear == front;
	}

	/**
	 * 添加数据到队列中
	 * @param input 添加数据
	 */
	public void addQueue(int input) {

		if (isFull()) {
			System.out.println("队列已满，不能加入数据!");
		}
		// 移动指针
		rear++;
		data[rear] = input;

	}

	/**
	 * 获取队列的数据
	 * @return 当前队列中的第一个数据
	 */
	public int getQueue() {

		if (isEmpty()) {
			System.out.println("队列为空，无数据！");
			throw new RuntimeException("队列为空，无数据");
		}
		// 移动尾指针
		front++;
		return data[front];
	}

	/**
	 * 展示队列数据
	 */
	public void showQueue() {

		if (isEmpty()) {
			System.out.println("队列为空");
			return;
		}

		for (int i = 0; i < data.length; i++) {
			System.out.printf("arr[%d]=%d\n", i, data[i]);
		}
	}

	/**
	 * 队列头数据
	 * @return 队列头数据
	 */
	public int headQueue() {

		if (isEmpty()) {
			System.out.println("队列为空，无数据！");
			throw new RuntimeException("队列为空，无数据");
		}

		return data[front + 1];
	}

}

```

### 代码分析

1. 简单使用数组实现了队列的功能
2. 不是一个环形队列，对于已经取出数据的空间不能使用，导致空间浪费
3. 只能使用一次的队列，不能进行复用，可以使用循环队列进行改进

### 用数组模拟环形队列

```java
package com.data.structure;

/**
 * 队列的学习代码
 * @author Taoweidong
 */
public class QueueDemo2 {

	public static void main(String[] args) {

		CircleArrayQueue circleArrayQueue = new CircleArrayQueue(4);
		circleArrayQueue.addQueue(10);
		circleArrayQueue.addQueue(5);
		circleArrayQueue.addQueue(6);
		circleArrayQueue.showQueue();
		System.out.println("***********************");
		System.out.println(circleArrayQueue.getQueue());
		circleArrayQueue.showQueue();
		System.out.println("***********************");
		circleArrayQueue.addQueue(446);
		circleArrayQueue.showQueue();
		circleArrayQueue.addQueue(55);
	}

}

/**
 * 数组模拟环形队列
 */
class CircleArrayQueue {

	/**
	 * 队列容量
	 */
	private int maxLength;

	/**
	 * 队列头
	 */
	private int front;

	/**
	 * 队列尾
	 */
	private int rear;

	/**
	 * 数据
	 */
	private int[] data;

	public CircleArrayQueue(int maxLength) {

		this.maxLength = maxLength;
		// 初始化数组
		data = new int[this.maxLength];
	}

	/**
	 * 是否满.
	 * @return
	 */
	public boolean isFull() {

		return (rear + 1) % maxLength == front;
	}

	/**
	 * 是否为空
	 * @return
	 */
	public boolean isEmpty() {

		return rear == front;
	}

	public void addQueue(int input) {

		if (isFull()) {
			System.out.println("队列已满");
			return;
		}
		data[rear] = input;
		// 指定下一个位置：使用这种方式可以保证数组到最后一位以后获取的下一个位置为首位，行程循环链表的效果
		rear = (rear + 1) % maxLength;
	}

	public int getQueue() {

		if (isEmpty()) {
			throw new RuntimeException("队列为空，不能取数据");
		}
		int value = data[front];
		// 防止越界，产生循环链表的效果
		front = (front + 1) % maxLength;
		return value;
	}

	public void showQueue() {

		if (isEmpty()) {
			System.out.println("队列为空,没有数据！");
			return;
		}

		for (int i = front; i < front + size(); i++) {
			System.out.printf("arr[%d]=%d\n", i % maxLength, data[i % maxLength]);
		}

	}

	public int size() {

		return (rear + maxLength - front) % maxLength;
	}

	public int headQueue() {

		if (isEmpty()) {
			throw new RuntimeException("队列为空，没有数据了");
		}
		return data[front + 1];
	}
}

```





