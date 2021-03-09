//
//  BFTestFileModel.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/8/19.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "BFTestFileModel.h"

@implementation BFTestFileModel

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:_name forKey:@"kName"];
    [coder encodeObject:_title forKey:@"kTitle"];
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super init]) {
        self.name = [coder decodeObjectForKey:@"kName"];
        self.title = [coder decodeObjectForKey:@"kTitle"];
    }
    return self;
}

+(BOOL)supportsSecureCoding {
    return YES;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"name:%@----title:%@",self.name, self.title];
}

@end
