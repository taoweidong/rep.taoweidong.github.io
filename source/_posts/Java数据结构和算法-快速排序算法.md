----------
title:  Java数据结构和算法-快速排序算法

date: 2020-3-21 09:30:05

toc: true

tag: 

- 数据结构
- 算法
- 排序算法
- 快速排序算法

----------

# 算法思想

代码归档地址：[https://github.com/taoweidong/Java-Learning](https://github.com/taoweidong/Java-Learning)

快速排序的基本思想：通过一趟排序将待排记录分隔成独立的两部分，其中一部分记录的关键字均比另一部分的关键字小，则可分别对这两部分记录继续进行排序，以达到整个序列有序。

![https://images2017.cnblogs.com/blog/849589/201710/849589-20171015230936371-1413523412.gif](https://images2017.cnblogs.com/blog/849589/201710/849589-20171015230936371-1413523412.gif)



**思路分析**：快速排序采用双向查找的策略，每一趟选择当前所有子序列中的一个关键字作为枢纽轴，将子序列中比枢纽轴小的前移，比枢纽轴大的后移，当本趟所有子序列都被枢轴按上述规则划分完毕后将会得到新的一组更短的子序列，他们将成为下趟划分的初始序列集。对于每一个子序列的划分采用的迭代的方式，因此在结束条件上一定要注意，否则很容易造成堆栈溢出的问题

**时间复杂度**：最好情况（待排序列接近无序）时间复杂度为O(nlog2n)，最坏情况（待排序列接近有序）时间复杂度为O(n2)，平均时间复杂度为O(nlog2n)。

<!-- more -->

# 代码实现

```java
package com.data.structure;

import com.alibaba.fastjson.JSON;

/**
 * 快速排序实现
 * @author Taoweidong
 */
public class QuickSort {

	public static void main(String[] args) {

		int[] arr = { 10, 2, 3, 56, 24, 12, 9, 85, 533, 62 };
		System.out.println(JSON.toJSONString(arr));
		quickSort(arr, 0, arr.length - 1);
		System.out.println(JSON.toJSONString(arr));

	}

	/**
	 * 快速排序算法
	 * @param arr   待排序的数组
	 * @param left  左边区域
	 * @param right 右边区域
	 */
	public static void quickSort(int[] arr, int left, int right) {

		if (left >= right) {
			return;
		}
		//计算基准数据的位置
		int partition = partition(arr, left, right);
		//递归对左边进行快速排序
		quickSort(arr, left, partition - 1);
		//递归对右边进行快速排序
		quickSort(arr, partition + 1, right);

	}

	/**
	 * 核心逻辑：将给定数组的给定区间进行快速排序，并返回排序后基准值得为之，为后续的分区间迭代排序提供条件
	 * @param arr   待排序数据
	 * @param left  左边区间
	 * @param right 右边区间
	 * @return 基准值得位置
	 */
	private static int partition(int[] arr, int left, int right) {
		//将第一个数作为基准值。挖坑 设置基准值：初始基准值为最左边的数据
		int partition = arr[left];

		//使用循环实现分区操作
		while (left < right) {

			//从右向左移动j，找到第一个小于基准值的值 arr[right]
			while (left < right && arr[right] >= partition) {
				--right;
			}

			if (left < right) {
				arr[left] = arr[right];
				++left;
			}

			//从左向右移动i，找到第一个大于等于基准值的值 arr[left]
			while (left < right && arr[left] < partition) {
				left++;
			}

			if (left < right) {
				arr[right] = arr[left];
				--right;
			}
		}

		//使用基准值填坑，这就是基准值的最终位置
		arr[left] = partition;
		//返回基准值的位置索引
		return left;
	}

}
```



结果：

![结果](https://img-blog.csdnimg.cn/20200321092434175.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3Rhb3dlaWRvbmcx,size_16,color_FFFFFF,t_70)



# 参考

- [https://www.cnblogs.com/sunriseblogs/p/10009890.html](https://www.cnblogs.com/sunriseblogs/p/10009890.html)
- [https://www.cnblogs.com/yabushier/p/10394138.html](https://www.cnblogs.com/yabushier/p/10394138.html)

- [https://www.cnblogs.com/sunnylux/p/11041385.html](https://www.cnblogs.com/sunnylux/p/11041385.html)