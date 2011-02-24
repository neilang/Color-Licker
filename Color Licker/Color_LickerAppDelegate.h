//
//  Color_LickerAppDelegate.h
//  Color Licker
//
//  Created by Neil Ang on 24/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Color_LickerAppDelegate : NSObject <NSApplicationDelegate> {
@private
  NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

@end
