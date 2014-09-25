//
//  PageControl.m
//
//  Created by Kireto.
//  Copyright (c) 2014 Kireto. All rights reserved.
//

#import "PageControl.h"

@interface PageControl ()

@property (nonatomic,strong) UIImage *selectImage;
@property (nonatomic,strong) UIImage *normalImage;

@end

@implementation PageControl

- (void)setCurrentPage:(NSInteger)currentPage {
    [super setCurrentPage:currentPage];
    [self updateDotImages];
}

- (void)updateDotImages {
    
    if (!self.selectImage) {
        self.selectImage = [UIImage imageNamed:@"dotSelect"];
    }
    if (!self.normalImage) {
        self.normalImage = [UIImage imageNamed:@"dotNormal"];
    }
    
    for (int i = 0; i < [self.subviews count]; i++) {
        
        UIImage *dotImage;
        if (i == self.currentPage) {
            dotImage = self.selectImage;
        }
        else {
            dotImage = self.normalImage;
        }
        
        UIView *dotView = [self.subviews objectAtIndex:i];
        if ([dotView isKindOfClass:[UIImageView class]]) {
            UIImageView* dot = (UIImageView*)dotView;
            dot.frame = CGRectMake(dot.frame.origin.x, dot.frame.origin.y, dotImage.size.width, dotImage.size.height);
            dot.image = dotImage;
        }
        else {
            dotView.frame = CGRectMake(dotView.frame.origin.x, dotView.frame.origin.y, dotImage.size.width, dotImage.size.height);
            [dotView setBackgroundColor:[UIColor colorWithPatternImage:dotImage]];
        }
    }
}

@end
