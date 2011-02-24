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
@synthesize colorWell   = _colorWell;
@synthesize popupButton = _popupButton;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	self.window.delegate = self;

	[self.popupButton removeAllItems];

	[self.popupButton addItemWithTitle:@"#rrggbb"];
	[self.popupButton addItemWithTitle:@"rgb(r, g, b)"];
}

- (void)dealloc {
	self.colorWell   = nil;
	self.popupButton = nil;
	[super dealloc];
}

#pragma - Actions

- (IBAction)selectColor:(id)sender {
	NSColorPanel *panel = [NSColorPanel sharedColorPanel];

	// Call private selector
	[panel performSelector:@selector(_magnify:)];
}

- (IBAction)copyToPasteBoard:(id)sender {
	NSString *output = nil;
	NSString *format = [[self.popupButton selectedItem] title];
	NSColor  *color  = [self.colorWell color]; // [[self.colorWell color] colorUsingColorSpaceName:NSCalibratedRGBColorSpace];

	double redFloatValue, greenFloatValue, blueFloatValue;

	[color getRed:&redFloatValue green:&greenFloatValue blue:&blueFloatValue alpha:NULL];

	int redIntValue, greenIntValue, blueIntValue;

	redIntValue   = redFloatValue * 255.9999f;
	greenIntValue = greenFloatValue * 255.9999f;
	blueIntValue  = blueFloatValue * 255.9999f;

	if ([format isEqualToString:@"#rrggbb"]) {
		output = [NSString stringWithFormat:@"#%02x%02x%02x", redIntValue, greenIntValue, blueIntValue];
	} else {
		output = [NSString stringWithFormat:@"rgb(%d, %d, %d)", redIntValue, greenIntValue, blueIntValue];
	}


	NSPasteboard *pb = [NSPasteboard generalPasteboard];
	[pb declareTypes:[NSArray arrayWithObjects:NSStringPboardType, nil] owner:self];
	[pb setString:output forType:NSStringPboardType];
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
