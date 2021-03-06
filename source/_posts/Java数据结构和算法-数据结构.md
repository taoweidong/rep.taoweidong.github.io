----------
title: Java数据结构和算法-数据结构

date: 2020-2-19 16:18:15

toc: true

tag: 

- 数据结构
- 算法

----------

# 数据结构简介
数据结构是指相互之间存在着一种或多种关系的数据元素的集合和该集合中数据元素之间的关系组成 。 常用的数据结构有：数组，栈，链表，队列，树，图，堆，散列表等，如图所示： 
![数据结构简介](https://img-blog.csdnimg.cn/20200219192500640.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3Rhb3dlaWRvbmcx,size_16,color_FFFFFF,t_70)
数据结构包括：线性结构和非线性结构

## 线性结构

- 线性结构作为最常用的数据结构，其特点是数据元素之间存在一对一的线性关系
- 线性结构包括两种不同的存储结构：顺序存储结构和链式存储结构
  - 顺序表：顺序存储的线性表称为顺序表，顺序表中的存储元素是连续的
  - 链表：链式存储的线性表称为链表，链表中的存储元素不一定是连续的，元素节点中存放的数据元素以及相邻元素的地址信息
- 线性结构常见的有：数组，栈，队列，链表

<!-- more -->

### 顺序表的优缺点
- 优点：
  - 可以快速获取下标的数据元素，时间复杂度为O(1)
  - 逻辑关系是一对一的关系，连续存储单元足以储存，不需要增加额外的存储空间

- 缺点：
  - 插入和删除操作需要移动大量的元素，时间复杂度为O(n)
  - 线性表的存储空间大小难以确定，并且不好扩展
  - 造成存储空间碎片

## 非线性结构
- 包括：二维数组，多维数组，广义表，树结构，图结构
## 稀疏数组
定义：当一个数组中大部分元素为0，或者为同一个值得数组时，可以使用稀疏数组来保存该数组

### Java中定义数组的方式
```java
public static void main(String[] args) {
    String[] array = {"Hello", "World", "Java"};
    int[] arrayInt = {12, 20, 30, 55};
}
```

### 稀疏数组的处理方法
- 记录数组一共有几行几列，有多少不同的值
- 把具有不同值得元素的行列及值记录在一个**小规模的数组**(稀疏数组)中，从而缩小程序的规模

### 二维数组转稀疏数组的思路
1. 遍历原始二维数组，得到有效数据的个数sum
2. 根据sum就可以创建稀疏数组sparseArr  int[sum+1][3]
3. 将二维数组的有效数据存储到稀疏数组中

### 稀疏数组转原始的二维数组的思路
1. 先读取稀疏数组的第一行，根据第一行的数据，创建原始的二维数组，比如：chessArr int[11][11]
2. 在读取稀疏数组后几行的数据，并赋值给原始的二维数组

### 代码实现稀疏数组和二维数组的转换

```java
package com.data.structure;

/**
 * 算法学习-稀疏数组
 * 
 * @author Taoweidong
 */
public class HelloDataStructure {

  public static void main(String[] args) {

    int[][] chessArr = new int[11][11];
    chessArr[1][3] = 2;
    chessArr[2][5] = 8;
    // 打印二维数组
    for (int[] ints : chessArr) {
      for (int anInt : ints) {
        System.out.print(anInt + "\t\t\t");
      }
      System.out.println();
    }

    // 将二维数组转为稀疏数组
    // 1、遍历二维数组得到非0数字的个数
    int sum = 0;
    for (int i = 0; i < chessArr.length; i++) {
      for (int j = 0; j < chessArr[0].length; j++) {
        if (chessArr[i][j] != 0) {
          sum++;
        }
      }
    }
    System.out.println(sum);

    // 2、创建对应的稀疏数组
    int[][] sparseArr = new int[sum + 1][3];
    sparseArr[0][0] = 11;
    sparseArr[0][1] = 11;
    sparseArr[0][2] = sum;
    // 遍历
    int index = 1;
    for (int i = 0; i < chessArr.length; i++) {
      for (int j = 0; j < chessArr[i].length; j++) {
        if (chessArr[i][j] != 0) {
          sparseArr[index][0] = i;
          sparseArr[index][1] = j;
          sparseArr[index][2] = chessArr[i][j];
          index++;
        }
        System.out.print(chessArr[i][j] + "\t\t\t");
      }
      System.out.println();
    }

    // 遍历稀疏数组
    System.out.println("************遍历稀疏数组*****************");
    for (int i = 0; i < sparseArr.length; i++) {
      for (int j = 0; j < sparseArr[i].length; j++) {
        System.out.print(sparseArr[i][j] + "\t\t\t");
      }
      System.out.println();
    }

    // 稀疏数组--转为二维数组
    System.out.println("************稀疏数组--转为二维数组*****************");
    int[][] chessArr2 = new int[sparseArr[0][0]][sparseArr[0][1]];
    for (int i = 1; i < sparseArr.length; i++) {
      chessArr2[sparseArr[i][0]][sparseArr[i][1]] = sparseArr[i][2];
    }

    for (int i = 0; i < chessArr2.length; i++) {
      for (int j = 0; j < chessArr2[i].length; j++) {
        System.out.print(chessArr2[i][j] + "\t\t\t");
      }
      System.out.println();
    }

  }
}

```



# 参考学习资料

- [https://blog.csdn.net/yeyazhishang/article/details/82353846](https://blog.csdn.net/yeyazhishang/article/details/82353846)
- [https://www.jianshu.com/p/30fdd6faea79](https://www.jianshu.com/p/30fdd6faea79)
