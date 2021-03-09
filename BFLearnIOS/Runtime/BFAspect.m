//
//  BFAspect.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/4/21.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "BFAspect.h"
#import <objc/runtime.h>


static NSString *const BFAspectsMessagePrefix = @"aspects_";
static NSString *const BFAspectsSubclassSuffix = @"_Aspects_";


#pragma mark - Aspect Invoke Point

// this is a macro so we get a cleaner stack track


@interface BFAspectInfo : NSObject <BFAspectInfo>


- (id)initWithInstance:(__unsafe_unretained id)instance invocation:(NSInvocation *)invocation;

@property(nonatomic, unsafe_unretained, readonly) id instance;
@property(nonatomic, strong, readonly) NSArray *arguments;
@property(nonatomic, strong, readonly) NSInvocation *originalInvocation;

@end


// tracking a single aspect
@interface BFAspectIdentifier : NSObject<BFAspectToken>

// to check all param function
+ (instancetype)identifierWithSelector:(SEL)selector object:(id)object options:(BFAspectOptions)option block:(id)block error:(NSError **)error;

- (BOOL)invokeWithInfo:(id<BFAspectInfo>)info;

@property(nonatomic, assign) SEL selector;
@property(nonatomic, strong) id block;
@property(nonatomic, strong) NSMethodSignature *blockSignature;
@property(nonatomic, weak) id object;
@property(nonatomic, assign) BFAspectOptions options;

@end

#define bfaspect_invoke(aspects, info)                                               \
for (BFAspectIdentifier *aspect in aspects) {                                   \
    [aspect invokeWithInfo:info];                                              \                                                                       \
}


@interface BFAspectsContainer : NSObject

- (void)addSepect:(BFAspectIdentifier *)aspect withOptions:(BFAspectOptions)injectPostion;
- (BOOL)removeAspect:(id)aspect;
- (BOOL)hasAspect;

@property(nonatomic, copy) NSArray *beforeAspect;
@property(nonatomic, copy) NSArray *insteadApect;
@property(nonatomic, copy) NSArray *afterAspect;

@end

static void _bfaspect_modifySwizzledClasses(void (^block)(NSMutableSet *SwizzledClasses)){
    static NSMutableSet *swizzledClasses;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        swizzledClasses = [NSMutableSet new];
    });
    @synchronized (swizzledClasses) {
        block(swizzledClasses);
    }
};

// 给 Selector 一个别名
static SEL bfaspect_aliasForSelector(SEL selector) {
    NSCParameterAssert(selector);
    
    return NSSelectorFromString([BFAspectsMessagePrefix stringByAppendingFormat:@"_%@", NSStringFromSelector(selector)]);
};


static BFAspectsContainer *bfaspect_getContainerForClass(Class klass, SEL selector) {
    NSCParameterAssert(klass);
    BFAspectsContainer *classConatiner = nil;
    do {
        classConatiner = objc_getAssociatedObject(klass, selector);
        if (classConatiner.hasAspect) break;
    }while ((klass = class_getSuperclass(klass)));
    
    return classConatiner;
};

static void __BFASPECTS_ARE_BEING_CALLED__ (__unsafe_unretained NSObject *self, SEL selector, NSInvocation *invocation) {
    NSCParameterAssert(self);
    NSCParameterAssert(invocation);
    
    SEL originalSelector = invocation.selector;
    
    SEL aliasSelector = bfaspect_aliasForSelector(invocation.selector);
    
    invocation.selector = aliasSelector;
    
    BFAspectsContainer *objectContainer = objc_getAssociatedObject(self, aliasSelector);
    BFAspectsContainer *classContainer = bfaspect_getContainerForClass(object_getClass(self), aliasSelector);
    BFAspectInfo *info = [[BFAspectInfo alloc]initWithInstance:self invocation:invocation];
    
    // before hooks
//
//    bfaspect_invoke(classContainer.beforeAspect, info);
//    bfaspect_invoke(objectContainer.beforeAspect, info);
//
//
//    // Instead hooks
//    BOOL respondsToAlias = YES;
//
//    if (objectContainer.insteadApect.count || classContainer.insteadApect.count) {
//        bfaspect_invoke(classContainer.insteadApect, info);
//        bfaspect_invoke(objectContainer.insteadApect, info);
//    } else {
//        Class klass = object_getClass(invocation.target);
//        do {
//            if ((respondsToAlias = [klass instancesRespondToSelector:aliasSelector])) {
//                [invocation invoke];
//                break;
//            }
//        } while(!respondsToAlias && (klass = class_getSuperclass(klass)));
//    }
//
//    bfaspect_invoke(classContainer.afterAspect, info);
//    bfaspect_invoke(objectContainer.afterAspect, info);
    
    
};

