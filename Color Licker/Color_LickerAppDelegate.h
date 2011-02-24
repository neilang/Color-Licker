//
// Color_LickerAppDelegate.h
// Color Licker
//
// Created by Neil Ang on 24/02/11.
// Copyright 2011 neilang.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Color_LickerAppDelegate : NSObject <NSApplicationDelegate, NSWindowDelegate> {
	@private
	NSWindow      *window;
	NSColorWell   *_colorWell;
	NSPopUpButton *_popupButton;
}

- (IBAction)selectColor:(id)sender;
- (IBAction)copyToPasteBoard:(id)sender;

@property (assign) IBOutlet NSWindow                 *window;
@property (nonatomic, assign) IBOutlet NSColorWell   *colorWell;
@property (nonatomic, assign) IBOutlet NSPopUpButton *popupButton;

@end
