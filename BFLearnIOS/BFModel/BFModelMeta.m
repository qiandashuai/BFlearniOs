//
//  BFModelMeta.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/4/14.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "BFModelMeta.h"

BFEncoingType  BFEncoingGetType(const char *typeEncoding) {
  
    char *type = (char *)typeEncoding;
    if (!type) return BFEncodingTypeUnknown;
    size_t len = strlen(type);
    if (len == 0) return BFEncodingTypeUnknown;
    
    BFEncoingType qualifier = 0;
    bool prefix = true;
    while (prefix) {
        switch (*type) {
             case 'r': {
                           qualifier |= BFEncodingTypeQualifierConst; // qualifiler = qulifier|BFEncodingTypeQualifierConst
                           type++;
                       } break;
                       case 'n': {
                           qualifier |= BFEncodingTypeQualifierIn;
                           type++;
                       } break;
                       case 'N': {
                           qualifier |= BFEncodingTypeQualifierInout;
                           type++;
                       } break;
                       case 'o': {
                           qualifier |= BFEncodingTypeQualifierOut;
                           type++;
                       } break;
                       case 'O': {
                           qualifier |= BFEncodingTypeQualifierBycopy;
                           type++;
                       } break;
                       case 'R': {
                           qualifier |= BFEncodingTypeQualifierByref;
                           type++;
                       } break;
                       case 'V': {
                           qualifier |= BFEncodingTypeQualifierOneway;
                           type++;
                       } break;
                       default: { prefix = false; } break;
                }
        }
    len = strlen(type);
    if (len == 0) return BFEncodingTypeUnknown | qualifier;
    switch (*type) {
        case 'v': return BFEncodingTypeVoid | qualifier;
        case 'B': return BFEncodingTypeBool | qualifier;
        case 'c': return BFEncodingTypeInt8 | qualifier;
        case 'C': return BFEncodingTypeUInt8 | qualifier;
        case 's': return BFEncodingTypeInt16 | qualifier;
        case 'S': return BFEncodingTypeUInt16 | qualifier;
        case 'i': return BFEncodingTypeInt32 | qualifier;
        case 'I': return BFEncodingTypeUInt32 | qualifier;
        case 'l': return BFEncodingTypeInt32 | qualifier;
        case 'L': return BFEncodingTypeUInt32 | qualifier;
        case 'q': return BFEncodingTypeInt64 | qualifier;
        case 'Q': return BFEncodingTypeUInt64 | qualifier;
        case 'f': return BFEncodingTypeFloat | qualifier;
        case 'd': return BFEncodingTypeDouble | qualifier;
        case 'D': return BFEncodingTypeLongDouble | qualifier;
        case '#': return BFEncodingTypeClass | qualifier;
        case ':': return BFEncodingTypeSEL | qualifier;
        case '*': return BFEncodingTypeCString | qualifier;
        case '^': return BFEncodingTypePointer | qualifier;
        case '[': return BFEncodingTypeCArray | qualifier;
        case '(': return BFEncodingTypeUnion | qualifier;
        case '{': return BFEncodingTypeStruct | qualifier;
        case '@': {
            if (len == 2 && *(type + 1) == '?')
                return BFEncodingTypeBlock | qualifier;
            else
                return BFEncodingTypeObject | qualifier;
        }
        default: return BFEncodingTypeUnknown | qualifier;
    }
};

static force_inline BFEncoingNSType BFClassGetNStype(Class cls) {
    if (!cls) return BFEncodingTypeNSUnknown;
    if ([cls isSubclassOfClass:[NSMutableString class]]) return BFEncodingTypeNSMutableString;
    if ([cls isSubclassOfClass:[NSString class]]) return BFEncodingTypeNSString;
    if ([cls isSubclassOfClass:[NSDecimalNumber class]]) return BFEncodingTypeNSDecimalNumber;
    if ([cls isSubclassOfClass:[NSNumber class]]) return BFEncodingTypeNSNumber;
    if ([cls isSubclassOfClass:[NSValue class]]) return BFEncodingTypeNSValue;
    if ([cls isSubclassOfClass:[NSMutableData class]]) return BFEncodingTypeNSMutableData;
    if ([cls isSubclassOfClass:[NSData class]]) return BFEncodingTypeNSData;
    if ([cls isSubclassOfClass:[NSDate class]]) return BFEncodingTypeNSDate;
    if ([cls isSubclassOfClass:[NSURL class]]) return BFEncodingTypeNSURL;
    if ([cls isSubclassOfClass:[NSMutableArray class]]) return BFEncodingTypeNSMutableArray;
    if ([cls isSubclassOfClass:[NSArray class]]) return BFEncodingTypeNSArray;
    if ([cls isSubclassOfClass:[NSMutableDictionary class]]) return BFEncodingTypeNSMutableDictionary;
    if ([cls isSubclassOfClass:[NSDictionary class]]) return BFEncodingTypeNSDictionary;
    if ([cls isSubclassOfClass:[NSMutableSet class]]) return BFEncodingTypeNSMutableSet;
    if ([cls isSubclassOfClass:[NSSet class]]) return BFEncodingTypeNSSet;
    return BFEncodingTypeNSUnknown;
}