static void bfaspect_swizzleForwardInvocation(Class klass) {
    NSCParameterAssert(klass);
    
    IMP originalImplement = class_replaceMethod(klass, @selector(forwardInvocation:), (IMP)__BFASPECTS_ARE_BEING_CALLED__, "v@:@");
};

static Class bfaspect_swizzleClassInPlace(Class klass) {
//    NSCParameterAssert(klass);
//    NSString *classIndentification = [NSString stringWithFormat:@"%@:%p", NSStringFromClass(klass), klass];
//
//    _bfaspect_modifySwizzledClasses(^(NSMutableSet *SwizzledClasses) {
//        if (![SwizzledClasses containsObject:classIndentification]) {
//
//        }
//    });
//
    
    return klass;
};

static Class bfaspect_hookClass(NSObject *self, NSError **error) {
    NSCParameterAssert(self);
    
    Class statedClass = self.class;
    Class baseClass = object_getClass(self);
    
    NSString *className = NSStringFromClass(baseClass);
    
    if ([className hasSuffix:BFAspectsSubclassSuffix]) {
        return baseClass;
    } else if (class_isMetaClass(baseClass)) {
        
    } else if (statedClass != baseClass) {
        
    }
    return baseClass;
    
}


// 准备类使得它可以hook方法
static void bfaspect_prepareClassAndHookSelector(NSObject *self, SEL selector, NSError **error) {
    NSCParameterAssert(selector);
    
    
}




@implementation NSObject (BFAspect)


+ (id<BFAspectToken>)bfaspect_hookSelector:(SEL)selector withOptions:(BFAspectOptions)options useingBlock:(id)block error:(NSError **)error {
    return bfaspect_add((id)self, selector, options, block, error);
}


- (id<BFAspectToken>)bfaspect_hookSelector:(SEL)selector withOptions:(BFAspectOptions)options useingBlock:(id)block error:(NSError **)error {
    return bfaspect_add(self, selector, options, block, error);
}


static id bfaspect_add(id self, SEL selector, BFAspectOptions options, id block , NSError **error) {
    
    NSCParameterAssert(self);
    NSCParameterAssert(selector);
    NSCParameterAssert(block);
    
    __block BFAspectIdentifier *identifier = nil;
    __block NSError *strongError = nil;
    
    static dispatch_semaphore_t lock;
    
    lock = dispatch_semaphore_create(1);
    
    dispatch_semaphore_wait(lock, DISPATCH_TIME_FOREVER);
    
//    if(aspect_idSelectorAllowedAndTrack(self, selector, options, &strongError) {
//
//    }
    
    // 原来的 selector 更改一个名字，并将其存储起来。
    BFAspectsContainer *aspectConatiner = bfaspect_getContainerForClass(self, selector);
    identifier = [BFAspectIdentifier identifierWithSelector:selector object:self options:options block:block error:&strongError];
    
    if (identifier) {
        [aspectConatiner addSepect:identifier withOptions:options];
        
        // Modify the class to allow message intrception
        // 改造类使得 message 允许被拦截
    }
    
    dispatch_semaphore_signal(lock);
    
    if (error) {
        *error = strongError;
    }
    return identifier;
}

@end


@implementation BFAspectInfo

@synthesize arguments = _arguments;

