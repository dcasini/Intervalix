//
//  customButton1.m
//  Intervalix
//
//  Created by David Casini on 5/5/15.
//  Copyright (c) 2015 Dave Casini. All rights reserved.
//

#import "customButton1.h"

@implementation customButton1

- (void)drawRect:(CGRect)rect {
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:5];
    
    [[UIColor blueColor] setStroke];
    
    path.lineWidth = 5;
    
    [path stroke];
    
}

@end