static force_inline BOOL YYEncodingTypeIsCNumber(BFEncoingType type) {
    switch (type & BFEncodingTypeMask) {
        case BFEncodingTypeBool:
        case BFEncodingTypeInt8:
        case BFEncodingTypeUInt8:
        case BFEncodingTypeInt16:
        case BFEncodingTypeUInt16:
        case BFEncodingTypeInt32:
        case BFEncodingTypeUInt32:
        case BFEncodingTypeInt64:
        case BFEncodingTypeUInt64:
        case BFEncodingTypeFloat:
        case BFEncodingTypeDouble:
        case BFEncodingTypeLongDouble: return YES;
        default: return NO;
    }
}

@implementation BFModelPropertyMeta


+(instancetype)metaWithClassInfo:(BFClassInfo *)classInfo propertyInfo:(BFClassPropertyInfo *)proprttyInfo generic:(Class)generic {
    
    
//    if (!generic && proprttyInfo.protocols) {
//        for (NSString *protocol in proprttyInfo.protocols) {
//            Class cls = object_getClass(protocol.UTF8String);
//            if (cls) {
//                generic = cls;
//                break;
//            }
//        }
//    }
//
    
    
    
    BFModelPropertyMeta *meta = [self new];
    meta->_name = proprttyInfo.name;
    meta->_type = proprttyInfo.type;
  //  meta->_info = proprttyInfo;
    meta->_genericCls = generic;
    
    if ((meta->_type & BFEncodingTypeMask) == BFEncodingTypeObject) {
        meta->_nsType = BFClassGetNStype(classInfo.cls);
    }else {
//        meta->_isCNumber = BFEncodingTypeIsCNumber(meta->_type);
    }
    
    if ((meta->_type & BFEncodingTypeMask) == BFEncodingTypeStruct) {
        
        /**
         It seems that NSKeyedUnarhciver cannot decode NSValue except these structs;
         */
        
    }
    meta->_cls = proprttyInfo.cls;
    
//    if (generic) {
//        meta->_hasCustomClassFromDictionary = [generic respondsToSelector:@selector(modelCustomClassForDictionary)];
//    }
    
    if (proprttyInfo.getter) {
        if ([classInfo.cls instancesRespondToSelector:proprttyInfo.getter]) {
            meta->_getter = proprttyInfo.getter;
        }
    }
    
    if (proprttyInfo.setter) {
        if ([classInfo.cls instancesRespondToSelector:proprttyInfo.setter]) {
            meta->_setter = proprttyInfo.setter;
        }
    }
    
    return meta;
}


@end

@implementation BFModelMeta


+(instancetype)metaWithClass:(Class)cls {
    if (!cls) return nil;
    static CFMutableDictionaryRef cache;
    static dispatch_once_t onceToken;
    static dispatch_semaphore_t lock;
    dispatch_once(&onceToken, ^{
        // 创建一个mutableDict TODO:
        // 缓存 cls: model;
        cache = CFDictionaryCreateMutable(CFAllocatorGetDefault(), 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        lock = dispatch_semaphore_create(1);
    });
    dispatch_semaphore_wait(lock, DISPATCH_TIME_FOREVER);
    BFModelMeta *meta = CFDictionaryGetValue(cache, (__bridge const void *)(cls));
    dispatch_semaphore_signal(lock);
    // TODO: -> 和 .
    if (!meta) {
        meta = [[BFModelMeta alloc]initWithClass:cls];
        if (meta) {
            dispatch_semaphore_wait(lock, DISPATCH_TIME_FOREVER);
            CFDictionarySetValue(cache,(__bridge const void *)cls, (__bridge const void *)meta);
            dispatch_semaphore_signal(lock);
        }
    }
    return meta;
    
}


-(instancetype)initWithClass:(Class)cls {
   
    BFClassInfo *classInfo = [BFClassInfo classInfoWithClass:cls];
    self = [super init];
    
    NSDictionary *genericMapper = nil;
    
    if ([cls respondsToSelector:@selector(modelContainerPropertyGenericClass)]) {
        genericMapper = [(id<BFModel>)cls modelContainerPropertyGenericClass];
        if (genericMapper) {
            NSMutableDictionary *tmp = [NSMutableDictionary new];
            [genericMapper enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
                if (![key isKindOfClass:[NSString class]]) return ;
                Class meta = object_getClass(obj);
                if (!meta) return;
                if (class_isMetaClass(meta)) {
                    tmp[key] =obj;
                } else if ([obj isKindOfClass:[NSString class]]) {
                    Class cls = NSClassFromString(obj);
                    if (cls) {
                        tmp[key] = cls;
                    }
                }
            }];
            genericMapper = tmp;
        }
    }
    
    NSMutableDictionary *allPropertyMetas = [NSMutableDictionary new];
    BFClassInfo *curClassInfo = classInfo;
    while (curClassInfo && curClassInfo.superClass != nil) {
        for (BFClassPropertyInfo *property in curClassInfo.propertyInfos.allValues) {
            BFModelPropertyMeta *meta = [BFModelPropertyMeta metaWithClassInfo:classInfo propertyInfo:property generic:genericMapper[property.name]];
            if (!meta || !meta->_name) continue;
            if (!meta->_getter || !meta->_setter) continue;
            if (allPropertyMetas[meta->_name]) continue;
            allPropertyMetas[meta->_name] = meta;
        }
        curClassInfo = curClassInfo.superClassInfo;
    }
    
    if (allPropertyMetas.count)  allPropertyMetas = allPropertyMetas.allValues.copy;
    
    
    
    
    return [BFModelMeta new];
}



@end
