//
//  inputDelegate.h
//  CoredataBase
//
//  Created by Megha on 11/10/15.
//  Copyright (c) 2015 com.parmar. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol inputProtocolDelegate <NSObject>
@required
-(void)compliteDone;
@end

@interface inputDelegate : NSObject{
    
    
}
@property (nonatomic,weak) id<inputProtocolDelegate>inputdelegate1;

@end
