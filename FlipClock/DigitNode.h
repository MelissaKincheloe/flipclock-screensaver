//The MIT License (MIT) Copyright (c) <2013> <Jonathan Salvador>
//
//Permission is hereby granted, free of charge, to any person obtaining a
//copy of this software and associated documentation files (the
//"Software"), to deal in the Software without restriction, including
//without limitation the rights to use, copy, modify, merge, publish,
//distribute, sublicense, and/or sell copies of the Software, and to
//permit persons to whom the Software is furnished to do so, subject to
//the following conditions:
//
//The above copyright notice and this permission notice shall be included
//in all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
//OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
//IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
//CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
//TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
//SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//
//  DigitNode.h
//  ClockDemo
//
//  Created by Jonathan Salvador on 11/25/12.
//  Copyright (c) 2012 Jonathan Salvador. All rights reserved.
//

#import <SceneKit/SceneKit.h>

typedef NS_ENUM(NSInteger, DigitType) {
    kZero,
    kOne,
    kTwo,
    kThree,
    kFour,
    kFive,
    kSix,
    kSeven,
    kEight,
    kNine,
    kAM,
    kPM,
    numDigitType
};

@interface DigitNode : SCNNode{
    NSString *currentTexturePrefix;
    SCNPlane *topHalf;
    SCNPlane *bottomHalf;
}

@property (nonatomic, retain) NSString *currentTexturePrefix;


- (void)flipToDigit:(DigitType)givenDigitType;
- (void)startDigitAt:(DigitType)givenDigitType;

+ (NSDictionary<NSString *, NSImage*> *)textures;
+ (CGFloat)getDigitWidth;

@end