- (id)initWithInstance:(__unsafe_unretained id)instance invocation:(NSInvocation *)invocation {
    NSCParameterAssert(instance);
    NSCParameterAssert(invocation);
    
    if (self = [super init]) {
        _instance = instance;
        _originalInvocation = invocation;
    }
    return self;
}


//- (NSArray *)arguments {
//    if (!_arguments) {
//        _arguments = self.originInvocation
//    }
//    return _arguments;
//}

@end

#pragma mark - BFAspectIdentifier

@implementation BFAspectIdentifier

+(instancetype)identifierWithSelector:(SEL)selector object:(id)object options:(BFAspectOptions)option block:(id)block error:(NSError *__autoreleasing *)error {
    NSCParameterAssert(block);
    NSCParameterAssert(selector);
    
    // TODO: 等到学习完 BLock 后再回来看这个
    
//    NSMethodSignature *blockSignature = aspect_blockMethodSignature(block, error);
//    if (!aspect_isCompatibleBlockSignature(blockSignature, object, selector, error)) {
//        return nil;
//    }
    // 一个 NSMethodSinature 对象记录着某个方法的返回值类型信息以及参数信息，他用于转发消息接受者无法响应的消息。
//    NSMethodSignature *blockSignature =
    
    BFAspectIdentifier *identifier = nil;
    // TODO:
    identifier = [BFAspectIdentifier new];
    identifier.selector = selector;
    identifier.block = block;
    identifier.blockSignature = [NSMethodSignature signatureWithObjCTypes:"v@:"];
    identifier.options = option;
    identifier.object = object;
    
    return  identifier;
}


// 消息转发
- (BOOL)invokeWithInfo:(id<BFAspectInfo>)info {
    NSInvocation *blockInvacation = [NSInvocation invocationWithMethodSignature:self.blockSignature];
    NSInvocation *originInvacation = info.originInvocation;
    
    NSUInteger numberOfArgument = self.blockSignature.numberOfArguments;
    
    if (numberOfArgument > 1) {
        [blockInvacation setArgument:&info atIndex:1];
    }
    
    void *argBuf = NULL;
    
    for (NSInteger idx = 2; idx < numberOfArgument; idx ++) {
        [originInvacation getArgument:argBuf atIndex:idx];
        [originInvacation setArgument:argBuf atIndex:idx];
    }
    
    [blockInvacation invokeWithTarget:self.block];
    return YES;
}

- (BOOL)remove {
    // TODO:
    return NO;
}

@end



#pragma mark - BFAspectsContainer

@implementation BFAspectsContainer

- (BOOL)hasAspect {
    return self.beforeAspect.count > 0 || self.insteadApect.count > 0 || self.afterAspect.count > 0;
}


- (void)addSepect:(BFAspectIdentifier *)aspect withOptions:(BFAspectOptions)injectPostion {
    NSCParameterAssert(aspect);
    
    switch (injectPostion) {
        case BFAspectOptionsBefore:
            self.beforeAspect = [(self.beforeAspect ?: @[]) arrayByAddingObject:aspect];
            break;
        case BFAspectOptionsInstead:
            self.insteadApect = [(self.insteadApect ?: @[]) arrayByAddingObject:aspect];
            break;
        case BFAspectOptionsAfter:
            self.afterAspect = [(self.afterAspect ?: @[]) arrayByAddingObject:aspect];
            break;
            
        default:
            break;
    }
}

- (BOOL)removeAspect:(id)aspect {
    return YES;
}

@end



static BFAspectsContainer* bfaspect_getContanierForObject(NSObject *self, SEL selector) {
    NSCParameterAssert(self);
    
    SEL aliasSelector = bfaspect_aliasForSelector(selector);
    
    // 获取关联的方法
    BFAspectsContainer *aspectsContainer = objc_getAssociatedObject(self, aliasSelector);
    
    if (!aspectsContainer) {
        aspectsContainer = [BFAspectsContainer new];
        objc_setAssociatedObject(self, aliasSelector, aspectsContainer, OBJC_ASSOCIATION_RETAIN);
    }
    return  aspectsContainer;
};

