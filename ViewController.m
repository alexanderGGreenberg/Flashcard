//
//  ViewController.m
//  CalcFlashDemo
//
//  Created by Alex Greenberg on 12/20/14.
//  Copyright (c) 2014 MakerMason. All rights reserved.
//

#import "ViewController.h"
//#import "questionCard.h"
//#import "questionDeck.h"
@interface ViewController ()
//@property(strong, nonatomic) questionDeck* deck;
@property (strong, nonatomic) questionCard* card;
@property (weak, nonatomic) IBOutlet UILabel *labelText;
@property (nonatomic) int addition;
@property (nonatomic) int subtraction;
@property (nonatomic) int additionMax;
@property (nonatomic) int maximum;
@property (nonatomic) int current;
@property (nonatomic) int lastPercent;
@property (nonatomic) int currentPercent;
@property (nonatomic) BOOL firstTime;
@property (weak, nonatomic) IBOutlet UILabel *scoreCurrent;
@property (weak, nonatomic) IBOutlet UILabel *scoreTotal;
- (IBAction)beginButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *startGameButton;
- (IBAction)button1:(id)sender;
- (IBAction)button2:(id)sender;
- (IBAction)button3:(id)sender;
- (IBAction)button4:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *button1Text;
@property (weak, nonatomic) IBOutlet UIButton *button2Text;
@property (weak, nonatomic) IBOutlet UIButton *button3Text;
@property (weak, nonatomic) IBOutlet UIButton *button4Text;
@property (weak, nonatomic) IBOutlet UIButton *resultsButtonText;
@property (weak, nonatomic) IBOutlet UIButton *MODButtonText;


@end

@implementation ViewController


-(questionCard*) createCard
{
    return [[questionCard alloc] init];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _button1Text.enabled = NO;
    _button2Text.enabled = NO;
    _button3Text.enabled = NO;
    _button4Text.enabled = NO;
    _resultsButtonText.enabled = NO;
    _labelText.layer.borderColor = [UIColor grayColor].CGColor;
    _labelText.layer.borderWidth = 1.0;
    
    
    _labelText.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"rsz_rsz_flashcard"]];
     

    

    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)beginButton:(id)sender {
   
    _button1Text.layer.borderColor = [UIColor grayColor].CGColor;
    _button1Text.layer.borderWidth = 1.0;
    _button2Text.layer.borderColor = [UIColor grayColor].CGColor;
    _button2Text.layer.borderWidth = 1.0;
    _button3Text.layer.borderColor = [UIColor grayColor].CGColor;
    _button3Text.layer.borderWidth = 1.0;
    _button4Text.layer.borderColor = [UIColor grayColor].CGColor;
    _button4Text.layer.borderWidth = 1.0;

    [sender setTitle:@" " forState:UIControlStateNormal];
    _deck = [[questionDeck alloc]init];
    _card = [[questionCard alloc]init];
    [_deck initializeDeck];
    _card = [_deck drawRandomCard];
    
    //_labelText.text = [NSString stringWithFormat:@"%@"@" =", _card.picture];
    
    _firstTime = YES;
    [self upDateUI];
    
    _button1Text.enabled = YES;
    _button2Text.enabled = YES;
    _button3Text.enabled = YES;
    _button4Text.enabled = YES;
    _current = 0;
    _maximum = 0;
    self.scoreCurrent.text =[NSString stringWithFormat:@"%d",(_current)];
    
    self.scoreTotal.text = [NSString stringWithFormat:@"%d",(_maximum)];
    self.MODButtonText.enabled = NO;
    self.MODButtonText.hidden = YES;
    
}

