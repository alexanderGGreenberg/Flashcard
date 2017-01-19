//
//  questionDeck.m
//  CalcFlashDemo
//
//  Created by Alex Greenberg on 12/21/14.
//  Copyright (c) 2014 MakerMason. All rights reserved.
//

#import "questionDeck.h"

@interface questionDeck()
//@property (strong, nonatomic) NSMutableArray *questions; //array of questionCard objects
@property (strong, nonatomic) questionCard *card01;
@property (strong, nonatomic) questionCard *card02;
@property (strong, nonatomic) questionCard *card03;
@property (strong, nonatomic) questionCard *card04;
@property (strong, nonatomic) questionCard *card05;
@property (strong, nonatomic) questionCard *card06;
@property (strong, nonatomic) questionCard *card07;
@property (strong, nonatomic) questionCard *card08;
@property (strong, nonatomic) questionCard *card09;
@property (strong, nonatomic) questionCard *card10;

@end

@implementation questionDeck

+(void) addOne
{
    testyTest++;
}
//if this works I'm a genious, if not, then so much for this project
- (questionCard*) card01
{
    if(!_card01) _card01 = [self createCard];
    return _card01 = [self createCard];
}

- (questionCard*) card02
{
    if(!_card02) _card02 = [self createCard];
    return _card01 = [self createCard];
}
/*
- (questionCard*) card03
{
    if(!_card03) _card03 = [self createCard];
    return _card03 = [self createCard];
}
*/

//this probobly doesn't work
-(questionCard *) createCard
{
    return [[questionCard alloc]init];
}



