//
//  CardGridViewController.m
//  OOP-Cards-Views
//
//  Created by Al Tyus on 2/18/14.
//  Copyright (c) 2014 Flatiron School. All rights reserved.
//

#import "CardGridViewController.h"

@interface CardGridViewController ()
- (IBAction)paddingButton:(id)sender;
@property (nonatomic) NSUInteger paddingToggle;

@end

@implementation CardGridViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.paddingToggle = 20;
    [self padding];
    
    
    for (UIView *cardView in self.cardsCollection)
    {
               if ([cardView isKindOfClass:[UIImageView class]])
        {
            NSLog(@"%fpts x %fpts", cardView.frame.size.width, cardView.frame.size.height);
            NSLog(@"x = %f x y = %f", cardView.frame.origin.x, cardView.frame.origin.y);
        }
    }
    
    
//    
//    UIImageView *card1 = self.cardsCollection[0];
//    card1.frame = CGRectMake(20, 20, 80, 107);
//    card1.frame = CGRectMake(3, 4, 240, 80);
//    UIImageView *card2 = self.cardsCollection[1];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)padding
{
    NSUInteger deviceWidth = self.view.bounds.size.width;
    NSUInteger deviceHeight = self.view.bounds.size.height;
    NSUInteger padding = self.paddingToggle;
    NSUInteger leftPadding = padding;
    NSUInteger topPadding = padding;
    NSUInteger rows = 4;
    NSUInteger columns = 3;
    NSUInteger cardWidth = (deviceWidth - padding * (columns + 1)) / columns;
    NSUInteger cardHeight = (deviceHeight - padding * (rows + 1)) / rows;
    
    NSMutableArray *cardsCollection = [NSMutableArray array];
    for (UIView *cardView in self.cardsCollection)
    {
        [cardsCollection addObject:cardView];
        if ([cardsCollection count] <= 3) {
            cardView.frame = CGRectMake(leftPadding, topPadding, cardWidth, cardHeight);
            leftPadding += cardWidth + padding;
            
} else if ([cardsCollection count] <= 6) {
    cardView.frame = CGRectMake(leftPadding, topPadding, cardWidth, cardHeight);
    leftPadding += cardWidth + padding;
        } else if ([cardsCollection count] <= 9) {
            cardView.frame = CGRectMake(leftPadding, topPadding, cardWidth, cardHeight);
            leftPadding += cardWidth + padding;
        } else if ([cardsCollection count] <= 12) {
            cardView.frame = CGRectMake(leftPadding, topPadding, cardWidth, cardHeight);
            leftPadding += cardWidth + padding;
        }

        
        
        if ([cardsCollection count] % 3 == 0) {
            leftPadding = padding;
            topPadding += cardHeight + padding;
        }
        
    }
    
}

- (IBAction)paddingButton:(id)sender {
    
    
    if (self.paddingToggle == 20) {
        self.paddingToggle = 30;
        [self padding];
    } else if (self.paddingToggle == 30) {
        self.paddingToggle = 20;
        [self padding];
    }
    
    
}
@end