-(void) upDateUI
{
    if(_maximum == 11)
    {
        _maximum--;//not good, should fix this
    }

    self.scoreCurrent.text = [NSString stringWithFormat:@"%d",(_current)];
    
    self.scoreTotal.text = [NSString stringWithFormat:@"%d",(_maximum)];
    
    
    if(_card.picture)
    {
       
    _labelText.text = _card.picture;
    [_button1Text setTitle:[NSString stringWithFormat:@"%@"@" ", _card.answers[0]] forState:UIControlStateNormal];
        
    [_button2Text setTitle:[NSString stringWithFormat:@"%@"@" ", _card.answers[1]] forState:UIControlStateNormal];
    [_button3Text setTitle:[NSString stringWithFormat:@"%@"@" ", _card.answers[2]] forState:UIControlStateNormal];
    [_button4Text setTitle:[NSString stringWithFormat:@"%@"@" ", _card.answers[3]] forState:UIControlStateNormal];
        
           }
    
        else
        {
            _button1Text.layer.borderWidth = 0;
            _button2Text.layer.borderWidth = 0;
            _button3Text.layer.borderWidth = 0;
            _button4Text.layer.borderWidth = 0;

            
            _labelText.text = @"";
            [_button1Text setTitle:@" "forState:UIControlStateNormal];
            [_button2Text setTitle:@" "forState:UIControlStateNormal];
            [_button3Text setTitle:@" "forState:UIControlStateNormal];
            [_button4Text setTitle:@" "forState:UIControlStateNormal];
            _button1Text.enabled = NO;
            _button2Text.enabled = NO;
            _button3Text.enabled = NO;
            _button4Text.enabled = NO;
            _startGameButton.enabled = YES;
            [_startGameButton setTitle:@"New Round?" forState:UIControlStateNormal];
            _resultsButtonText.enabled = YES;
            NSString *calcRank;
            if(_current <= 6)
                calcRank = @"You are a: Calculus Peasant";
            if(_current == 7)
            {
                calcRank = @"You are a: Calculus Lord";
            }
            if(_current ==8)
                calcRank = @"You are a: Calculus King";
            if(_current ==9)
                calcRank = @"You are a: Calculus God";
            if(_current ==10)
                calcRank = @"You are Newton himself";
            
            
            _currentPercent = ((_current * 100)/_maximum);
            
            NSString *percentMessage = @"";
            
            if(_lastPercent >0)
            {
                if(_lastPercent < _currentPercent && _lastPercent != 1)
                {
                    percentMessage = [NSString stringWithFormat:@"\rYou went up %d %@", (_currentPercent - _lastPercent), @"%"];
                }
                else if(_lastPercent > _currentPercent)
                {
                    percentMessage = [NSString stringWithFormat:@"\rYou went down %d %@", ((_currentPercent - _lastPercent) * -1), @"%"];

                }
                else if(_lastPercent ==1 && _currentPercent == 1)
                {
                    percentMessage =@"Perfect Again!";
                }
                else
                {
                    percentMessage =@"You scorred that same as last time";

                }
                NSLog(@"last percent: %i", _lastPercent);
                NSLog(@"current percent percent: %i", _currentPercent);

                
            }
            _lastPercent = _currentPercent;
           

            UIAlertView *alertView2 = [[[UIAlertView alloc] init]
                                      initWithTitle:@"Your Calculus Rank"
                                      message:[NSString stringWithFormat:@"%@ %@",calcRank, percentMessage]
                                      delegate:nil
                                      cancelButtonTitle:@"Continue"
                                      otherButtonTitles:nil];
            
                [alertView2 show];
            self.MODButtonText.enabled = YES;
            self.MODButtonText.hidden = NO;

            
        }
    
}

