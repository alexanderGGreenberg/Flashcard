//
//  questionCard.h
//  CalcFlashDemo
//
//  Created by Alex Greenberg on 12/20/14.
//  Copyright (c) 2014 MakerMason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "buttonCard.h"
@interface questionCard : NSObject


@property ( nonatomic) NSUInteger *answer; //1-4 (for the buttuns)

@property (strong, nonatomic) NSString *picture; //holds the name of da pic

@property (nonatomic) NSString *category;

@property (strong, nonatomic) NSMutableArray *answers;//of buttonCards

@property (strong, nonatomic) NSString *message;

@end



