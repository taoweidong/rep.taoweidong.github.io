----------
title:  Java数据结构和算法-插入排序算法

date: 2020-4-6 12:48:48

toc: true

tag: 

- 数据结构
- 算法
- 排序算法
- 插入排序算法

----------

# 算法思想

​	插入排序（Insertion-Sort）的算法描述是一种简单直观的排序算法。它的工作原理是通过构建有序序列，对于未排序数据，在已排序序列中从后向前扫描，找到相应位置并插入。插入排序在实现上，通常采用in-place排序（即只需用到O(1)的额外空间的排序），因而在从后向前扫描过程中，需要反复把已排序元素逐步向后挪位，为最新元素提供插入空间。

# 代码实现

- 一般来说，插入排序都采用in-place在数组上实现。具体算法描述如下：
  - 从第一个元素开始，该元素可以认为已经被排序；
  - 取出下一个元素，在已经排序的元素序列中从后向前扫描；
  - 如果该元素（已排序）大于新元素，将该元素移到下一位置；
  - 重复步骤3，直到找到已排序的元素小于或者等于新元素的位置；
  - 将新元素插入到该位置后；
  - 重复步骤2~5。

```java
package com.sort;

import com.alibaba.fastjson.JSON;

/**
 * @author Taoweidong
 */
public class InsertionSort {
    public static void main(String[] args) {
        int[] arr = {10, 2, 3, 56, 24, 12, 9, 85, 533, 62};
        System.out.println(JSON.toJSONString(arr));
        insertionSort(arr);
        System.out.println(JSON.toJSONString(arr));
    }

    /**
     * 插入排序
     * @param arr 待排序数组
     */
    public static void insertionSort(int[] arr) {
        if (arr == null || arr.length == 0) {
            return;
        }

        for (int i = 0; i < arr.length - 1; i++) {
            //待插入的数据
            int currentValue = arr[i + 1];
            //当前位置往前都为已经排好序的数据
            int index = i;
            while (index >= 0 && arr[index] > currentValue) {
                //如果当前位置的值小于待插入的数据，则将该位置的数据往后挪一位
                //当前位置的下一个位置为占位的数据
                arr[index + 1] = arr[index];
                index--;
            }
            arr[index + 1] = currentValue;
        }

    }
}

```



# 参考

- https://www.cnblogs.com/guoyaohua/p/8600214.html