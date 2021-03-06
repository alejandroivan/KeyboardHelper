//
//  UIViewController+KeyboardHelper.h
//

#import <UIKit/UIKit.h>

@interface UIViewController (KeyboardHelper)

@property (strong, nonatomic) UITapGestureRecognizer *tapGestureRecognizerKH;
@property (strong, nonatomic) NSMutableArray *tapGestureRecognizerViewsKH;
@property (weak, nonatomic) UIScrollView *scrollViewKH;


- (void)addGestureRecognizerToView:(UIView *)theView;
- (void)removeGestureRecognizerFromView:(UIView *)theView;
- (void)removeGestureRecognizerFromAllViews;

- (void)configureTapGestureRecognizer;
- (void)configureTapGestureRecognizerWithView:(UIView *)theView;

- (void)dismissKeyboard;

- (UIView *)findFirstResponder;
- (UIView *)findFirstResponderFromViewController:(UIViewController *)viewController;
- (UIView *)findFirstResponderFromView:(UIView *)rootView;


- (void)changeFirstResponderToView:(UIView *)nextResponder;

// Get notified and scroll a scroll view properly when started editing a form
- (void)registerForKeyboardNotifications;
- (void)registerForKeyboardNotificationsWithScrollView:(UIScrollView *)theScrollView;
- (void)deregisterForKeyboardNotifications;
@end