- (void) addQuestion:(questionCard *)questionCard{

    [_questions addObject:questionCard];
    
}
- (NSMutableArray*) genTrigAnswers:(int) nextToX:(int)addedToX :(int) inFront :(NSString*) trigOrig
{
    
    NSMutableArray *options;
    options = [[NSMutableArray alloc] init];
    NSString *trigChange;
    if([trigOrig isEqualToString:@"sin"])
    {
        trigChange = @"cosin";
        options[0] = [NSString stringWithFormat:@"%d" @"%@" @"(" @"%d" @"x" @" + " @"%d" @")", (inFront * nextToX), trigChange, nextToX, addedToX];
        options [1] = [NSString stringWithFormat:@"%d" @"%@" @"(" @"%d" @"x" @" + " @"%d" @")", (inFront * nextToX * -1), trigChange, nextToX, addedToX];
        options[2] = [NSString stringWithFormat:@"%d" @"%@" @"(" @"%d" @"x" @" + " @"%d" @")", (inFront * nextToX * -1), trigOrig, nextToX, addedToX];
        options[3] = [NSString stringWithFormat:@"%d" @"%@" @"(" @"%d" @"x" @" + " @"%d" @")", (inFront), trigOrig, nextToX, addedToX];
    }
    if([trigOrig isEqualToString:@"cosin"])
    {
        trigChange = @"sin";
        options[0] = [NSString stringWithFormat:@"%d" @"%@" @"(" @"%d" @"x" @" + " @"%d" @")", (inFront * nextToX * -1), trigChange, nextToX, addedToX];
        options[1] = [NSString stringWithFormat:@"%d" @"%@" @"(" @"%d" @"x" @" + " @"%d" @")", (inFront * nextToX * addedToX), trigChange, nextToX, addedToX];
        options[2] = [NSString stringWithFormat:@"%d" @"%@" @"(" @"%d" @"x" @" + " @"%d" @")", (inFront * nextToX), trigChange, nextToX, addedToX];
        options[3] = [NSString stringWithFormat:@"%d" @"%@" @"(" @"%d" @"x" @" + " @"%d" @")", (inFront * nextToX * -1), trigOrig, nextToX, addedToX];

        
    }
    if ([trigOrig isEqualToString:@"tan"])
    {
        trigChange = @"sec^2";
        options[0] =  options[0] = [NSString stringWithFormat:@"%d" @"%@" @"(" @"%d" @"x" @" + " @"%d" @")", (inFront * nextToX), trigChange, nextToX, addedToX];
        options[1] = [NSString stringWithFormat:@"%d" @"%@" @"(" @"%d" @"x" @" + " @"%d" @")", (inFront * nextToX * -1), trigChange, nextToX, addedToX];
         options[2] = [NSString stringWithFormat:@"%d" @"%@" @"(" @"%d" @"x" @" + " @"%d" @")", (inFront * nextToX * -1), @"sec", nextToX, addedToX];
         options[3] = [NSString stringWithFormat:@"%d" @"%@" @"(" @"%d" @"x" @" + " @"%d" @")", (addedToX * nextToX), trigChange, nextToX, addedToX];
        
    }
    if([trigOrig isEqualToString:@"cotan"])
    {
        
        trigChange = @"csc^2";
        options[0] =  options[0] = [NSString stringWithFormat:@"%d" @"%@" @"(" @"%d" @"x" @" + " @"%d" @")", (inFront * nextToX *-1), trigChange, nextToX, addedToX];
        options[1] = [NSString stringWithFormat:@"%d" @"%@" @"(" @"%d" @"x" @" + " @"%d" @")", (inFront * nextToX), @"sec", nextToX, addedToX];
        options[2] = [NSString stringWithFormat:@"%d" @"%@" @"(" @"%d" @"x" @" + " @"%d" @")", (inFront * nextToX * -1), @"csc", nextToX, addedToX];
        options[3] = [NSString stringWithFormat:@"%d" @"%@" @"(" @"%d" @"x" @" + " @"%d" @")", (addedToX * nextToX), trigChange, nextToX, addedToX];
    }
    if([trigOrig isEqualToString:@"sec"])
    {
        //note the secxtanx ha "sex tanks"
        trigChange = @"tan";
        NSString *interior;
        interior = [NSString stringWithFormat:@"(" @"%d" @"x" @" + " @"%d" @")", nextToX, addedToX ];
        options[0] = [NSString stringWithFormat:@"%d" @"%@" @"%@" @"%@" @"%@" , (nextToX * inFront),trigOrig, interior, trigChange, interior ];
        options[1] = [NSString stringWithFormat:@"%d" @"%@" @"%@", (nextToX * inFront),trigOrig, interior];
        options[2] = [NSString stringWithFormat:@"%d" @"%@" @"%@", (nextToX * inFront),trigChange, interior];
        options[3] = [NSString stringWithFormat:@"%d" @"%@"  @"%@" @"%d" @"%@" @"%@" , (nextToX * inFront),trigOrig, interior, (nextToX * inFront),trigChange, interior ];
        
    }
        if([trigOrig isEqualToString:@"csc"])
    {
        trigChange = @"cot";
        NSString *interior;
        interior = [NSString stringWithFormat:@"(" @"%d" @"x" @" + " @"%d" @")", nextToX, addedToX ];
        options[0] = [NSString stringWithFormat:@"%d" @"%@" @"%@" @"%@" @"%@" , (nextToX * inFront * -1),trigOrig, interior, trigChange, interior ];
        options[1] = [NSString stringWithFormat:@"%d" @"%@" @"%@", (nextToX * inFront),trigOrig, interior];
        options[2] = [NSString stringWithFormat:@"%d" @"%@" @"%@", (nextToX * inFront),trigChange, interior];
        options[3] = [NSString stringWithFormat:@"%d" @"%@"  @"%@" @"%d" @"%@" @"%@" , (nextToX * inFront * -1),trigOrig, interior, (nextToX * inFront),trigChange, interior ];
        
    }


    
    return options;
    
    
}
-(NSMutableArray*)genAccelerationAnswers:(int) coFirstX :(int) coSecondX :(int) firstX :(int) secondX
{
    NSMutableArray *options;
    options = [[NSMutableArray alloc]init];
    int firstXDec = firstX;
    if(secondX == 2)
    {
        options[0] = [NSString stringWithFormat:@"%d" @"x - " @"%d", coFirstX * firstX * (firstX -1),coSecondX * secondX ];
        options[1] = [NSString stringWithFormat:@"%d" @"x^" @"%d" @" - " @"%d", coFirstX * firstX, firstX-1, secondX * coSecondX];
        options[2] = [NSString stringWithFormat:@"%d" @"x - " @"%d", coFirstX * firstX * (firstX),coSecondX * secondX ];
        options[3] = [NSString stringWithFormat:@"%d" @"x^" @"%d" @" - " @"%d", coFirstX * firstX, firstX, secondX * coSecondX];
           }
    if(secondX ==1)
    {
        options[0] = [NSString stringWithFormat:@"%d", coFirstX * firstX * (firstX-1)];
        options[1] = [NSString stringWithFormat:@"%d" @"x^" @"%d" @" - " @"%d", coFirstX * firstX, firstX -1, coSecondX * secondX];
        options[2] = [NSString stringWithFormat:@"%d", coFirstX * firstX * (firstX)];
        options[3] = [NSString stringWithFormat:@"%d" @"-x", coFirstX * firstX * (firstX-1)];

    }
    return options;
}

