//
//  UIViewController+KeyboardHelper.h
//

@import UIKit;

@interface UIViewController (KeyboardHelper)

@property (strong, nonatomic) UITapGestureRecognizer *tapGestureRecognizer;

- (void)configureTapGestureRecognizer;
- (void)dismissKeyboard;

- (UIView *)findFirstResponder;
- (UIView *)findFirstResponderFromViewController:(UIViewController *)viewController;
- (UIView *)findFirstResponderFromView:(UIView *)rootView;

- (void)changeFirstResponderToView:(UIView *)nextResponder;

@end