- (IBAction)button1:(id)sender {
    if(_card.answer == 1)
    {
        if(_maximum <9)
        {

        UIAlertView *alertView = [[[UIAlertView alloc] init]
                                  initWithTitle:@"Correct!"
                                  message:[NSString stringWithFormat:@"%@",_card.message]
                                  delegate:nil
                                  cancelButtonTitle:@"Next Question"
         
                                  otherButtonTitles:nil];
        
            [alertView show];
        }
        else
        {
            _maximum++;
        }
        //}
        if([_card.category isEqualToString:@"ExponentOne"])
        {
            if(_firstTime == YES)
            {
                _current++;
                
            }
            _maximum++;

        }
        if([_card.category isEqualToString:@"chainOneTrig"])
        {
            if(_firstTime == YES)
            {
                _current++;
            
            }
            _maximum++;

        }
        if([_card.category isEqualToString:@"acceleration"])
        {
            if(_firstTime == YES)
            {
                _current++;
            }
            _maximum++;

        }
        if([_card.category isEqualToString:@"nonDiff"])
        {
            if(_firstTime == YES)
            {
                _current++;
            }
            _maximum++;

        }
        if([_card.category isEqualToString:@"velocity"])
        {
            if(_firstTime == YES)
            {
                _current++;
            }
            _maximum++;

        }
        if([_card.category isEqualToString:@"position"])
        {
            if(_firstTime == YES)
            {
                _current++;
            }
            _maximum++;

        }
        if([_card.category isEqualToString:@"ChangeDirection"])
        {
            if(_firstTime == YES)
            {
                _current++;
            }
            _maximum++;

        }
        if([_card.category isEqualToString:@"HorizontalTangent"])
        {
            if(_firstTime == YES)
            {
                _current++;
            }
            _maximum++;
        }


               
        _firstTime = YES;
        _card = [_deck drawRandomCard];
        
        [self upDateUI];
        
    }
    else
    {
        UIAlertView *alertView = [[[UIAlertView alloc] init]
                                  initWithTitle:@"Incorrect"
                                  message:@"Sorry.  Try Again?"
                                  delegate:nil
                                  cancelButtonTitle:@"Try Again"
                                  otherButtonTitles:nil];
                    [alertView show];
        
        _firstTime = NO;
    }
}

- (IBAction)button2:(id)sender {
   
    
    if(_card.answer == 2)
    {
        
        if(_maximum <9)
        {

        UIAlertView *alertView = [[[UIAlertView alloc] init]
                                  initWithTitle:@"Correct!"
                                  message:[NSString stringWithFormat:@"%@",_card.message]                                  delegate:nil
                                  cancelButtonTitle:@"Next Question"
                                  otherButtonTitles:nil];
        
            [alertView show];
        }
        else
        {
            _maximum++;
        }

        if([_card.category isEqualToString:@"ExponentOne"])
        {
            if(_firstTime == YES)
            {
                _current++;
                
            }
            _maximum++;
            
        }
        if([_card.category isEqualToString:@"chainOneTrig"])
        {
            if(_firstTime == YES)
            {
                _current++;
            }
            _maximum++;
            
        }
        if([_card.category isEqualToString:@"acceleration"])
        {
            if(_firstTime == YES)
            {
                _current++;
            }
            _maximum++;
            
        }
        if([_card.category isEqualToString:@"nonDiff"])
        {
            if(_firstTime == YES)
            {
                _current++;
            }
            _maximum++;
            
        }
        if([_card.category isEqualToString:@"velocity"])
        {
            if(_firstTime == YES)
            {
                _current++;
            }
            _maximum++;
            
        }
        if([_card.category isEqualToString:@"position"])
        {
            if(_firstTime == YES)
            {
                _current++;
            }
            _maximum++;
            
        }
        if([_card.category isEqualToString:@"ChangeDirection"])
        {
            if(_firstTime == YES)
            {
                _current++;
            }
            _maximum++;
            
        }
        if([_card.category isEqualToString:@"HorizontalTangent"])
        {
            if(_firstTime == YES)
            {
                _current++;
            }
            _maximum++;
        }
        _firstTime = YES;
        _card = [_deck drawRandomCard];
        
        [self upDateUI];
        
        
       
        
    }
    else
    {
        UIAlertView *alertView = [[[UIAlertView alloc] init]
                                  initWithTitle:@"Incorrect"
                                  message:@"Sorry.  Try Again?"
                                  delegate:nil
                                  cancelButtonTitle:@"Try Again"
                                  otherButtonTitles:nil];

            [alertView show];
        
        _firstTime = NO;

        
    }

    

}

