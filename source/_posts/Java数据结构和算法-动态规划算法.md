----------

title:  Java数据结构和算法-动态规划算法

date: 2020-3-21 11:27:04

toc: true

tag: 

- 数据结构
- 算法
- 动态规划

----------

# 算法思想

- 核心思想：**将大问题划分为小问题进行解决，从而一步步获取最优解的处理算法**
- 动态规划算法与分支算法类似，其基本思想也是将求解问题分解成若干子问题，先求解子问题，然后从这些子问题的解得到原问题的解
- 与分治法不同的是，**适合用于动态规划求解的问题，经分解得到的子问题往往不是相互独立的**。（也就是下一个子阶段的求解是建立在上一个子阶段的解的基础上，进行进一步的求解）
- 动态规划往往是通过**填表的方式**逐步推进，得到最优解



## 背包问题

背包问题主要是指一个给定容量的背包，若干具有一定价值和重量的物品，如何选择物品放入背包使物品的价值最大。其中又分0-1背包问题(指的是：每一个物品只能用一次)和完全背包问题(完全背包是指：每一个物品都有无限件可用)。

- 无限背包问题可以转化为0-1背包问题进行求解

参考：[https://blog.csdn.net/weixin_41162823/article/details/87878853](https://blog.csdn.net/weixin_41162823/article/details/87878853)



### 0-1背包问题

问题描述：给定n个物体（它们的重量为：w1，w2，......，wn，价值为：v1，v2，......，vn） 和 一个承受重量为W的背包，问怎么选取这些物体，放在背包中（不超过背包的承重），让所取的子集达到最大价值。



<!-- more -->



#### 代码实现

```java
package com.data.structure;

/**
 * 动态规划-背包问题2-优化版本，记录详细信息
 * @author Taoweidong
 */
public class KnapsackProblem2 {

	public static void main(String[] args) {

		//物品的重量
		int[] w = { 1, 4, 3 };
		//物品的价值
		int[] value = { 1500, 3000, 2000 };
		//背包的最大容量
		int m = 4;
		//物品的个数
		int n = value.length;

		//创建动态规划分布表
		int[][] v = new int[n + 1][m + 1];
		//初始化分布表
		for (int i = 0; i < v.length; i++) {
			v[i][0] = 0;
		}
		for (int j = 0; j < v[0].length; j++) {
			v[0][j] = 0;
		}

		//创建动态规划分布表
		int[][] path = new int[n + 1][m + 1];

		//开始进行动态规划
		for (int i = 1; i < v.length; i++) {
			for (int j = 1; j < v[i].length; j++) {
				//如果新增的商品大于当前背包容量j的话，就无法放入背包，则当前的价值仍然为前i-1个商品的价值
				if (w[i - 1] > j) {
					v[i][j] = v[i - 1][j];
				} else {
					//否则，新增的商品容量小于当前背包容量j，则说明可以添加到背包中
					if (v[i - 1][j] < value[i - 1] + v[i - 1][j - w[i - 1]]) {
						v[i][j] = value[i - 1] + v[i - 1][j - w[i - 1]];
						path[i][j] = 1;
					} else {
						v[i][j] = v[i - 1][j];
					}
				}
			}

		}

		int maxValue = 0;
		for (int i = 0; i < v.length; i++) {
			for (int j = 0; j < v[0].length; j++) {
				maxValue = Math.max(maxValue, v[i][j]);
				System.out.print(v[i][j] + "\t");
			}
			System.out.println();
		}

		System.out.println("结果：" + maxValue);

		for (int i = 1; i < path.length; i++) {
			for (int j = 1; j < path[0].length; j++) {
				System.out.print(path[i][j] + "\t");
			}
			System.out.println();
		}

		int i = path.length - 1;
		int j = path[0].length - 1;
		//从记录的最后开始找
		while (i > 0 && j > 0) {
			if (path[i][j] == 1) {
				System.out.printf("第%d个商品放入到背包\n", i);
				j = j - w[i - 1];
			}
			i--;
		}

	}

}

```

#### 代码实现2

```java
package com.data.structure;

import java.util.Scanner;

/**
 * 动态规划-背包问题
 * @author Taoweidong
 */
public class KnapsackProblem {

	public static void main(String[] args) {

		//1、从输入流中获取数据
		Scanner sc = new Scanner(System.in);
		//物品的个数
		int N = sc.nextInt();
		//背包的容积
		int V = sc.nextInt();
		//物品的体积:第i个元素表示第i个物品的体积
		int[] v = new int[N + 1];
		//物品的价值:第i个元素表示第i个物品的价值
		int[] w = new int[N + 1];

		for (int i = 1; i <= N; i++) {
			v[i] = sc.nextInt();
			w[i] = sc.nextInt();
		}

		//2、开始解析问题
		//表示前i个物品最大容量为j时的最大价值
		int[][] dp = new int[N + 1][V + 1];
		//初始化基本数据
		for (int i = 0; i < dp.length; i++) {
			dp[i][0] = 0;
		}
		for (int i = 0; i < dp.length; i++) {
			dp[0][1] = 0;
		}

		//开始进行动态规划
		for (int i = 1; i < dp.length; i++) {
			for (int j = 1; j < dp[i].length; j++) {

				if (v[i] > j) {
					//如果待添加的物品的重量v[i]已经超过了当前背包的最大容量j,说明该物品不可以添加到背包中，则当前位置的最大价值仍为前一个物品在此重量下的最大价值
					dp[i][j] = dp[i - 1][j];
				} else {
					//否则，新增的商品容量小于当前背包容量j，则说明可以添加到背包中
					//dp[i-1][j]:前i-1个物品在容量为j的情况下的最大价值
					//dp[i-1][j-v[i]] + w[i]:前i-1个物品在容量为j-v[i](当前最大容量j减去当前物品的重量)的情况下的最大价值+当前物品的最大价值
					//两者取其最大值作为当前节点的价值
					dp[i][j] = Math.max(dp[i - 1][j], dp[i - 1][j - v[i]] + w[i]);
				}
			}
		}

		//3、输出最后一个节点的值：也就是N个背包在容量为V的限制下的最大价值
		System.out.println(dp[N][V]);

	}

}

```



