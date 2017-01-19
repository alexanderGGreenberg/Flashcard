//
//  percentDisplayViewViewController.m
//  CalcFlashDemo
//
//  Created by Alex Greenberg on 12/30/14.
//  Copyright (c) 2014 MakerMason. All rights reserved.
//

#import "percentDisplayViewViewController.h"

@interface percentDisplayViewViewController ()
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel1;

@property (weak, nonatomic) IBOutlet UILabel *chainOneTrigText;
@property (weak, nonatomic) IBOutlet UILabel *nonDiffText;
@property (weak, nonatomic) IBOutlet UILabel *HorizontalTangentText;
@property (weak, nonatomic) IBOutlet UILabel *accelerationText;
@property (weak, nonatomic) IBOutlet UILabel *velocityText;
@property (weak, nonatomic) IBOutlet UILabel *positionText;
@property (weak, nonatomic) IBOutlet UILabel *ChangeDirectionText;

@end

@implementation percentDisplayViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog([NSString stringWithFormat:@"%d", ChangeDirectionMax]);
    

    _chainOneTrigText.text = [NSString stringWithFormat:@"Chain Rule/Trig Functions\n" @"%d" @"/" @"%d",chainOneTrig,chainOneTrigMax];
    _nonDiffText.text = [NSString stringWithFormat:@"Non-Differentiability\n" @"%d" @"/" @"%d",nonDiff,nonDiffMax];
    _HorizontalTangentText.text = [NSString stringWithFormat:@"Horizontal Tanegents\n" @"%d" @"/" @"%d",HorizontalTangent,HorizontalTangentMax];
    _accelerationText.text = [NSString stringWithFormat:@"Acceleration\n" @"%d" @"/" @"%d",acceleration,accelerationMax];
    _velocityText.text = [NSString stringWithFormat:@"Velocity\n" @"%d" @"/" @"%d",velocity,velocityMax];
    _positionText.text = [NSString stringWithFormat:@"Position\n" @"%d" @"/" @"%d",position,positionMax];
    _chainOneTrigText.text = [NSString stringWithFormat:@"Change Direction\n" @"%d" @"/" @"%d", ChangeDirection, ChangeDirectionMax];
   
    

    

    

    

    

    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