- (void) initializeDeck
{
    

    _questions = [[NSMutableArray alloc] init];
    _card01 = [[questionCard alloc]init];
    _card02 = [[questionCard alloc]init];
    _card03 = [[questionCard alloc]init];
    _card04 = [[questionCard alloc]init];
    _card05 = [[questionCard alloc] init];
    _card06 = [[questionCard alloc] init];
    _card07 = [[questionCard alloc] init];
    _card08 = [[questionCard alloc] init];
    _card09 = [[questionCard alloc] init];
    _card10 = [[questionCard alloc] init];
    
    _card01.answers = [[NSMutableArray alloc] init];
    _card02.answers = [[NSMutableArray alloc] init];
    _card03.answers = [[NSMutableArray alloc] init];
    _card04.answers = [[NSMutableArray alloc] init];
    _card05.answers = [[NSMutableArray alloc] init];
    _card06.answers = [[NSMutableArray alloc] init];
    _card07.answers = [[NSMutableArray alloc] init];
    _card08.answers = [[NSMutableArray alloc] init];
    _card09.answers = [[NSMutableArray alloc] init];
    _card10.answers = [[NSMutableArray alloc] init];

    
    
    [_card01 setAnswer:1];
    [_card02 setAnswer:2];
    [_card03 setAnswer:3];
    [_card04 setAnswer:4];
    [_card05 setAnswer:1];
    [_card06 setAnswer:2];
    [_card07 setAnswer:3];
    [_card08 setAnswer:4];
    [_card09 setAnswer:1];
    [_card10 setAnswer:2];
    
    [_card01 setCategory:@"ExponentOne"];
    [_card02 setCategory:@"chainOneTrig"];
    [_card03 setCategory:@"acceleration"];
    [_card04 setCategory:@"nonDiff"];
    [_card05 setCategory:@"velocity"];
    [_card06 setCategory:@"position"];
    [_card07 setCategory:@"ChangeDirection"];
    [_card08 setCategory:@"HorizontalTangent"];
    [_card09 setCategory:@"chainOneTrig"];
    [_card10 setCategory:@"nonDiff"];
    
    ////////////////////////////////////////////////////////////////
    int rand01 = (arc4random()%10)+1;
    int rand02 = (arc4random()%10) +1;
    NSString *exponentOneQuestion = [NSString stringWithFormat:@"Find the derivative of: " @"%d" @"x^(" @"%d" @")", rand01, rand02];
    _card01.picture = exponentOneQuestion;
    NSString *exponentOneAnswer = [NSString stringWithFormat:@"%d"@"x^(" @"%d" @")",rand01 * rand02, rand02 -1];
    NSString *exponentOneWrong1 = [NSString stringWithFormat:@"%d"@"x^(" @"%d" @")",rand01 * rand02, rand02];
     NSString *exponentOneWrong2 = [NSString stringWithFormat:@"%d"@"x^(" @"%d" @")",rand01+1 * rand02, rand02-1];
    NSString *exponentOneWrong3 = [NSString stringWithFormat:@"%d"@"x^(" @"%d" @")",rand01 * rand02-1, rand02];
    [_card01.answers addObject:exponentOneAnswer];
    [_card01.answers addObject:exponentOneWrong1];
    [_card01.answers addObject:exponentOneWrong2];
    [_card01.answers addObject:exponentOneWrong3];
    
    /////////////////////////////////////////////////////////////////
    
    NSMutableArray *trigOptions;//array of sine, cosine, tan etc
    
    trigOptions = [[NSMutableArray alloc] init];
    
    trigOptions[0] = @"csc";
    trigOptions[1] = @"sec";
    trigOptions[2] = @"sin";
    trigOptions[3] = @"cosin";
    trigOptions[4] = @"tan";
    trigOptions[5] = @"cotan";
    int nextToX = (arc4random()%10) + 1;
    int addedToX = (arc4random()%10) + 1;
    NSString *trigOrig = trigOptions[arc4random()%6];
    int inFront = (arc4random() %9) +2;
     
    NSString *chainOneTrigAnswer = [NSString stringWithFormat:@"Find the derivative of " @"%d" @"%@" @"(" @"%d" @"x" @" + " @"%d" @")" , inFront, trigOrig, nextToX, addedToX];
    _card02.picture  = chainOneTrigAnswer;
    
    NSMutableArray *answers = [self genTrigAnswers:nextToX :addedToX :inFront :trigOrig];
    
    [_card02.answers addObject: answers[1]];
    [_card02.answers addObject:answers[0]];
    [_card02.answers addObject:answers[2]];
    [_card02.answers addObject:answers[3]];


    /////////////////////////////////////////////////////////////////
    
    int phrasing = arc4random()%2;
    int coFirstX = (arc4random()%4) + 2;
    int coSecondX = (arc4random()%4) + 2;
    int firstX = (arc4random()%2)+2;
    int secondX = firstX - 1;

    if(phrasing == 1)
    {
        _card03.picture = [NSString stringWithFormat:@"A particle moves on the x axis \n so at any time its position is modeled by\n" @"%d" @"x^" @"%d" @" -  " @"%d"  @"x^" @"%d" @"\n what is this particle's acceleration?",coFirstX, firstX, coSecondX, secondX ];
    }
    if(phrasing == 0)
    {
        _card03.picture = [NSString stringWithFormat:@"A particle moves on the x axis \n so at any time its position is modeled by\n" @"%d" @"x^" @"%d" @" - " @"%d" @"x^" @"%d" @"\n what is this particle's change in velocity?",coFirstX, firstX, coSecondX, secondX ];
    }
    NSMutableArray *accAnswers = [self genAccelerationAnswers:coFirstX :coSecondX :firstX :secondX];
    
    [_card03.answers addObject:accAnswers[1]];
    [_card03.answers addObject:accAnswers[2]];
    [_card03.answers addObject:accAnswers[0]];
    [_card03.answers addObject:accAnswers[3]];
    
    /*
    int rand1 = arc4random()%11;
    int rand2 = arc4random()%11;
    int result1 = rand1 + rand2;
    _card01.picture = [NSString stringWithFormat:@"%d" @" + " "%d", rand1, rand2];
    [_card01.answers addObject:[NSNumber numberWithInt:result1]];
    [_card01.answers addObject:[NSNumber numberWithInt:result1 + 1]];
    [_card01.answers addObject:[NSNumber numberWithInt:result1 -1]];
    [_card01.answers addObject:[NSNumber numberWithInt:(result1 + 3)]];
    /////////////////////////////////////////////////////////////////
     */
    
    //this may be wrong, really wrong
    int nonDiffCo = (arc4random()%11) + 1;
    int nonDiffSub = (arc4random()%11) + 1;
    int nonDiffPower = (arc4random()%4) + 1;
    _card04.picture = [NSString stringWithFormat:@"At which value of x is this function non-differentiable? \n (" @"%d" @"x -" @"%d" @")^" @"%d", nonDiffCo, nonDiffSub, nonDiffPower * -1];
    NSString *nonDiffAnswer = [NSString stringWithFormat:@"%d" @"/" @"%d" ,nonDiffSub,nonDiffCo];
    NSString *nonDiffWrong1 = [NSString stringWithFormat:@"%d" @"/" @"%d" ,nonDiffSub * -1,nonDiffCo];
    [_card04.answers addObject: nonDiffWrong1];
    [_card04.answers addObject:@"No value of x"];
    [_card04.answers addObject:@"0"];
    [_card04.answers addObject:nonDiffAnswer];


    /*
    int rand3 = arc4random()%11;
    int rand4 = arc4random()%11;
    int result2 = rand3 + rand4;
    _card02.picture = [NSString stringWithFormat:@"%d" @" + " "%d", rand3, rand4];
    [_card02.answers addObject:[NSNumber numberWithInt:result2 + 1]];
    [_card02.answers addObject:[NSNumber numberWithInt:result2]];
    [_card02.answers addObject:[NSNumber numberWithInt:result2 -4]];
    [_card02.answers addObject:[NSNumber numberWithInt:(result2 -2)]];
    /////////////////////////////////////////////////////////////////
    int rand5 = arc4random()%11;
    int rand6 = arc4random()%11;
    int result3 = rand5 + rand6;
    _card03.picture = [NSString stringWithFormat:@"%d" @" + " "%d", rand5, rand6];
    [_card03.answers addObject:[NSNumber numberWithInt:result3 - 1]];
    [_card03.answers addObject:[NSNumber numberWithInt:result3 +3]];
    [_card03.answers addObject:[NSNumber numberWithInt:result3]];
    [_card03.answers addObject:[NSNumber numberWithInt:(result3 + +1)]];
    /////////////////////////////////////////////////////////////////
    int rand7 = arc4random()%11;
    int rand8 = arc4random()%11;
    int result4 = rand7 - rand8;
    _card04.picture = [NSString stringWithFormat:@"%d" @" - " "%d", rand7, rand8];
    [_card04.answers addObject:[NSNumber numberWithInt:(result4 +1)]];
    [_card04.answers addObject:[NSNumber numberWithInt:(result4 + 2)]];
    [_card04.answers addObject:[NSNumber numberWithInt:(result4) +4]];
    [_card04.answers addObject:[NSNumber numberWithInt:(result4)]];

    /////////////////////////////////////////////////////////////////
     */
    
    //**this proddocues identtical answers, too lazy to fix it now*******//
    //problem has been fixed a bit. May still produce identicals
    int coeVol = arc4random()%4 + 1;
    int exponVol = arc4random()%3 + 2;
    int xPositionVol = arc4random()%2 + 2;
    _card05.picture = [NSString stringWithFormat:@"A particle moves on the x axis \n so at any time its position is modeled by\n" @"%d" @"x^" @"%d" @"\n what is the velocity at the value of x: " @"%d", coeVol, exponVol, xPositionVol];
    int volAnswer = (coeVol * exponVol * pow(xPositionVol, (exponVol-1)) );
    [_card05.answers addObject:[NSString stringWithFormat:@"%d", volAnswer]];
    [_card05.answers addObject:[NSString stringWithFormat: @"%d" @"x^" @"%d", coeVol * exponVol,exponVol-1]];
    [_card05.answers addObject: [NSString stringWithFormat:@"%0.f",coeVol * pow(xPositionVol, exponVol-1)]];
    [_card05.answers addObject:[NSString stringWithFormat:@"%0.f", coeVol * exponVol * pow(xPositionVol, (exponVol))]];
    
    
/*
 */
    //**this proddocues identtical answers, too lazy to fix it now*******//
    int coePos = arc4random()%4 + 1;
    int exponPos = arc4random()%3 + 1;
    int xPositionPos = arc4random()%2 + 3;
    _card06.picture = [NSString stringWithFormat:@"A particle moves on the x axis \n so at any time its position is modeled by\n" @"%d" @"x^" @"%d" @"\n what is the position at the value of x: " @"%d", coePos, exponPos, xPositionPos];
    if(coePos * exponPos * pow(xPositionPos, (exponPos-1)) !=coePos * pow(xPositionPos, exponPos))
    {
        [_card06.answers addObject: [NSString stringWithFormat:@"%.0f",(coePos * exponPos * pow(xPositionPos, (exponPos-1)) )]];
        [_card06.answers addObject: [NSString stringWithFormat:@"%.0f",coePos * pow(xPositionPos, exponPos)]];
    }
    else
    {
        [_card06.answers addObject: [NSString stringWithFormat:@"%.0f",(coePos * exponPos * pow(xPositionPos, (exponPos)) )]];
        [_card06.answers addObject: [NSString stringWithFormat:@"%.0f",coePos * pow(xPositionPos, exponPos)]];
    }
    
    [_card06.answers addObject:[NSString stringWithFormat: @"%d" @"x^" @"%d", coePos * exponPos,exponPos-1]];
    [_card06.answers addObject:[NSString stringWithFormat:@"%.0f", coePos * exponPos * (exponPos-1) * pow(xPositionPos, (exponPos-2))]];
    
    int perfSquareOrig = arc4random()%5 + +3;
    int perfSquareSquared = pow(perfSquareOrig,2);
    NSString *changeDirQuestion = [NSString stringWithFormat:@"t^2 - " @"%d", perfSquareSquared];
    _card07.picture = [NSString stringWithFormat:@"A particle moves on the x axis \n so at any time its velocity is modeled by\n" @"%@" @"\nWhere does the particle change direction?", changeDirQuestion];
    [_card07.answers addObject:[NSString stringWithFormat: @"%d",perfSquareOrig ]];
    [_card07.answers addObject:[NSString stringWithFormat: @"%d",perfSquareOrig * -1 ]];
    [_card07.answers addObject:[NSString stringWithFormat:@"%d" @" and " @"%d",perfSquareOrig, perfSquareOrig * -1 ]];
    [_card07.answers addObject:[NSString stringWithFormat: @"%d" @" and" @"%d",perfSquareSquared, perfSquareSquared * -1 ]];
 /////////////////////////////////////////////////////////////////////
    
    int perfSquareOrig2 = arc4random()%5 + 3;
    int perfSquareSquared2 = pow(perfSquareOrig2,2);
    NSString *changeDirQuestion2 = [NSString stringWithFormat:@"x^2 - " @"%d", perfSquareSquared2];
    _card08.picture = [NSString stringWithFormat:@"A function's differentiation is defined by:\n" @"%@" @"\nWhere are there horixontal tangent(s) in the original fucntion", changeDirQuestion2];
    [_card08.answers addObject:[NSString stringWithFormat:@"%d",perfSquareOrig2 ]];
    [_card08.answers addObject:[NSString stringWithFormat: @"%d",perfSquareOrig2 * -1 ]];
    [_card08.answers addObject:[NSString stringWithFormat: @"%d" @" and " @"%d",perfSquareSquared2, perfSquareSquared2 * -1 ]];
    [_card08.answers addObject:[NSString stringWithFormat: @"%d" @" and " @"%d",perfSquareOrig2, perfSquareOrig2 * -1 ]];
/////////////////////////////////////////////////////////////////////
    NSMutableArray *trigOptions2;//array of sine, cosine, tan etc
    
    trigOptions2 = [[NSMutableArray alloc] init];
    
    trigOptions2[0] = @"csc";
    trigOptions2[1] = @"sec";
    trigOptions2[2] = @"sin";
    trigOptions2[3] = @"cosin";
    trigOptions2[4] = @"tan";
    trigOptions2[5] = @"cotan";
    int nextToX2 = (arc4random()%10) + 1;
    int addedToX2 = (arc4random()%10) + 1;
    NSString *trigOrig2 = trigOptions2[arc4random()%6];
    int inFront2 = (arc4random() %9) +2;
    
    NSString *chainOneTrigAnswer2 = [NSString stringWithFormat:@"Find the derivative of " @"%d" @"%@" @"(" @"%d" @"x" @" + " @"%d" @")" , inFront2, trigOrig2, nextToX2, addedToX2];
    _card09.picture  = chainOneTrigAnswer2;
    
    NSMutableArray *answers2 = [self genTrigAnswers:nextToX2 :addedToX2 :inFront2 :trigOrig2];
    
    [_card09.answers addObject: answers2[0]];
    [_card09.answers addObject:answers2[3]];
    [_card09.answers addObject:answers2[2]];
    [_card09.answers addObject:answers2[1]];
////////////////////////////////////////////////////////////////////
    int nonDiffCo2 = (arc4random()%11) + 1;
    int nonDiffSub2 = (arc4random()%11) + 1;
    int nonDiffPower2 = (arc4random()%4) + 1;
    _card10.picture = [NSString stringWithFormat:@"At which value of x is this function non-differentiable? \n (" @"%d" @"x -" @"%d" @")^" @"%d", nonDiffCo2, nonDiffSub2, nonDiffPower2 * -1];
    NSString *nonDiffAnswer2 = [NSString stringWithFormat:@"%d" @"/" @"%d" ,nonDiffSub2,nonDiffCo2];
    NSString *nonDiffWrong1_2 = [NSString stringWithFormat:@"%d" @"/" @"%d" ,nonDiffSub2 * -1,nonDiffCo2];
    [_card10.answers addObject:@"No value of x"];
    [_card10.answers addObject:nonDiffAnswer2];
    [_card10.answers addObject: nonDiffWrong1_2];
    [_card10.answers addObject:@"All values of x"];
    
 /*
    
    int rand9 = arc4random()%11;
    int rand10 = arc4random()%11;
    int result5 = rand9 - rand10;
    _card05.picture = [NSString stringWithFormat:@"%d" @" - " "%d", rand9, rand10];
    [_card05.answers addObject:[NSNumber numberWithInt:(result5)]];
    [_card05.answers addObject:[NSNumber numberWithInt:(result5 +2)]];
    [_card05.answers addObject:[NSNumber numberWithInt:(result5) -4]];
    [_card05.answers addObject:[NSNumber numberWithInt:(result5 + 1)]];

    /////////////////////////////////////////////////////////////////
    
    int rand11 = arc4random()%11;
    int rand12 = arc4random()%11;
    int result6 = rand11 + rand12;
    _card06.picture = [NSString stringWithFormat:@"%d" @" + " "%d", rand11, rand12];
    [_card06.answers addObject:[NSNumber numberWithInt:(result6)-2]];
    [_card06.answers addObject:[NSNumber numberWithInt:(result6 +2)]];
    [_card06.answers addObject:[NSNumber numberWithInt:(result6) +1]];
    [_card06.answers addObject:[NSNumber numberWithInt:(result6)]];
    /////////////////////////////////////////////////////////////////
    
    int rand13 = arc4random()%11;
    int rand14 = arc4random()%11;
    int result7 = rand13 - rand14;
    _card07.picture = [NSString stringWithFormat:@"%d" @" - " "%d", rand13, rand14];
    [_card07.answers addObject:[NSNumber numberWithInt:(result7 +1)]];
    [_card07.answers addObject:[NSNumber numberWithInt:(result7 + 2)]];
    [_card07.answers addObject:[NSNumber numberWithInt:(result7)]];
    [_card07.answers addObject:[NSNumber numberWithInt:(result7)-3]];
    ////////////////////////////////////////////////////////////////
    int rand15 = arc4random()%11;
    int rand16 = arc4random()%11;
    int result8 = rand15 - rand16;
    _card08.picture = [NSString stringWithFormat:@"%d" @" - " "%d", rand15, rand16];
    [_card08.answers addObject:[NSNumber numberWithInt:(result8 + 1 )]];
    [_card08.answers addObject:[NSNumber numberWithInt:(result8)]];
    [_card08.answers addObject:[NSNumber numberWithInt:(result8) - 3]];
    [_card08.answers addObject:[NSNumber numberWithInt:(result8 + 3)]];
    ////////////////////////////////////////////////////////////////
    int rand17 = arc4random()%11;
    int rand18 = arc4random()%11;
    int result9 = rand17  + rand18;
    _card09.picture = [NSString stringWithFormat:@"%d" @" + " "%d", rand17, rand18];
    [_card09.answers addObject:[NSNumber numberWithInt:(result9 + 1 )]];
    [_card09.answers addObject:[NSNumber numberWithInt:(result9) +2]];
    [_card09.answers addObject:[NSNumber numberWithInt:(result9)]];
    [_card09.answers addObject:[NSNumber numberWithInt:(result9 + 3)]];
    ////////////////////////////////////////////////////////////////
    int rand19 = arc4random()%11;
    int rand20 = arc4random()%11;
    int result10 = rand19  + rand20;
    _card10.picture = [NSString stringWithFormat:@"%d" @" + " "%d", rand19, rand20];
    [_card10.answers addObject:[NSNumber numberWithInt:(result10 + 2 )]];
    [_card10.answers addObject:[NSNumber numberWithInt:(result10) +5]];
    [_card10.answers addObject:[NSNumber numberWithInt:(result10) -1]];
    [_card10.answers addObject:[NSNumber numberWithInt:(result10)]];

    ///////////////////////////////////////////////////////////////
    */
    [_card01 setMessage:@"Great Job!"];
    [_card02 setMessage:@"You rock!"];
    [_card03 setMessage:@"Simply brilliant"];
    [_card04 setMessage:@"Keep at it"];
    [_card05 setMessage:@"Correct!"];
    [_card06 setMessage:@"Well done!"];
    [_card07 setMessage:@"Perfect"];
    [_card07 setMessage:@"That's right!  Look out, math genius coming through!"];
    [_card08 setMessage:@"Super job, keep going!"];
    [_card09 setMessage:@"Hooray!"];
    [_card10 setMessage:@"You're doing great!"];
    
    
    [self addQuestion:_card01];
    [self addQuestion:_card02];
    [self addQuestion:_card03];
    [self addQuestion:_card04];
    [self addQuestion:_card05];
    [self addQuestion:_card06];
    [self addQuestion:_card07];
    [self addQuestion:_card08];
    [self addQuestion:_card09];
    [self addQuestion:_card10];


}

 - (NSMutableArray *)questions
 {
 if (!_questions) _questions = [NSMutableArray array];
 return _questions;
 }


 -(questionCard *)drawRandomCard
 {
     
 questionCard *randomQuestionCard;
 
 if ([self.questions count]) {
 NSUInteger index = arc4random() % self.questions.count;
 randomQuestionCard = self.questions[index];
 [self.questions removeObjectAtIndex:index];
     
 
 }
     
      
 
 return randomQuestionCard;
      
      
     
     
 }



@end

