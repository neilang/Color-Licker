//
// Color_LickerAppDelegate.m
// Color Licker
//
// Created by Neil Ang on 24/02/11.
// Copyright 2011 neilang.com. All rights reserved.
//

#import "Color_LickerAppDelegate.h"

@implementation Color_LickerAppDelegate

@synthesize window;
@synthesize colorWell = _colorWell;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	self.window.delegate = self;
}

- (void)dealloc {
	self.colorWell = nil;
	[super dealloc];
}

#pragma - Actions

- (IBAction)selectColor:(id)sender {
	NSColorPanel *panel = [NSColorPanel sharedColorPanel];

	// Call private selector
	[panel performSelector:@selector(_magnify:)];
}

#pragma - Color Panel Delegates

- (void)changeColor:(id)sender {
	[self.colorWell setColor:[[NSColorPanel sharedColorPanel] color]];
}

#pragma - Window Delegates

- (BOOL)windowShouldClose:(id)sender {
	[[NSApplication sharedApplication] hide:sender];
	return NO;
}

@end
