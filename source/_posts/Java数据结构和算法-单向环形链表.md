----------
title: Java数据结构和算法-单向环形链表

date: 2020-4-6 22:02:36

toc: true

tag: 

- 数据结构
- 单向环形链表

----------

# 单向环形链表

- Josephu（约瑟夫、约瑟夫环）问题为

　　 设编号为1,2,3,……n的n个人围坐一圈，约定编号为k（1<=k<=n）的人从1开始报数，数到m的那个人出列，它的下一位又从1开始报数，数到m的那个人又出列，依次类推，直到所有人出列为止，由此产生一个出队编号的序列。

- 提示

　　 用一个不带头节点的环形链表来处理 Josephu 问题：先构成一个有n个节点的单循环链表，然后由k节点起从1开始计数，记到m时，对应节点从链表中删除，然后再从被删除节点又从1开始计数，直到最后一个节点从链表中删除算法结束。

![单向环形链表](https://img-blog.csdnimg.cn/20200506222916737.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3Rhb3dlaWRvbmcx,size_16,color_FFFFFF,t_70)


<!-- more -->



# 代码实现

```java
package com.data.structure;

/**
 * 约瑟夫环问题
 *
 * @author Taoweidong
 */
public class Josepfu {
    public static void main(String[] args) {
        CircleSingleLinkedList circleSingleLinkedList = new CircleSingleLinkedList();
        circleSingleLinkedList.addBoy(5);
        //circleSingleLinkedList.showList();

        circleSingleLinkedList.countBoy(1, 2, 5);
    }
}

/**
 * 环形单向链表
 */
class CircleSingleLinkedList {
    /**
     * 创建第一个值
     */
    private Boy first = new Boy(-1);


    /**
     * 添加节点，构建环形链表
     *
     * @param nums
     */
    public void addBoy(int nums) {
        if (nums < 1) {
            System.out.println("至少添加一个节点信息：nums>=1");
            return;
        }
        Boy currBoy = null;

        //使用for循环创建环形链表
        for (int i = 1; i <= nums; i++) {
            //根据编号创建节点
            Boy item = new Boy(i);
            //如果是第一个节点
            if (i == 1) {
                first = item;
                first.next = first;
                currBoy = first;

            } else {
                currBoy.next = item;
                item.next = first;
                currBoy = item;
            }
        }
    }

    /**
     * 遍历环形链表
     */
    public void showList() {
        if (first == null) {
            System.out.println("没有任何节点");
            return;
        }

        //辅助指针
        Boy currBog = this.first;
        while (true) {
            System.out.println("节点编号：" + currBog.no);
            //遍历完毕
            if (currBog.next == first) {
                break;
            }
            //遍历指针后移一位
            currBog = currBog.next;
        }
    }

    /**
     * 根据用户的输入，打印小孩出圈的顺序
     *
     * @param startNo  表示从第几个小孩开始数数
     * @param countNum 表示数几下
     * @param nums     表示最初有几个小孩在圈里面
     */
    public void countBoy(int startNo, int countNum, int nums) {
        if (first == null || startNo < 1 || startNo > nums) {
            System.out.println("输入数据有误");
            return;
        }
        //创建辅助指针
        Boy helper = first;
        //找到当前环形队列的最后一个节点
        while (true) {
            if (helper.next == first) {
                break;
            }
            helper = helper.next;
        }

        //报数，出圈
        //移动到第startNo小孩处
        for (int i = 0; i < startNo - 1; i++) {
            first = first.next;
            helper = helper.next;

        }

        //小孩开始报数，移动countNum-1次 出圈
        while (true) {
            //出圈完毕，圈里面只有一个人
            if (helper == first) {
                break;
            }

            for (int i = 0; i < countNum - 1; i++) {
                first = first.next;
                helper = helper.next;
            }
            //此时first指向的节点就是要出圈的节点
            System.out.printf("小孩%s出圈\n", first.no);
            //这时将first指向的节点出圈
            first = first.next;
            helper.next = first;

        }
        System.out.printf("最后留在圈中的小孩%s\n", first.no);


    }
}

class Boy {
    /**
     * 当前节点编号
     */
    public int no;
    /**
     * 下一个节点
     */
    public Boy next;

    public Boy(int no) {
        this.no = no;
    }
}


```





# 参考

- [https://www.cnblogs.com/MWCloud/p/11241575.html](https://www.cnblogs.com/MWCloud/p/11241575.html)
- 
