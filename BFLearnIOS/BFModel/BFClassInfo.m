//
//  BFClassInfo.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/4/14.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "BFClassInfo.h"


@implementation BFClassIvarInfo


- (instancetype)initWithIvar:(Ivar)ivar {
    if (!ivar) return nil;
    self = [super init];
    
    _ivar = ivar;
    const char *name = ivar_getName(ivar);
    if (name) {
        _name = [NSString stringWithUTF8String:name];
    }
    _offset = ivar_getOffset(ivar);
    const char *typeEncoding = ivar_getTypeEncoding(ivar);
    if (typeEncoding) {
        _typeEncoding = [NSString stringWithUTF8String:typeEncoding];
        _type = BFEncoingGetType(typeEncoding);
    }
    
    return self;
}

@end


@implementation BFClassMethodInfo

- (instancetype)initWithMethod:(Method)method {
    if (!_method) return nil;
    self = [super init];
    _sel = method_getName(method);
    _imp = method_getImplementation(method);
    
    const char *name = sel_getName(_sel);
    if (name) {
        _name = [NSString stringWithUTF8String:name];
    }
    
    const char *typeEncoding = method_getTypeEncoding(method);
    if (typeEncoding) {
        _typeEncoding  = [NSString stringWithUTF8String:typeEncoding];
    }
    
    char *returnType = method_copyReturnType(method);
    if (returnType) {
        _returnTypeEncoing = [NSString stringWithUTF8String:returnType];
        free(returnType);
    }
    
    unsigned int argumentCount = method_getNumberOfArguments(method);
    if (argumentCount > 0) {
        NSMutableArray *argumentTypes = [NSMutableArray new];
        for (unsigned int i = 0; i< argumentCount; i ++) {
            char *argumentType = method_copyArgumentType(method, i);
            NSString *type = argumentType ? [NSString stringWithUTF8String:argumentType] : nil;
            [argumentTypes addObject:type ? type : @""];
            if (argumentType) free(argumentType);
        }
        _argumentTypeEncodings = argumentTypes;
    }
    return self;
}

@end



@implementation BFClassPropertyInfo


- (instancetype)initWithProperty:(objc_property_t)property {
    if (!property) return nil;
    
    self = [super init];
    
    _property = property;
    
    const char *name = property_getName(property);
    if (name) {
        _name = [NSString stringWithUTF8String:name];
    }
    
    BFEncoingType type = 0;
    unsigned int attrCount;
    objc_property_attribute_t *attrs = property_copyAttributeList(property, &attrCount);
    for (unsigned int  i = 0; i < attrCount; i ++) {
        switch (attrs[i].name[0]) {
            case 'T':
                if (attrs[i].value) {
                    _typeEncoding = [NSString stringWithUTF8String:attrs[i].value];
                    type = BFEncoingGetType(attrs[i].name);
                    
                } break;
                    case 'V': { // Instance variable
                        if (attrs[i].value) {
                            _ivarName = [NSString stringWithUTF8String:attrs[i].value];
                        }
                    } break;
                    case 'R': {
                        type |= BFEncodingTypePropertyReadonly;
                    } break;
                    case 'C': {
                        type |= BFEncodingTypePropertyCopy;
                    } break;
                    case '&': {
                        type |= BFEncodingTypePropertyRetain;
                    } break;
                    case 'N': {
                        type |= BFEncodingTypePropertyNonatomic;
                    } break;
                    case 'D': {
                        type |= BFEncodingTypePropertyDynamic;
                    } break;
                    case 'W': {
                        type |= BFEncodingTypePropertyWeak;
                    } break;
                    case 'G': {
                        type |= BFEncodingTypePropertyCustomGetter;
                        if (attrs[i].value) {
                            _getter = NSSelectorFromString([NSString stringWithUTF8String:attrs[i].value]);
                        }
                    } break;
                    case 'S': {
                        type |= BFEncodingTypePropertyCustomSetter;
                        if (attrs[i].value) {
                            _setter = NSSelectorFromString([NSString stringWithUTF8String:attrs[i].value]);
                        }
                    } // break; commented for code coverage in next line
                    default: break;
        }
        
    }
    
    if (attrs) {
        free(attrs);
        attrs = NULL;
    }
    
//    _type = type;
    if (_name.length) {
        if (!_getter) {
            _getter = NSSelectorFromString(_name);
        }
        if (!_setter) {
            _setter = NSSelectorFromString([NSString stringWithFormat:@"set%@%@",[_name substringToIndex:1].uppercaseString, [_name substringFromIndex:1]]);
        }
    }
    
    return self;
}


