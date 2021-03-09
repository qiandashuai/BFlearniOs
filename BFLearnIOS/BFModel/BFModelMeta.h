//
//  BFModelMeta.h
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/4/14.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BFClassInfo.h"
#import "NSObject+BFModel.h"

NS_ASSUME_NONNULL_BEGIN

#define force_inline __inline__ __attribute__((always_inline))


// 强内联，所有加 __inline__ __attribute__((always_inline)) 修饰的函数在调用的时候不会被编译成函数调用，而是直接扩展到调用函数体内。

typedef NS_ENUM(NSUInteger, BFEncoingNSType) {
    BFEncodingTypeNSUnknown = 0,
    BFEncodingTypeNSString,
    BFEncodingTypeNSMutableString,
    BFEncodingTypeNSValue,
    BFEncodingTypeNSNumber,
    BFEncodingTypeNSDecimalNumber,
    BFEncodingTypeNSData,
    BFEncodingTypeNSMutableData,
    BFEncodingTypeNSDate,
    BFEncodingTypeNSURL,
    BFEncodingTypeNSArray,
    BFEncodingTypeNSMutableArray,
    BFEncodingTypeNSDictionary,
    BFEncodingTypeNSMutableDictionary,
    BFEncodingTypeNSSet,
    BFEncodingTypeNSMutableSet,
};

typedef NS_OPTIONS(NSUInteger, BFEncoingType) {
    BFEncodingTypeMask = 0xFF,     ///< mask of type value
    BFEncodingTypeUnknown = 0,     ///< unknown
    BFEncodingTypeVoid = 1,        ///< void
    BFEncodingTypeBool = 2,        ///< bool
    BFEncodingTypeInt8 = 3,        ///< char / BOOL
    BFEncodingTypeUInt8 = 4,       ///< unsigned char
    BFEncodingTypeInt16 = 5,       ///< short
    BFEncodingTypeUInt16 = 6,      ///< unsigned short
    BFEncodingTypeInt32 = 7,       ///< int
    BFEncodingTypeUInt32 = 8,      ///< unsigned int
    BFEncodingTypeInt64 = 9,       ///< long long
    BFEncodingTypeUInt64 = 10,     ///< unsigned long long
    BFEncodingTypeFloat = 11,      ///< float
    BFEncodingTypeDouble = 12,     ///< double
    BFEncodingTypeLongDouble = 13, ///< long double
    BFEncodingTypeObject = 14,     ///< id
    BFEncodingTypeClass = 15,      ///< Class
    BFEncodingTypeSEL = 16,        ///< SEL
    BFEncodingTypeBlock = 17,      ///< block
    BFEncodingTypePointer = 18,    ///< void*
    BFEncodingTypeStruct = 19,     ///< struct
    BFEncodingTypeUnion = 20,      ///< union
    BFEncodingTypeCString = 21,    ///< char*
    BFEncodingTypeCArray = 22,     ///< char[10] (for example)

    // 键盘中的属性
    BFEncodingTypeQualifierMask = 0xFF00,    ///< mask of qualifier
    BFEncodingTypeQualifierConst = 1 << 8,   ///< const
    BFEncodingTypeQualifierIn = 1 << 9,      ///< in
    BFEncodingTypeQualifierInout = 1 << 10,  ///< inout
    BFEncodingTypeQualifierOut = 1 << 11,    ///< out
    BFEncodingTypeQualifierBycopy = 1 << 12, ///< bycopy
    BFEncodingTypeQualifierByref = 1 << 13,  ///< byref
    BFEncodingTypeQualifierOneway = 1 << 14, ///< oneway

    BFEncodingTypePropertyMask = 0xFF0000,        ///< mask of property
    BFEncodingTypePropertyReadonly = 1 << 16,     ///< readonly
    BFEncodingTypePropertyCopy = 1 << 17,         ///< copy
    BFEncodingTypePropertyRetain = 1 << 18,       ///< retain
    BFEncodingTypePropertyNonatomic = 1 << 19,    ///< nonatomic
    BFEncodingTypePropertyWeak = 1 << 20,         ///< weak
    BFEncodingTypePropertyCustomGetter = 1 << 21, ///< getter=
    BFEncodingTypePropertyCustomSetter = 1 << 22, ///< setter=
    BFEncodingTypePropertyDynamic = 1 << 23,      ///< @dynamic
};

BFEncoingType BFEncoingGetType(const char *typeEncoding);

static force_inline BFEncoingNSType BFClassGetNStype(Class cls);
//static force_inline BOOL BFEncodingTypeIsCNumber(BFEncoingType type);

@interface BFModelPropertyMeta : NSObject {
  @package
    NSString *_name;
    BFEncoingType _type;
    BFEncoingNSType _nsType;
    BOOL _isCNumber;
    Class _cls;
    Class _genericCls; // generic cls
    SEL _getter;
    SEL _setter;
    BOOL _isKVCCompatible; //
    BOOL _isStructAvailableForKeyedArchiver;
    BOOL _hasCustomClassFromDictionary;
    
    NSString *_mappedToKey;
    NSArray *_mappedToKeyPath;
    NSArray *_mappedToKeyArray;
//    BFClassPropertyInfo *_info; //
//    BFModelPropertyMeta *_next; // next info multiple properties mapped to the same key
    
    
}

//+(instancetype)metaWithClassInfo:(BFClassInfo *)classInfo propertyInfo:(BFClassPropertyInfo *)proprttyInfo generic:(Class)generic;

@end

// 核心辅助类
@interface BFModelMeta : NSObject {
//    BFClassInfo *_classInfo;
    NSDictionary *_mapper; // key-value: key mapped key and keypath, value: yymodelPropertyMeta;
    NSArray *_allPropertyMetas;
    NSArray *_keyPathPropertyMetas;
    NSArray *_multiKeyPropertyMetas;
    NSUInteger keyMappedCount;
    BFEncoingNSType _nsType;
    
    BOOL _hasCustomWillTransformFromDictionary;
    BOOL _hasCustomTransformFromDictionary;
    BOOL _hasCustomTransformToDictionary;
    BOOL _hasCustomClassFromDictionary;
}

- (instancetype)initWithClass:(Class)cls;
+ (instancetype)metaWithClass:(Class)cls;

@end

NS_ASSUME_NONNULL_END