- (IBAction)button3:(id)sender {
    if(_card.answer == 3)
    {
        if(_maximum <9)
        {
        UIAlertView *alertView = [[[UIAlertView alloc] init]
                                  initWithTitle:@"Correct!"
                                  message:[NSString stringWithFormat:@"%@",_card.message]
                                  delegate:nil
                                  cancelButtonTitle:@"Next Question"
                                  otherButtonTitles:nil];

        
            [alertView show];
        }
        else
        {
            _maximum++;
        }
        if([_card.category isEqualToString:@"ExponentOne"])
        {
            if(_firstTime == YES)
            {
                _current++;
                
            }
            _maximum++;
            
        }
        if([_card.category isEqualToString:@"chainOneTrig"])
        {
            if(_firstTime == YES)
            {
                _current++;
            }
            _maximum++;
            
        }
        if([_card.category isEqualToString:@"acceleration"])
        {
            if(_firstTime == YES)
            {
                _current++;
            }
            _maximum++;
            
        }
        if([_card.category isEqualToString:@"nonDiff"])
        {
            if(_firstTime == YES)
            {
                _current++;
            }
            _maximum++;
            
        }
        if([_card.category isEqualToString:@"velocity"])
        {
            if(_firstTime == YES)
            {
                _current++;
            }
            _maximum++;
            
        }
        if([_card.category isEqualToString:@"position"])
        {
            if(_firstTime == YES)
            {
                _current++;
            }
            _maximum++;
            
        }
        if([_card.category isEqualToString:@"ChangeDirection"])
        {
            if(_firstTime == YES)
            {
                _current++;
            }
            _maximum++;
            
        }
        if([_card.category isEqualToString:@"HorizontalTangent"])
        {
            if(_firstTime == YES)
            {
                _current++;
            }
            _maximum++;
        }
        

        _firstTime = YES;
        _card = [_deck drawRandomCard];
        
        [self upDateUI];
        
        
           }
    else
    {
        UIAlertView *alertView = [[[UIAlertView alloc] init]
                                  initWithTitle:@"Incorrect"
                                  message:@"Sorry.  Try Again?"
                                  delegate:nil
                                  cancelButtonTitle:@"Try Again"
                                  otherButtonTitles:nil];
        
            [alertView show];
        _firstTime = NO;

        
    }
    


}

- (IBAction)button4:(id)sender {
    if(_card.answer == 4)
    {

        if(_maximum <9)
        {

        UIAlertView *alertView = [[[UIAlertView alloc] init]
                                  initWithTitle:@"Correct!"
                                  message:[NSString stringWithFormat:@"%@",_card.message]
                                  delegate:nil
                                  cancelButtonTitle:@"Next Question"
                                  otherButtonTitles:nil];
                    [alertView show];
        }
        else
        {
            _maximum++;
        }
        if([_card.category isEqualToString:@"ExponentOne"])
        {
            if(_firstTime == YES)
            {
                _current++;
            }
            _maximum++;
            
        }
        if([_card.category isEqualToString:@"chainOneTrig"])
        {
            if(_firstTime == YES)
            {
                _current++;
            }
            _maximum++;
            
        }
        if([_card.category isEqualToString:@"acceleration"])
        {
            if(_firstTime == YES)
            {
                _current++;
            }
            _maximum++;
            
        }
        if([_card.category isEqualToString:@"nonDiff"])
        {
            if(_firstTime == YES)
            {
                _current++;
            }
            _maximum++;
            
        }
        if([_card.category isEqualToString:@"velocity"])
        {
            if(_firstTime == YES)
            {
                _current++;
            }
            _maximum++;
            
        }
        if([_card.category isEqualToString:@"position"])
        {
            if(_firstTime == YES)
            {
                _current++;
            }
            _maximum++;
            
        }
        if([_card.category isEqualToString:@"ChangeDirection"])
        {
            if(_firstTime == YES)
            {
                _current++;
            }
            _maximum++;
            
        }
        if([_card.category isEqualToString:@"HorizontalTangent"])
        {
            if(_firstTime == YES)
            {
                _current++;
            }
            _maximum++;
        }
        _firstTime = YES;
        _card = [_deck drawRandomCard];
        
        [self upDateUI];
        
        
    }
    else
    {
        UIAlertView *alertView = [[[UIAlertView alloc] init]
                                  initWithTitle:@"Incorrect"
                                  message:@"Sorry.  Try Again?"
                                  delegate:nil
                                  cancelButtonTitle:@"Try Again"
                                  otherButtonTitles:nil];
        
            [alertView show];
        _firstTime = NO;
        
    }
    

}
@end
