//
//  BFClassInfo.h
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/4/14.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "BFModelMeta.h"
#import "NSObject+BFModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BFClassIvarInfo : NSObject

@property(nonatomic, assign, readonly) Ivar ivar;
@property(nonatomic, strong, readonly) NSString *name;
@property(nonatomic, assign, readonly) ptrdiff_t offset; // 保存两个指针减法操作的结果
@property(nonatomic, strong, readonly) NSString *typeEncoding;
@property(nonatomic, assign, readonly) NSUInteger type;


- (instancetype)initWithIvar:(Ivar)ivar;

@end


@interface BFClassMethodInfo : NSObject

@property(nonatomic, assign, readonly) Method method;
@property(nonatomic, strong, readonly) NSString *name;
@property(nonatomic, assign, readonly) SEL sel;
@property(nonatomic, assign, readonly) IMP imp;
@property(nonatomic, strong, readonly) NSString *typeEncoding; // "@16@0:8"
@property(nonatomic, strong, readonly) NSString *returnTypeEncoing; // @
@property(nonatomic, strong, readonly, nullable) NSArray<NSString *> *argumentTypeEncodings; // @:


- (instancetype)initWithMethod:(Method)method;

@end

@interface BFClassPropertyInfo : NSObject

@property(nonatomic, assign, readonly)objc_property_t property;
@property(nonatomic, strong, readonly) NSString *name;
@property(nonatomic, assign, readonly) NSUInteger type;
@property(nonatomic, strong, readonly) NSString *typeEncoding;
@property(nonatomic, strong, readonly) NSString *ivarName;
@property(nonatomic, assign, readonly, nullable) Class cls;
@property(nonatomic, assign, readonly, nullable) NSArray<NSString *> *protocols;
@property(nonatomic, assign, readonly) SEL getter;
@property(nonatomic, assign, readonly) SEL setter;



- (instancetype)initWithProperty:(objc_property_t)property;


@end

// 即将转换的 class 的类的容易，以及一些关联的内容
@interface BFClassInfo : NSObject

@property(nonatomic, assign, readonly) Class cls; // 这个Class 中包含的类对象
@property(nonatomic, assign, readonly, nullable) Class superClass; //该类的 super class 为了找一些方法链
@property(nonatomic, assign, readonly, nullable) Class metaClass; // 该类的元类: 此类的方法
@property(nonatomic, readonly) BOOL isMeta; // class 是否是元类
@property(nonatomic, strong, readonly) NSString *name;  // class name
@property(nonatomic, strong, readonly, nullable) BFClassInfo *superClassInfo; // super class
@property(nonatomic, strong, readonly, nullable) NSDictionary<NSString *, BFClassIvarInfo *> *ivarInfos;
@property(nonatomic, strong, readonly, nullable) NSDictionary<NSString *, BFClassMethodInfo *> *methodInfos;
@property(nonatomic, strong, readonly, nullable) NSDictionary<NSString *, BFClassPropertyInfo *> *propertyInfos;



+ (nullable instancetype)classInfoWithClass:(Class)cls;

@end

NS_ASSUME_NONNULL_END
