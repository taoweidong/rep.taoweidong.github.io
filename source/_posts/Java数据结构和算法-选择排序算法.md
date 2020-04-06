----------
title:  Java数据结构和算法-选择排序算法

date: 2020-4-6 12:06:49

toc: true

tag: 

- 数据结构
- 算法
- 排序算法
- 选择排序算法

----------

# 算法思想

表现**最稳定的排序算法之一**，因为**无论什么数据进去都是O(n2)的时间复杂度**，所以用到它的时候，数据规模越小越好。唯一的好处可能就是不占用额外的内存空间了吧。理论上讲，选择排序可能也是平时排序一般人想到的最多的排序方法了吧。

选择排序(Selection-sort)是一种简单直观的排序算法。它的工作原理：首先在未排序序列中找到最小（大）元素，存放到排序序列的起始位置，然后，再从剩余未排序元素中继续寻找最小（大）元素，然后放到已排序序列的末尾。以此类推，直到所有元素均排序完毕。 

# 代码实现

n个记录的直接选择排序可经过n-1趟直接选择排序得到有序结果。具体算法描述如下：

- 初始状态：无序区为R[1..n]，有序区为空；
- 第i趟排序(i=1,2,3…n-1)开始时，当前有序区和无序区分别为R[1..i-1]和R(i..n）。该趟排序从当前无序区中-选出关键字最小的记录 R[k]，将它与无序区的第1个记录R交换，使R[1..i]和R[i+1..n)分别变为记录个数增加1个的新有序区和记录个数减少1个的新无序区；
- n-1趟结束，数组有序化了。

```java
package com.sort;

import com.alibaba.fastjson.JSON;

/**
 * 选择排序
 * 首先在未排序序列中找到最小（大）元素，存放到排序序列的起始位置，
 * 然后，再从剩余未排序元素中继续寻找最小（大）元素，然后放到已排序序列的末尾。
 * 以此类推，直到所有元素均排序完毕
 * 算法分析：最佳情况：T(n) = O(n2)  最差情况：T(n) = O(n2)  平均情况：T(n) = O(n2)
 *
 * @author Taoweidong
 */
public class SelectionSort {
    public static void main(String[] args) {
        int[] arr = {10, 2, 3, 56, 24, 12, 9, 85, 533, 62};
        System.out.println(JSON.toJSONString(arr));
        selectionSort(arr);
        System.out.println(JSON.toJSONString(arr));
    }

    /**
     * 选择排序
     *
     * @param array 待排序的数组
     */
    public static void selectionSort(int[] array) {
        if (array.length == 0) {
            return;
        }
        for (int i = 0; i < array.length; i++) {

            //i:当前的i就是已经排序的的后一个位置，这个位置的数据也属于没有排序的元素，所以也参与下面找最小值索引的方法


            //遍历剩余没有排序的元素，找到最小值的索引
            int minIndex = i;
            for (int j = i; j < array.length; j++) {
                //找到最小值
                if (array[j] < array[minIndex]) {
                    //保存最小值的索引
                    minIndex = j;
                }
            }

            //将当前的开始位置i和最小值索引minIndex的值交换，这样当前位置i中存放的就是当前剩余待排序数字中的最小值
            int temp = array[minIndex];
            array[minIndex] = array[i];
            array[i] = temp;
        }
    }
}

```



# 参考

- https://www.cnblogs.com/guoyaohua/p/8600214.html