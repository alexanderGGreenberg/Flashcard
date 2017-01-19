//
//  questionDeck.h
//  CalcFlashDemo
//
//  Created by Alex Greenberg on 12/21/14.
//  Copyright (c) 2014 MakerMason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "questionCard.h"

static NSInteger testyTest;

@interface questionDeck : NSObject

- (void) addQuestion: (questionCard*) questionCard; //(* questionCard);

- (questionCard *) drawRandomCard;

- (void) initializeDeck;

@property (strong, nonatomic) NSMutableArray *questions; //array of questionCard objects
@property (nonatomic) NSInteger *additionMax;
@property (nonatomic) int *addition;
@property (nonatomic) NSInteger *subtractionMax;
@property (nonatomic) NSInteger *subtraction;
@end

