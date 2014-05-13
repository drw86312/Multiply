//
//  ViewController.m
//  Multiply
//
//  Created by David Warner on 5/12/14.
//  Copyright (c) 2014 DRWlabs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *myNumber;
@property (weak, nonatomic) IBOutlet UILabel *myMultiplier;
@property (weak, nonatomic) IBOutlet UILabel *myAnswer;
@property (weak, nonatomic) IBOutlet UISlider *valueSlider;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

// This creates an instance of UITapGestureRecognizer which will dismiss the keyboard when a user taps on the screen.
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];

// This adds gesture recognizer behavior to the view
    [self.view addGestureRecognizer:tap];

}

- (IBAction)onMultiplierValueChanged:(id)sender
{
    self.myMultiplier.text = [NSString stringWithFormat:@"%.0f", self.valueSlider.value];
}

- (IBAction)onCalculateButtonPressed:(id)sender
{
    NSInteger myNumber = [self.myNumber.text integerValue];
    NSInteger myMultiplier = [self.myMultiplier.text integerValue];
    NSInteger result = myNumber * myMultiplier;
    NSString *stringValue = [NSString stringWithFormat:@"%d", result];
    if (result > 20) {
        self.view.backgroundColor = [UIColor greenColor];
    } else {
        self.view.backgroundColor = [UIColor whiteColor];
    }

    if (result % 3 == 0 && result % 5 == 0) {
        self.myAnswer.text = @"fizzbuzz";
    } else if (result % 3 == 0) {
        self.myAnswer.text = @"fizz";
    } else if (result % 5 == 0) {
        self.myAnswer.text = @"buzz";
    } else {
        self.myAnswer.text = stringValue;
    }

    [self.myNumber resignFirstResponder];

}

-(void)dismissKeyboard
{
    [self.myNumber resignFirstResponder];
    // This is a method that will dismiss the keyboard when it is called.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
