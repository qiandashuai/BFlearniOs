//
//  BFAspect.h
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/4/21.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_OPTIONS(NSUInteger, BFAspectOptions) {
    BFAspectOptionsAfter = 0,
    BFAspectOptionsInstead = 1,
    BFAspectOptionsBefore = 2,
    
    BFAspectOptionsAutomaticRemovel = 1 << 3 /// will remove the hook after the first execution
};



@protocol BFAspectToken <NSObject>


//  @return YES if deregisteration is successful, otherwise No,
- (BOOL)remove;

@end


// The AspectInfo protocol is the first parameter of our block syntax.
@protocol BFAspectInfo <NSObject>

- (id)instance;

// the origin invocation of the hooked method
- (NSInvocation *)originInvocation;

// all method argument , boxed ,
-(NSArray *)argument;

@end


@interface NSObject (BFAspect)

+(id<BFAspectToken>)bfaspect_hookSelector:(SEL)selector
                              withOptions:(BFAspectOptions)options
                              useingBlock:(id)block
                                    error:(NSError **)error;

- (id<BFAspectToken>)bfaspect_hookSelector:(SEL)selector
                               withOptions:(BFAspectOptions)options
                               useingBlock:(id)block
                                     error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
