//
//  BFLearnApmViewController.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/7/13.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "BFLearnApmViewController.h"

@interface BFLearnApmViewController ()

@end

@implementation BFLearnApmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

/**
 CPU占有率，内存使用情况， FPS, 冷启动，热启动时间，耗电量
 
 CPU:
 
 CPU 是移动设备最重要的计算资源，设计糟糕的应用可能会造成CPU持续高负载运行，一方面会导致用户使用过程遭遇卡顿，另一方面会导致手机发热发烫，电量被快速消耗完，严重影响用户体验。
 
 Memory
 
 物理内存(RAM)与CPU一样是系统中最稀少的资源，也是最有可能产生竞争的资源，应用内存与性能直接相关---通常是以牺牲别的应用为代价，
 
 
 Startup Time
 
 毫无疑问移动应用的启动时间是影响用户体验的一个重要方面，那我们我们应该如何通过启动时间来衡量一个应用的好坏：
 1. 冷启动
 2. 热启动
 
 
 Freezing/Lag
 
 从一个像素到最后真正显示在屏幕上.
 
 如果监控卡顿：
 
 如何监控卡顿:
 

 1. FPS 监控，
 2. 主线程卡顿监控： 开辟一个子线程来监控主线程的 RunLoop, 当两个状态区域之间的耗时大雨阈值时，就记为发生一次卡顿。
 
 */

/**
 网络
 
 国内移动网络环境非常复杂，WIFI, 4G,3G等多种移动网络并存，用户的网络可能会在这些环境中切换，这是移动网络和传统网络一个很大的区别。被称作为 connection migration 问题。
 
 网络监控一般通过 NSUrlProtocol 和代码注入(Hook)这两种方式来实现，由于 NSURULProtocol 作为上层接口，使用起来更为方便，但是NSURLProtocol 属于 URL  Loading System 体系中，
 应用层的协议支持有限，只支持 FTP, HTTP, HTTPS等几个应用层协议，对于使用其他协议的流量则束手无策，所以存在一定的局限性，监控底层网络库 CFNetwork 则没有这个限时。
 
 网络采集的关键性能指标：
 - TCP建立连接时间
 - DNS时间
 - SSL 时间
 - 首包时间
 - 响应时间
 - HTTP 错误率
 - 网络错误率
 
 
 HOOK:
 
 如果我们使用手工埋点的方式监控网络，会侵入到业务代码，维护成本会非常高，通过 Hook 将网络性能监控的代码自动注入就可以避免上面的问题，做到真实用户体验监控，监控应用在真实网络环境中的性能。
 
 AOP(面向切面编程)通过预编译方式和运动期动态代理实现在不修改源代码的情况下给程序添加功能的一项技术，其核心思想是将业务逻辑与公共功能（横切关注点，如日志，事物）进行分离，
 核心关注点采用 OOP 方式进行代码的编写，横切关注点采用 AOP方式进行编码。AOP 被广泛应用在日志记录，性能统计，安全控制，事物处理，异常处理等领域。
 
 在 iOS 中 AOP 的实现是基于 Objective-C 的 Runtime 机制，实现Hook 的三种方式分别为： Method Swizzing, NSProxy 和Finshhook, 前两者基于Objective-C实现的库, NSURLConnection 和 NSURLSession, 后者是 CFNetwork.基于 C语言库
 
 Method Swizzling
 
 Method swizzling 是利用 Objevtice-C Runtime 特性把一个方法的实现与另一个的方法实现进行替换的技术。每个 Class 结构体中都有一个 Dispatch Table 的成员变量,  dispatch table 中建立了每个 SEL（方法名） 和对应的 IMP (方法实现，指向C函数的指针)的映射关系， Method Swizzling 就将原有的  SEL 和 IMP 映射关系打破，并奖励的关系来达到方法替换的目的。
 
 NSProxy:
 
 NSProxy 和 NSObject 一样都是一个根类，继承他， 重写 -forwardInvocation: 和 -methodSinatureForSelector 方法来实现消息转发到另一个实例，综上: NSProxy 的目的就是负责消息转发到真正的 target 的代理类。
 */

/**
 应用启动时间是影响用户体验的重要因素之一，所以我们需要量化去衡量一个 App 的启动速度到底有多快，
 */

@end
