//
//  iwLoginViewController.m
//  LiveTime
//
//  Created by Wayn Liu on 14-5-25.
//  Copyright (c) 2014年 IDEASWALL. All rights reserved.
//

#import "iwLoginViewController.h"
#import "POP.h"
#import "NSString+helper.h"
#import "iwUser.h"

@interface iwLoginViewController () <UITextFieldDelegate>

#pragma mark - Property

@property (nonatomic, weak) IBOutlet UITextField *emailField;
@property (nonatomic, weak) IBOutlet UITextField *passwordField;
@property (nonatomic, weak) IBOutlet UIButton *submitButton;
@property (nonatomic, weak) IBOutlet UIButton *toogleLoginAndSignUpButton;
@property (nonatomic, assign) BOOL isLogin;

#pragma mark - Action

- (IBAction)onSubmitButtonClick:(id)sender;
- (IBAction)onToogleLoginAndSignUpButtonClick:(id)sender;

@end

@implementation iwLoginViewController

#pragma mark - Viewcontroller LifeCycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initialize];
}

- (void)initialize
{
    _isLogin = YES;
    [_emailField becomeFirstResponder];
    
    [_emailField addTarget:self action:@selector(textFieldDidChanged:) forControlEvents:UIControlEventEditingChanged];
    [_passwordField addTarget:self action:@selector(textFieldDidChanged:) forControlEvents:UIControlEventEditingChanged];
}

#pragma mark - TextField Action

- (void)textFieldDidChanged:(UITextField *)textField
{
    POPSpringAnimation *buttonAnimation = [POPSpringAnimation animation];
    
    if ([_emailField.text trimStringWithSpace].length > 0 && [_passwordField.text trimStringWithSpace].length > 0)
    {
        if (_submitButton.hidden == NO)
            return;
        
        _submitButton.hidden = NO;
        buttonAnimation.fromValue = [NSValue valueWithCGSize:CGSizeMake(40, 40)];
        buttonAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(60, 60)];
        buttonAnimation.property = [POPAnimatableProperty propertyWithName:kPOPLayerSize];
        buttonAnimation.springBounciness = 20.0;
        buttonAnimation.springSpeed = 20.0;
        [_submitButton pop_addAnimation:buttonAnimation forKey:@"pop"];
    }
    else
    {
        [_submitButton.layer removeAllAnimations];
        _submitButton.hidden = YES;
    }
}

#pragma mark - TextField delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (_emailField == textField)
    {
        [_emailField resignFirstResponder];
        [_passwordField becomeFirstResponder];
        
        return YES;
    }
    
    if (_passwordField == textField)
    {
        [_passwordField resignFirstResponder];
        [self animateSubmitButton];
    }
    
    return NO;
}

#pragma mark - Button Action

- (void)onSubmitButtonClick:(id)sender
{
    [self animateSubmitButton];
    
    [self.view endEditing:YES];
}

- (void)onToogleLoginAndSignUpButtonClick:(id)sender
{
    _isLogin = !_isLogin;
    
    self.title = _isLogin ? @"登录" : @"注册";
    NSString *toogleButtonTitle = _isLogin ? @"还没账户? 去注册." : @"我有账户，去登录.";
    [_toogleLoginAndSignUpButton setTitle:toogleButtonTitle forState:UIControlStateNormal];
}

#pragma mark - Request

- (void)loginRequest
{
    [iwUser loginWithUser:@{@"mail": _emailField.text, @"password": _passwordField.text}
                  success:^(id userObject) {
                      
                  }
                  failure:^(NSError *error) {
                      
                  }];
}

#pragma mark - Function

- (void)animateSubmitButton
{
    POPSpringAnimation *frameAnimation = [POPSpringAnimation animation];
    frameAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(kWindowWitdth / 2, kWindowHeight - 50)];
    frameAnimation.property = [POPAnimatableProperty propertyWithName:kPOPLayerPosition];
    frameAnimation.springBounciness = 10.0;
    frameAnimation.springSpeed = 10.0;
    [_submitButton pop_addAnimation:frameAnimation forKey:@"position"];
    
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = @(M_PI * 2.0);
    rotationAnimation.duration = 1;
    rotationAnimation.autoreverses = YES;
    rotationAnimation.repeatCount = HUGE_VALF;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [_submitButton.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

@end
