//
//  customButton1.m
//  testButtonDrawing
//
//  Created by David Casini on 5/11/15.
//  Copyright (c) 2015 Dave Casini. All rights reserved.
//

#import "customButton1.h"

@implementation customButton1


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGPoint center;
    center.x = self.bounds.origin.x + self.bounds.size.width / 2.0;
    center.y = self.bounds.origin.y + self.bounds.size.height / 2.0;
    
    float redVal = 0.0;
    float greenVal = 0.0;
    float blueVal = 1.0;
    
    float radius = MIN(self.bounds.size.width, self.bounds.size.height) / 2.0;
    
    float lineWidth = (radius / 40.0);
    
    float currentRadius = (radius - lineWidth);  //subtract line width from radius
    
    int lineCount = 1;
    //1  ////////////////////////////////////////////////////////////////////////////////////////////////  1
    UIBezierPath *path1 = [[UIBezierPath alloc] init];
    [path1 moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
    [path1 addArcWithCenter:center
                     radius:currentRadius
                 startAngle:0.0
                   endAngle:M_PI * 2.0
                  clockwise:YES];
    [[UIColor colorWithRed:redVal green:greenVal blue:blueVal alpha:1.0] setStroke];
    path1.lineWidth = lineWidth;
    [path1 stroke];
    NSLog(@"line%d: red:%f  green:%f   radius:%f  line:%f", lineCount, redVal, greenVal, currentRadius, path1.lineWidth);
    greenVal += 0.05;
    currentRadius -= lineWidth;
    ++lineCount;
    
    //2  ///////////////////////////////////////////////////////////////////////////// 2
    UIBezierPath *path2 = [[UIBezierPath alloc] init];
    [path2 moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
    [path2 addArcWithCenter:center
                     radius:currentRadius
                 startAngle:0.0
                   endAngle:M_PI * 2.0
                  clockwise:YES];
    [[UIColor colorWithRed:redVal green:greenVal blue:blueVal alpha:1.0] setStroke];
    path2.lineWidth = lineWidth;
    [path2 stroke];
    NSLog(@"line%d: red:%f  green:%f   radius:%f  line:%f",lineCount, redVal, greenVal, currentRadius, path2.lineWidth);
    greenVal += 0.05;
    currentRadius -= lineWidth;
    ++lineCount;
    
    //3 /////////////////////////////////////////////////////////////////////////////// 3
    UIBezierPath *path3 = [[UIBezierPath alloc] init];
    [path3 moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
    [path3 addArcWithCenter:center
                     radius:currentRadius
                 startAngle:0.0
                   endAngle:M_PI * 2.0
                  clockwise:YES];
    [[UIColor colorWithRed:redVal green:greenVal blue:blueVal alpha:1.0] setStroke];
    path3.lineWidth = lineWidth;
    [path3 stroke];
    NSLog(@"line%d: red:%f  green:%f   radius:%f  line:%f",lineCount, redVal, greenVal, currentRadius, path3.lineWidth);
    greenVal += 0.05;
    currentRadius -= lineWidth;
    ++lineCount;
    
    //4 ////////////////////////////////////////////////////////////////////////// 4
    UIBezierPath *path4 = [[UIBezierPath alloc] init];
    [path4 moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
    [path4 addArcWithCenter:center
                     radius:currentRadius
                 startAngle:0.0
                   endAngle:M_PI * 2.0
                  clockwise:YES];
    [[UIColor colorWithRed:redVal green:greenVal blue:blueVal alpha:1.0] setStroke];
    path4.lineWidth = lineWidth;
    [path4 stroke];
    NSLog(@"line%d: red:%f  green:%f   radius:%f  line:%f",lineCount, redVal, greenVal, currentRadius, path4.lineWidth);
    greenVal += 0.05;
    currentRadius -= lineWidth;
    ++lineCount;
    
    //5 //////////////////////////////////////////////////////////////////////// 5
    UIBezierPath *path5 = [[UIBezierPath alloc] init];
    [path5 moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
    [path5 addArcWithCenter:center
                     radius:currentRadius
                 startAngle:0.0
                   endAngle:M_PI * 2.0
                  clockwise:YES];
    [[UIColor colorWithRed:redVal green:greenVal blue:blueVal alpha:1.0] setStroke];
    path5.lineWidth = lineWidth;
    [path5 stroke];
    NSLog(@"line%d: red:%f  green:%f   radius:%f  line:%f",lineCount, redVal, greenVal, currentRadius, path5.lineWidth);
    greenVal += 0.05;
    currentRadius -= lineWidth;
    ++lineCount;
    
    
    
    //6 //////////////////////////////////////////////////////////////////// 6
    UIBezierPath *path6 = [[UIBezierPath alloc] init];
    [path6 moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
    [path6 addArcWithCenter:center
                     radius:currentRadius
                 startAngle:0.0
                   endAngle:M_PI * 2.0
                  clockwise:YES];
    [[UIColor colorWithRed:redVal green:greenVal blue:blueVal alpha:1.0] setStroke];
    path6.lineWidth = lineWidth;
    [path6 stroke];
    NSLog(@"line%d: red:%f  green:%f   radius:%f  line:%f",lineCount, redVal, greenVal, currentRadius, path6.lineWidth);
    greenVal += 0.05;
    currentRadius -= lineWidth;
    ++lineCount;
    
    
    //7 ///////////////////////////////////////////////////////////////// 7
    UIBezierPath *path7 = [[UIBezierPath alloc] init];
    [path7 moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
    [path7 addArcWithCenter:center
                     radius:currentRadius
                 startAngle:0.0
                   endAngle:M_PI * 2.0
                  clockwise:YES];
    [[UIColor colorWithRed:redVal green:greenVal blue:blueVal alpha:1.0] setStroke];
    path7.lineWidth = lineWidth;
    [path7 stroke];
    NSLog(@"line%d: red:%f  green:%f   radius:%f  line:%f",lineCount, redVal, greenVal, currentRadius, path7.lineWidth);
    greenVal += 0.05;
    currentRadius -= lineWidth;
    ++lineCount;
    
    //8 ////////////////////////////////////////////////////////////////////////// 8
    UIBezierPath *path8 = [[UIBezierPath alloc] init];
    [path8 moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
    [path8 addArcWithCenter:center
                     radius:currentRadius
                 startAngle:0.0
                   endAngle:M_PI * 2.0
                  clockwise:YES];
    [[UIColor colorWithRed:redVal green:greenVal blue:blueVal alpha:1.0] setStroke];
    path8.lineWidth = lineWidth;
    [path8 stroke]; NSLog(@"line%d: red:%f  green:%f   radius:%f  line:%f",lineCount, redVal, greenVal, currentRadius, path8.lineWidth);
    greenVal += 0.05;
    currentRadius -= lineWidth;
    ++lineCount;
    
    //9 ////////////////////////////////////////////////////////////////////////// 9
    UIBezierPath *path9 = [[UIBezierPath alloc] init];
    [path9 moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
    [path9 addArcWithCenter:center
                     radius:currentRadius
                 startAngle:0.0
                   endAngle:M_PI * 2.0
                  clockwise:YES];
    [[UIColor colorWithRed:redVal green:greenVal blue:blueVal alpha:1.0] setStroke];
    path9.lineWidth = lineWidth;
    [path9 stroke];
    NSLog(@"line%d: red:%f  green:%f   radius:%f  line:%f",lineCount, redVal, greenVal, currentRadius, path9.lineWidth);
    greenVal += 0.05;
    currentRadius -= lineWidth;
    ++lineCount;
    
    //10 ////////////////////////////////////////////////////////////////////////// 10
    UIBezierPath *path10 = [[UIBezierPath alloc] init];
    [path10 moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
    [path10 addArcWithCenter:center
                      radius:currentRadius
                  startAngle:0.0
                    endAngle:M_PI * 2.0
                   clockwise:YES];
    [[UIColor colorWithRed:redVal green:greenVal blue:blueVal alpha:1.0] setStroke];
    path10.lineWidth = lineWidth;
    [path10 stroke];
    NSLog(@"line%d: red:%f  green:%f   radius:%f  line:%f",lineCount, redVal, greenVal, currentRadius, path10.lineWidth);
    greenVal += 0.05;
    currentRadius -= lineWidth;
    ++lineCount;
    
    
    
    //=========================================================================================
    //=========================================================================================
    //=========================================================================================
    
    
    
    
    //11  ////////////////////////////////////////////////////////////////////////////////////////////////  11
    UIBezierPath *path11 = [[UIBezierPath alloc] init];
    //path1 = new path1;
    [path11 moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
    [path11 addArcWithCenter:center
                      radius:currentRadius
                  startAngle:0.0
                    endAngle:M_PI * 2.0
                   clockwise:YES];
    [[UIColor colorWithRed:redVal green:greenVal blue:blueVal alpha:1.0] setStroke];
    path11.lineWidth = lineWidth;
    [path11 stroke];
    NSLog(@"line%d: red:%f  green:%f   radius:%f  line:%f",lineCount, redVal, greenVal, currentRadius, path11.lineWidth);
    redVal +=0.1;
    greenVal += 0.05;
    currentRadius -= lineWidth;
    ++lineCount;
    
    //12  ///////////////////////////////////////////////////////////////////////////// 12
    UIBezierPath *path12 = [[UIBezierPath alloc] init];
    [path12 moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
    [path12 addArcWithCenter:center
                      radius:currentRadius
                  startAngle:0.0
                    endAngle:M_PI * 2.0
                   clockwise:YES];
    [[UIColor colorWithRed:redVal green:greenVal blue:blueVal alpha:1.0] setStroke];
    path12.lineWidth = lineWidth;
    [path12 stroke];
    NSLog(@"line%d: red:%f  green:%f   radius:%f  line:%f",lineCount, redVal, greenVal, currentRadius, path12.lineWidth);
    redVal +=0.1;
    greenVal += 0.05;
    currentRadius -= lineWidth;
    ++lineCount;
    
    //13 /////////////////////////////////////////////////////////////////////////////// 13
    UIBezierPath *path13 = [[UIBezierPath alloc] init];
    [path13 moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
    [path13 addArcWithCenter:center
                      radius:currentRadius
                  startAngle:0.0
                    endAngle:M_PI * 2.0
                   clockwise:YES];
    [[UIColor colorWithRed:redVal green:greenVal blue:blueVal alpha:1.0] setStroke];
    path13.lineWidth = lineWidth;
    [path13 stroke];
    NSLog(@"line%d: red:%f  green:%f   radius:%f  line:%f",lineCount, redVal, greenVal, currentRadius, path13.lineWidth);
    redVal +=0.1;
    greenVal += 0.05;
    currentRadius -= lineWidth;
    ++lineCount;
    
    //14 ////////////////////////////////////////////////////////////////////////// 14
    UIBezierPath *path14 = [[UIBezierPath alloc] init];
    [path14 moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
    [path14 addArcWithCenter:center
                      radius:currentRadius
                  startAngle:0.0
                    endAngle:M_PI * 2.0
                   clockwise:YES];
    [[UIColor colorWithRed:redVal green:greenVal blue:blueVal alpha:1.0] setStroke];
    path14.lineWidth = lineWidth;
    [path14 stroke];
    NSLog(@"line%d: red:%f  green:%f   radius:%f  line:%f",lineCount, redVal, greenVal, currentRadius, path14.lineWidth);
    redVal +=0.1;
    greenVal += 0.05;
    currentRadius -= lineWidth;
    ++lineCount;
    
    
    //15 //////////////////////////////////////////////////////////////////////// 15
    UIBezierPath *path15 = [[UIBezierPath alloc] init];
    [path15 moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
    [path15 addArcWithCenter:center
                      radius:currentRadius
                  startAngle:0.0
                    endAngle:M_PI * 2.0
                   clockwise:YES];
    [[UIColor colorWithRed:redVal green:greenVal blue:blueVal alpha:1.0] setStroke];
    path15.lineWidth = lineWidth;
    [path15 stroke];
    NSLog(@"line%d: red:%f  green:%f   radius:%f  line:%f",lineCount, redVal, greenVal, currentRadius, path15.lineWidth);
    redVal +=0.1;
    greenVal += 0.05;
    currentRadius -= lineWidth;
    ++lineCount;
    
    //16 //////////////////////////////////////////////////////////////////// 16
    UIBezierPath *path16 = [[UIBezierPath alloc] init];
    [path16 moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
    [path16 addArcWithCenter:center
                      radius:currentRadius
                  startAngle:0.0
                    endAngle:M_PI * 2.0
                   clockwise:YES];
    [[UIColor colorWithRed:redVal green:greenVal blue:blueVal alpha:1.0] setStroke];
    path16.lineWidth = lineWidth;
    [path16 stroke];
    NSLog(@"line%d: red:%f  green:%f   radius:%f  line:%f",lineCount, redVal, greenVal, currentRadius, path16.lineWidth);
    redVal +=0.1;
    greenVal += 0.05;
    currentRadius -= lineWidth;
    ++lineCount;
    
    
    //17 ///////////////////////////////////////////////////////////////// 17
    UIBezierPath *path17 = [[UIBezierPath alloc] init];
    [path17 moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
    [path17 addArcWithCenter:center
                      radius:currentRadius
                  startAngle:0.0
                    endAngle:M_PI * 2.0
                   clockwise:YES];
    [[UIColor colorWithRed:redVal green:greenVal blue:blueVal alpha:1.0] setStroke];
    path17.lineWidth = lineWidth;
    [path17 stroke];
    NSLog(@"line%d: red:%f  green:%f   radius:%f  line:%f",lineCount, redVal, greenVal, currentRadius, path17.lineWidth);
    redVal +=0.1;
    greenVal += 0.05;
    currentRadius -= lineWidth;
    ++lineCount;
    
    //18 ////////////////////////////////////////////////////////////////////////// 18
    UIBezierPath *path18 = [[UIBezierPath alloc] init];
    [path18 moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
    [path18 addArcWithCenter:center
                      radius:currentRadius
                  startAngle:0.0
                    endAngle:M_PI * 2.0
                   clockwise:YES];
    [[UIColor colorWithRed:redVal green:greenVal blue:blueVal alpha:1.0] setStroke];
    path18.lineWidth = lineWidth;
    [path18 stroke];
    NSLog(@"line%d: red:%f  green:%f   radius:%f  line:%f",lineCount, redVal, greenVal, currentRadius, path18.lineWidth);
    redVal +=0.1;
    greenVal += 0.05;
    currentRadius -= lineWidth;
    ++lineCount;
    
    //19 ////////////////////////////////////////////////////////////////////////// 19
    UIBezierPath *path19 = [[UIBezierPath alloc] init];
    [path19 moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
    [path19 addArcWithCenter:center
                      radius:currentRadius
                  startAngle:0.0
                    endAngle:M_PI * 2.0
                   clockwise:YES];
    [[UIColor colorWithRed:redVal green:greenVal blue:blueVal alpha:1.0] setStroke];
    path19.lineWidth = lineWidth;
    [path19 stroke];
    NSLog(@"line%d: red:%f  green:%f   radius:%f  line:%f",lineCount, redVal, greenVal, currentRadius, path19.lineWidth);
    redVal +=0.1;
    greenVal += 0.05;
    currentRadius -= lineWidth;
    ++lineCount;
    
    //20 ////////////////////////////////////////////////////////////////////////// 20
    UIBezierPath *path20 = [[UIBezierPath alloc] init];
    [path20 moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
    [path20 addArcWithCenter:center
                      radius:currentRadius
                  startAngle:0.0
                    endAngle:M_PI * 2.0
                   clockwise:YES];
    [[UIColor colorWithRed:redVal green:greenVal blue:blueVal alpha:1.0] setStroke];
    path20.lineWidth = lineWidth;
    [path20 stroke];
    NSLog(@"line%d: red:%f  green:%f   radius:%f  line:%f",lineCount, redVal, greenVal, currentRadius, path20.lineWidth);
    //    redVal +=0.1;
    //    greenVal += 0.05;
    //    currentRadius -= lineWidth;
    //    ++lineCount;
    
    // =============
    
    
    
    //FILL ////////////////////////////////////////////////////////////////////////// FILL
    UIBezierPath *path21 = [[UIBezierPath alloc] init];
    [path21 moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
    [path21 addArcWithCenter:center
                      radius:currentRadius
                  startAngle:0.0
                    endAngle:M_PI * 2.0
                   clockwise:YES];
    [[UIColor whiteColor]setFill];
    [path21 fill];
}


@end



/* /
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
 */
