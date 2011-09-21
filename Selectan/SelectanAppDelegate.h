//
//  SelectanAppDelegate.h
//  Selectan
//
//  Created by neorg on 20/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SelectanViewController;

@interface SelectanAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet SelectanViewController *viewController;

@end