@end

@implementation BFClassInfo

- (instancetype)initWithClass:(Class)cls {
    if (!cls) return nil;
    self = [super init];
    _cls = cls;
    _superClass = class_getSuperclass(cls);
    _isMeta = class_isMetaClass(cls);
    if (!_isMeta) {
        _metaClass = objc_getMetaClass(class_getName(cls));
    }
    _name = NSStringFromClass(cls);
    [self update];
    _superClassInfo = [self.class classInfoWithClass:_superClass];
    return self;
}

+(instancetype)classInfoWithClass:(Class)cls {
    if (!cls) return nil;
    // 使用 CFMutableDictionaryRef 只要是为了避免 key 没有遵守 NSCopy 协议
    static CFMutableDictionaryRef classCache;
    static CFMutableDictionaryRef metaCache;
    static dispatch_once_t onceToken;
    static dispatch_semaphore_t lock;
    dispatch_once(&onceToken, ^{
        classCache = CFDictionaryCreateMutable(CFAllocatorGetDefault(), 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        metaCache = CFDictionaryCreateMutable(CFAllocatorGetDefault(), 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        lock = dispatch_semaphore_create(1);
    });
    dispatch_semaphore_wait(lock, DISPATCH_TIME_FOREVER);
    BFClassInfo *info = CFDictionaryGetValue(class_isMetaClass(cls) ? metaCache : classCache, (__bridge const void *)(cls));
    if (info) {
        [info update];
    }
    dispatch_semaphore_signal(lock);
    if (!info) {
        info = [[BFClassInfo alloc] initWithClass:cls];
        if (info) {
            dispatch_semaphore_wait(lock, DISPATCH_TIME_FOREVER);
            CFDictionarySetValue(info.isMeta ? metaCache : classCache, (__bridge const void *)(cls), (__bridge const void *)info);
            dispatch_semaphore_signal(lock);
        }
    }
    
    return info;
    
}


- (void)update {
    _ivarInfos = nil;
    _methodInfos = nil;
    _propertyInfos = nil;
    
    Class cls = self.cls;
    unsigned int methodCount = 0;
    Method  *methods = class_copyMethodList(cls, &methodCount);
    if (methods) {
        NSMutableDictionary *methodInfos = [NSMutableDictionary new];
        _methodInfos = methodInfos;
        for (unsigned int i = 0; i < methodCount; i ++) {
            BFClassMethodInfo *info = [[BFClassMethodInfo alloc]initWithMethod:methods[i]];
            if (info.name)  methodInfos[info.name] = info;
        }
        free(methods);
    }
    

    unsigned int propertyCount = 0;
    objc_property_t *proprties = class_copyPropertyList(cls, &propertyCount); 
    if (proprties) {
        NSMutableDictionary *propertyInfos = [NSMutableDictionary new];
        _propertyInfos = propertyInfos;
        for (unsigned int i = 0; i < propertyCount; i ++) {
            BFClassPropertyInfo *info = [[BFClassPropertyInfo alloc]initWithProperty:proprties[i]];
            if (info.name) propertyInfos[info.name] = info;
        }
        free(proprties);
    }
    
    unsigned int ivarsCount = 0;
    Ivar *ivars = class_copyIvarList(cls, &propertyCount);
    if (ivars) {
        NSMutableDictionary *ivarsInfos = [NSMutableDictionary new];
        _ivarInfos = ivarsInfos;
        
        for (unsigned int i = 0; i < ivarsCount; i ++) {
            BFClassIvarInfo *info = [[BFClassIvarInfo alloc]initWithIvar:ivars[i]];
            if (info.name) ivarsInfos[info.name] = info;
        }
        
        free(ivars);
    }
    
    if (!_ivarInfos)  _ivarInfos = @{};
    if (!_methodInfos) _methodInfos = @{};
    if (!_propertyInfos) _propertyInfos = @{};
    
//    _needUpdate = NO;
}

@end
