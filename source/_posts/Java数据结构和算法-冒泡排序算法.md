----------
title:  Java数据结构和算法-冒泡排序算法

date: 2020-3-18 23:31:02

toc: true

tag: 

- 数据结构
- 算法
- 排序算法
- 冒泡排序

----------

# 算法思想

冒泡排序属于一种典型的交换排序。

　　交换排序顾名思义就是通过元素的两两比较，判断是否符合要求，如过不符合就交换位置来达到排序的目的。冒泡排序名字的由来就是因为在交换过程中，类似水冒泡，小（大）的元素经过不断的交换由水底慢慢的浮到水的顶端。

　　冒泡排序的思想就是利用的比较交换，利用循环将第 i 小或者大的元素归位，归位操作利用的是对 n 个元素中相邻的两个进行比较，如果顺序正确就不交换，如果顺序错误就进行位置的交换。通过重复的循环访问数组，直到没有可以交换的元素，那么整个排序就已经完成了。

# 代码实现

```java
package com.data.structure;

import com.alibaba.fastjson.JSON;

/**
 * 冒泡排序算法
 * @author Taoweidong
 */
public class BubbleSort {

	public static void main(String[] args) {

		int[] arr = generateRandomArray(10, 100);

		System.out.println(JSON.toJSONString(arr));
		bubbleSort(arr);
		System.out.println(JSON.toJSONString(arr));
	}

	/**
	 * 冒泡排序实现数组排序:N个数字冒泡排序，总共要进行N-1趟比较，每趟的排序次数为(N-i)次比较
	 * @param arr 待排序的数据
	 */
	private static void bubbleSort(int[] arr) {

		if (arr == null || arr.length < 2) {
			return;
		}

		//需要进行arr.length趟比较:此处减去i的原因就是每进行一次比较就已经有一个最大的值或者最小的值沉到最后，下一次就少一趟比较
		for (int i = 0; i < arr.length - i; i++) {
			//第i趟比较
			for (int j = 0; j < arr.length - i - 1; j++) {
				// 开始进行比较，如果arr[j]比arr[j+1]的值大，那就交换位置
				if (arr[j + 1] < arr[j]) {
					int temp = arr[j];
					arr[j] = arr[j + 1];
					arr[j + 1] = temp;
				}
			}
		}
	}

	/**
	 * 产生一个随机数组，数组的长度和值都是随机的，
	 * @param size
	 * @param value
	 * @return
	 */
	public static int[] generateRandomArray(int size, int value) {
		//在java中，Math.random() ->double(0,1)
		//(int)((size+1)*Math.random())--->产生的是[0,size]之间的整数
		//生成长度随机的数组，数组的最大长度是size的长度
		int[] arr = new int[(int) ((size + 1) * Math.random())];
		for (int i = 0; i < arr.length; i++) {
			//针对数组中的每个值都可以随机一下，一个随机数减去另外一个随机数，可能产生正数，也可能产生负数
			//值也可以是随机的
			arr[i] = (int) (value * Math.random());
		}
		return arr;
	}

}

```



# 参考

- [https://www.cnblogs.com/bigdata-stone/p/10464243.html](https://www.cnblogs.com/bigdata-stone/p/10464243.html)
- [https://www.cnblogs.com/jyroy/p/11248691.html](https://www.cnblogs.com/jyroy/p/11248691.html)