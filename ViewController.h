//
//  ViewController.h
//  CalcFlashDemo
//
//  Created by Alex Greenberg on 12/20/14.
//  Copyright (c) 2014 MakerMason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "questionCard.h"
#import "questionDeck.h"

@interface ViewController : UIViewController
@property(strong, nonatomic) questionDeck* deck;
@property(nonatomic) int tierup;
@end

