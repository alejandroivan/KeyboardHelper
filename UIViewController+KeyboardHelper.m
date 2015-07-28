//
//  UIViewController+KeyboardHelper.m
//

#import <objc/runtime.h>
#import "UIViewController+KeyboardHelper.h"

static void *TapGestureRecognizerPropertyKey = &TapGestureRecognizerPropertyKey;

@implementation UIViewController (KeyboardHelper)




// Getter/setter for tap gesture recognizer
- (void)setTapGestureRecognizer:(UITapGestureRecognizer *)tgr
{
    objc_setAssociatedObject( self, TapGestureRecognizerPropertyKey, tgr, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
}

- (UITapGestureRecognizer *)tapGestureRecognizer
{
    return objc_getAssociatedObject( self, TapGestureRecognizerPropertyKey );
}




#pragma mark - Tap Gesture Recognizer setup
- (void)configureTapGestureRecognizer
{
    self.tapGestureRecognizer                           = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapOnMainView:)];
    self.tapGestureRecognizer.cancelsTouchesInView      = NO;
    self.tapGestureRecognizer.numberOfTapsRequired      = 1;
    self.tapGestureRecognizer.numberOfTouchesRequired   = 1;
    
    [self.view addGestureRecognizer:self.tapGestureRecognizer];
}


- (void)handleTapOnMainView:(UITapGestureRecognizer *)sender // Override on view controller if needed
{
    [self dismissKeyboard];
}


#pragma mark - Dismiss Keyboard
- (void)dismissKeyboard
{
    [self changeFirstResponderToView:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField // Override on view controller
{
    [self dismissKeyboard];
    return YES;
}


#pragma mark - Find First Responder
- (UIView *)findFirstResponder
{
    return [self findFirstResponderFromViewController:self];
}



- (UIView *)findFirstResponderFromViewController:(UIViewController *)viewController
{
    return [self findFirstResponderFromView:viewController.view];
}



- (UIView *)findFirstResponderFromView:(UIView *)rootView
{
    UIView *firstResponder = [rootView isFirstResponder] ? rootView : nil;
    
    if ( ! firstResponder )
        for (UIView *subview in rootView.subviews )
        {
            firstResponder = [self findFirstResponderFromView:subview];
            
            if ( firstResponder )
                break;
        }
    
    return firstResponder;
}




#pragma mark Change First Responder
- (void)changeFirstResponderToView:(UIView *)nextResponder
{
    UIView *firstResponder = [self findFirstResponder];
    
    if ( firstResponder == nextResponder )
        return;
    
    
    [firstResponder resignFirstResponder];
    [nextResponder becomeFirstResponder];
}


@end
