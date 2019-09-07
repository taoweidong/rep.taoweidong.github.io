----------
title: RabbitMQ学习笔记-初识

date: 2018-2-3 10:25:34 

toc: true

tag: 

- RabbitMQ
- 消息队列

----------

# 消息队列的历史 

Message Queue的需求由来已久，80年代最早在金融交易中，高盛等公司采用Teknekron公司的产品，当时的Message queuing软件叫做：the information bus（TIB）。 TIB被电信和通讯公司采用，路透社收购了Teknekron公司。之后，IBM开发了MQSeries，微软开发了Microsoft Message Queue（MSMQ）。这些商业MQ供应商的问题是厂商锁定，价格高昂。2001年，Java Message queuing试图解决锁定和交互性的问题，但对应用来说反而更加麻烦了。

于是2004年，摩根大通和iMatrix开始着手Advanced Message Queuing Protocol （AMQP）开放标准的开发。2006年，AMQP规范发布。2007年，Rabbit技术公司基于AMQP标准开发的RabbitMQ 1.0 发布。

目前RabbitMQ的最新版本为3.5.7，基于AMQP 0-9-1。 

![](https://i.imgur.com/g3ImCQm.png)

RabbitMQ采用Erlang语言开发。Erlang语言由Ericson设计，专门为开发concurrent和distribution系统的一种语言，在电信领域使用广泛。OTP（Open Telecom Platform）作为Erlang语言的一部分，包含了很多基于Erlang开发的中间件／库／工具，如mnesia／SASL，极大方便了Erlang应用的开发。OTP就类似于Python语言中众多的module，用户借助这些module可以很方便的开发应用。

<!--more-->

# RabbitMQ到底是什么？

RabbitMQ是一个程序与程序之间通信的方法，或者可以理解为一种专用的通道，专门用来负责消息的读取和写入。应用程序通过在RabbitMQ中读写消息来通信，程序与程序之间无需专门的链接，而是直接通过RabbitMQ来进行数据的读写。RabbitMQ将会采用异步的方式来分发消息，是一种经典的生产者与消费者的模式，多个消费者由RabbitMQ来负责协调，并且保证每一条消息都能得到可靠的执行。假如一条消息在执行过程中出现了错误，RabbitMQ并不会放弃这条消息，而是专由其他的消费者来处理这条消息。

# RabbitMQ和Celery到底有什么区别？
上面我们已经提到过，RabbitMQ是负责消息的生产和消费，我们可以理解为，RabbitMQ是一个仓库的中转站，所有的程序消息都发送给RabbitMQ，然后由RabbitMQ来负责把这些消息来运输给消费者。但是RabbitMQ的侧重点在于，消息的读写。比如说我们有一个仓库A，我想把仓库A里面的全部货物，经过不同的路线，最终运输到仓库B里面。如果我们使用RabbitMQ，是可以完成这种操作，但是这其中包含了大量复杂的逻辑，我们需要自己去写。于是有人就提供了一种现成的方案，那就是Celery。

Celery主要负责的就是异步的任务队列，它本身不提供任何数据的存取，只关注如何把数据，异步，安全，高效，可靠的运输到另一个地点，并且在对方处理完成以后，再把响应数据通知给对应的方法。

我们拿爬虫来讲，假如我要爬一个网站A，如果按照正常的逻辑。发送一个请求到网站A，然后网站A收到了我的请求，把响应的页面传给我，我再负责解析。这其中就包含了一个问题，比如说A网站的服务器很卡，在我发送数据以后，到他处理完成，这段过程用了三四秒的时间。那么这段时间我的程序一直是处于一种等待状态，等待响应的完成，这样就造成了大量的资源浪费。

使用Celery的好处就是，在我们请求发送出去以后，Celery就立刻开始去发送下一个任务，它会把所有的任务都快速的发送出去，并不等待任务响应完成。当某一个任务响应回来时，Celery再去通知具体的人来处理响应的数据，然后继续分发任务。

所以RabbitMQ和Celery最大区别就是，RabbitMQ提供了一种可靠的消息存取的服务，而Celery负责高效的分发这些消息。
