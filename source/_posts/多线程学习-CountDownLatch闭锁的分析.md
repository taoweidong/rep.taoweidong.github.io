----------
title: 多线程学习-CountDownLatch闭锁的分析

date: 2019-9-7 12:07:30

toc: true

tag: 

- Java
- 多线程
- CountDownLatch

----------

# 概念
闭锁是一种同步工具类，可以延迟线程的进度直到闭锁到达终止状态。Latch在英语中就是门栓的意思，所以形象地说闭锁就相当于一扇门，在日常生活中我们都遇到过类似的场景，进入一个场馆前，必须达到一定的条件，比如活动开始前半小时可以入场；如果来早了的话，对不起，以便等着。

CountDownLatch 在多线程中也是这样的作用，在闭锁到达结束状态前，这扇门是一直关闭的，不允许任何线程通过，当到达结束状态时，这扇门就保持打开，并且是永久的处于打开状态；也就是说这个门是一次性的。 如同柏林墙一样，推到了就建不起来了。

**闭锁可以用来确保某些活动直到其他活动都完成后才继续执行**。CountDownLatch是一种灵活的闭锁实现，它可以使一个或多个线程 等待一组事件的发生。

**闭锁包括一个计数器，该计数器被初始化为一个正整数，表示等待的事件数量。有一等待时间发生时，使用countDown方法递减计数 器，而await方法就是等待所有事件的发生，也就是计数器的值为0.如果计数器的值不为0 那么await 方法需要一直等待**。

参考： https://www.cnblogs.com/wei-zw/p/8797757.html

# 示例代码

```java
package com.juc;
import java.util.concurrent.CountDownLatch;

/**
 * CountDownLatch闭锁：在完成某些运算时，只有其他的所有线程的运算全部完成时，当前运算才继续执行
 */
public class TestCountDownLatch {

	public static void main(String[] args) {
		final CountDownLatch latch = new CountDownLatch(5);
		LatchDemo lt = new LatchDemo(latch);

		long start = System.currentTimeMillis();
		for (int i = 0; i < 5; i++) {
			new Thread(lt).start();
		}
		
		try {
			latch.await();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

		long end = System.currentTimeMillis();
		System.out.println("耗费时间为:" + (end - start));
	}
}

class LatchDemo implements Runnable {

	private CountDownLatch latch;
	public LatchDemo(CountDownLatch latch) {
		this.latch = latch;
	}

	@Override
	public void run() {
		synchronized (this) {
			try {
				for (int i = 0; i < 50000; i++) {
					if (i % 2 == 0) {
						System.out.println(i);
					}
				}
			} finally {
				latch.countDown();
			}
		}
	}
}

```

