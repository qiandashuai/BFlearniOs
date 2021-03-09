//
//  NSObject+BFModel.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/4/2.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "NSObject+BFModel.h"


typedef struct {
    void *modelMeta; // BFModelMeta
    void *model;
    void *dictionary;
} ModelSetContext;



static void BFModelSetWithDictionaryFunction(const void *_key, const void *_value, void *_context) {
    
    ModelSetContext *context = _context;
    
    // 与 __weak 一样，表示的是对象的一种弱引用关系，唯一的区别是：__weak 修饰的对象被释放后，只想对象的指针会指控，也就是指向 nil, 不会产生也指针，；而__unsafe_unretained修饰的对象被释放后，指针不会置空，而是变成一个野指针，那么此时如果访问这个对象的话，程序就会Crash，抛出BAD_ACCESS的异常。
    __unsafe_unretained BFModelMeta *meta = (__bridge BFModelMeta *)(context -> modelMeta);
    
    // TODO:
  //  __unsafe_unretained BFModelPropertyMeta *propertyMeta = [meta->_mapper objectForKey:(__bridge id)(_key)];
    
    __unsafe_unretained id model = (__bridge id)(context->model);
//    
//    while (propertyMeta) {
//        if (propertyMeta->_setter) {
//            
//        }
//    }
    
}

static void BFModelSetValueForProperty(__unsafe_unretained id model,
__unsafe_unretained id value,
__unsafe_unretained BFModelPropertyMeta *meta) {
    if (meta->_isCNumber) {
        
    }
}

@implementation NSObject (BFModel)

// json --> instance
+(instancetype)bf_modelWithJSON:(id)json {
    
    NSDictionary *dict = [self _bf_dictionaryWithJSON:json];
    return [self bf_modelWithDictionary:dict];
    
}

// json --> dictionary
// NSNull 是一个空的对象， 用来解决 NSArray 和 NSDcictionary 之类的集合中不能有 nil 的缺陷，可以将 `NSNull` 理解为有效的将 NULL,或者 nil 值封装 boxing,以达到他们在集合中使用的目的。
// nil 是一个指向不存在的对象指针，虽然 nil 是零，但是仍然可以发消息给它。在 Objective-C 中，在 nil 上调用方法会返回一个零值。
// Nil 指向零的类指针

// 标志      值                       含义
// NULL    (void *)0              C指针的字面零值
// nil     (id)0                 Objective-C对象的字面零值
// Nil     (Class)0               Objective-C类的字面零值
// NSNull  [NSNull null]          用来表示零值的单独的对象
// kCFNull  The singleton CFNull object.
// TODO:  why use KCFNull


// NSJSONSerialization
//  json 对象  <----> foundation 对象 互相转换
// 能转换成 json 的 foundation 对象必须有下面的特点:
// -- 最顶层的对象是 NSArray 或者 NSDictionary
// -- 所有的对像必须是 NSString,NSNumber, NSArray,NSDictionary,NSNull
// -- 所有的 NSDictionary 的健必须是 字符串
// -- Numbers are not NaN or infinity.
+(NSDictionary *)_bf_dictionaryWithJSON:(id)json {
    if (!json || json == (id)kCFNull) {
        return nil;
    }
    NSDictionary *dic = nil;
    NSData *jsonData = nil;

    if ([json isKindOfClass:[NSDictionary class]]) {
        dic = json;
    } else if ([json isKindOfClass:[NSString class]]) {
        jsonData = [(NSString *)json dataUsingEncoding:NSUTF8StringEncoding];
    } else if ([json isKindOfClass:[NSData class]]) {
        jsonData = json;
    }

    if (jsonData) {
        dic = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:NULL];
        if (![dic isKindOfClass:[NSDictionary class]]) {
            dic = nil;
        }
    }
    return dic;
}



+(instancetype)bf_modelWithDictionary:(NSDictionary *)dictionary {
    // KCFNull 到底是什么？ 为什么要这么比 TODO:
    if (!dictionary || dictionary == (id)kCFNull) return nil;
    if (![dictionary isKindOfClass:[NSDictionary class]]) return nil;
    
    Class cls = [self class];
    // 获取一个 ModelMeta 类
    BFModelMeta *modelMeta = [BFModelMeta metaWithClass:cls];
    
    // TODO: hasCustomerClassFromDictionary
    
    
    NSObject *one = [cls new];
    if ([one bf_modelSetWithDictionary:dictionary]) return one;
    return nil;
}


- (BOOL)bf_modelSetWithDictionary:(NSDictionary *)dic {
    if (!dic || dic == (id)kCFNull) return NO;
    if (![dic isKindOfClass:[NSDictionary class]]) return NO;
    
    BFModelMeta *modelMeta = [BFModelMeta metaWithClass:object_getClass(self)];
    // TODO :some judge
    
    ModelSetContext context = {0};
    context.modelMeta = (__bridge void *)(modelMeta);
    context.model = (__bridge void *)(self);
    context.dictionary = (__bridge void *)(dic);
    
    
     // TODO: 一个条件if (<#condition#>) {
        
 //   }
    
    CFDictionaryApplyFunction((CFDictionaryRef)dic, BFModelSetWithDictionaryFunction, &context);
    
    return YES;
}


@end
