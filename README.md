#Keyboard Helper

This project was useful for me to avoid messing too much with first responders on iOS (for dismissing keyboard when tapping on a view controller), so here it is if it's useful for someone.

Methods and properties
======================
```
	@property (strong, nonatomic) UITapGestureRecognizer *tapGestureRecognizer;

	- (void)configureTapGestureRecognizer;
	- (void)dismissKeyboard;

	- (UIView *)findFirstResponder;
	- (UIView *)findFirstResponderFromViewController:(UIViewController *)viewController;
	- (UIView *)findFirstResponderFromView:(UIView *)rootView;
	
	- (void)changeFirstResponderToView:(UIView *)nextResponder;
```


How to import it?
=================
```
#include "UIViewController+KeyboardHelper.h"
```
on a **UIViewController** subclass.


How to configure it?
====================
- Set the **properties** for referencing your **UITextField** from the Storyboard.
- Implement the **textFieldShouldReturn:** method according to your form navigation.


Examples?
=========
Making keyboard navigation (next/done) for a username/password form.

```
    - (void)viewDidLoad
    {
    	[super viewDidLoad];
    	
    	// OPTIONAL: Configure the Tap Gesture Recognizer (only if you want it automatically configured).
    	[self configureTapGestureRecognizer];
    }
    
    // Implement the navigation for the text fields.
	- (BOOL)textFieldShouldReturn:(UITextField *)textField
	{
		if ( textField == self.usernameTextField )
		{
			[self changeFirstResponderToView:self.passwordTextField];
		}
		else if ( textField == self.passwordTextField )
		{
			[self dismissKeyboard];
		}
		else
		{
			return NO;
		}
		
		return YES;
	}
	
	// OPTIONAL: Override if you need it.	
	- (IBAction)handleTapOnMainView:(UITapGestureRecognizer *)sender // Handler for gesture recognizer
	{
		[self dismissKeyboard];
	}
```