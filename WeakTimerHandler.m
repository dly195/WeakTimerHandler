//
//  WeakTimerHandler.m
//
//
//  Created by Rituyou on 2020/4/13.
//  Copyright © 2020 1. All rights reserved.
//

#import "WeakTimerHandler.h"

@interface WeakTimerHandler ()

@property (nonatomic, weak) id target;

@end

@implementation WeakTimerHandler


+ (NSTimer *) scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                      target:(id)aTarget
                                    selector:(SEL)aSelector
                                    userInfo:(id)userInfo
                                     repeats:(BOOL)repeats {
    
    WeakTimerHandler *timerHandler = [WeakTimerHandler alloc];
    timerHandler.target = aTarget;
    return [NSTimer scheduledTimerWithTimeInterval:interval target:timerHandler
                                          selector:aSelector
                                          userInfo:userInfo
                                           repeats:repeats];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    NSMethodSignature *sig = nil;
    sig = [_target methodSignatureForSelector:aSelector];
    if (sig) {
        return sig;
    }
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation{
    [anInvocation invokeWithTarget:self.target];
}


@end
