//
//  WeakTimerHandler.h
//
//
//  Created by Rituyou on 2020/4/13.
//  Copyright © 2020 1. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeakTimerHandler : NSProxy

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                      target:(id)aTarget
                                    selector:(SEL)aSelector
                                    userInfo:(id)userInfo
                                     repeats:(BOOL)repeats;

@end

NS_ASSUME_NONNULL_END
