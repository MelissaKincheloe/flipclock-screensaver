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
//  DigitAnimationDelegate.m
//  ClockDemo
//
//  Created by Jonathan Salvador on 1/24/13.
//  Copyright (c) 2013 Jonathan Salvador. All rights reserved.
//

#import "DigitAnimationDelegate.h"
#import "DigitAnimationModel.h"
#import "SCNPlane+FlipClock.h"

@implementation DigitAnimationDelegate


- (void)animationDidStart:(CAAnimation *)theAnimation{
    
    DigitAnimationModel *container = theAnimation.animationModel;
    
    //update topHalf
    [container.topHalf applyMaterialWithName:[NSString stringWithFormat:@"%@_top", container.texturePrefix]];
}

- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag{
    
    
    if(flag){
        
        DigitAnimationModel *container = theAnimation.animationModel;
        
        //update bottomHalf
        [container.bottomHalf applyMaterialWithName:[NSString stringWithFormat:@"%@_bot", container.texturePrefix]];
        
        //Nil the NSImages in the given material array
        for (SCNPlane* __strong currentPlane in container.planes) {
            SCNMaterial *currentMaterial = [[currentPlane materials] objectAtIndex:0];
            currentMaterial.diffuse.contents = nil;
            currentMaterial = nil;
            currentPlane = nil;
        }
        
        for(SCNNode* __strong currentNode in container.nodes){
            
            [currentNode cleanupAndRemoveFromParentNode];
            currentNode = nil;
        }
        
        //remove flipper
        [container.flipNode cleanupAndRemoveFromParentNode];
        container.flipNode = nil;
        
        theAnimation.animationModel = nil;
        theAnimation.delegate = nil;
    }
}

@end
