# SpotX iOS SDK Quick Start

Example code and tutorial for displaying SpotX video ads in iOS apps.

Check out the [SpotX Demo App](https://github.com/spotxmobile/spotx-demo-ios) on github for an example app.

## Prerequisites
* Minimum iOS version: 7.0
* SpotX publisher account - [apply to become a publisher](http://www.spotxchange.com/publishers/apply-to-become-a-spotx-publisher/)

## Before You Begin
1. You'll need to be a SpotX publisher if you aren't already.  You will
receive  the SpotX SDK, a publisher ID, and an account to log into the [SpotX
Publisher Tools](https://publisher.spotxchange.com).

2. From the Publisher Tools you will be able to create "channels" that define the
entry point to connecting with advertisers.  You'll need to create a channel
before you can use the SDK. Once a channel is created you will be given a
channel ID and you use this channel ID to integrate with the SDK.

## Getting Started ##
### Installation with CocoaPods (recommended)###
Installation with [CocoaPods](https://cocoapods.org/) is an alternative to downloading the SDK. CocoaPods is a dependency manager for iOS and Mac apps, which automates and simplifies the process of using 3rd-party libraries in your projects.

Add the following pod to your `Podfile`:

```ruby
pod 'SpotX-SDK'
```

### Manual Installation ###
Download the latest SDK from the SpotX [Bintray Repository](https://bintray.com/spotxmobile/pods/spotx-sdk-ios/view).

The SpotX SDK makes use of many iOS core frameworks. Add the following frameworks to your app:

- AdManager.framework
- AdSupport.framework
- CoreData.framework
- CoreGraphics.framework
- CoreLocation.framework
- CoreTelephony.framework
- EventKit.framework
- Foundation.framework
- SystemConfiguration.framework
- Security.framework
- UIKit.framework

Under **Build Settings > Other Linker Flags** set the following flag:
```
-all_load
```

## Using the SDK ###

Look at the [iOS SDK Advanced Documentation](/ios/sdk-advanced) for more information on settings and parameters.

### Show an Ad ###
```objective-c
// File: ViewController.m

@import AdSupport;
#import "ViewController.h"
#import <SpotX/SpotX.h>

@interface ViewController () <SpotXAdDelegate>
  @property (nonatomic, strong) SpotXView *adView;
@end

@implementation ViewController

- (void)viewDidLoad
{
	[super viewDidLoad];

    // Required: Initialize the SpotX SDK
	[SpotX initializeWithApiKey:nil
                       category:@"IAB1"
                        section:@"Fiction"
		                 domain:@"www.mydomain.com"
			                url:@"https://itunes.apple.com/us/app/my_app/id123456789"];

    // Set a default Channel ID
    [SpotX setDefaultChannelID:@"85394"];

	// Optional: Configure default settings
	id<SpotXAdSettings> settings = [SpotX defaultSettings];
	settings.useHTTPS = @YES;
	settings.useNativeBrowser = @YES;

    // Optional: Detect and set "Do Not Track" parameter, i.e. "device[dnt]" parameter
    ASIdentifierManager *asidManager = [ASIdentifierManager sharedManager];
    settings.trackable = @(asidManager.advertisingTrackingEnabled);

	// Optional: Configure default custom parameters (Custom Taxonomy)
	[SpotX setDefaultParameters:@{
		@"custom_param": @"custom_value"
	}];

    // Create the SpotXView and start loading an ad
    _adView = [[SpotXView alloc] initWithFrame:self.view.bounds];
	_adView.delegate = self;
	[_adView startLoading];
}

- (void)showAd
{
	// Show the Ad. If the ad is still loading, it may take a
	// few seconds for the video to start.
	[self.adView show];
}

#pragma mark - SpotXAdDelegate

- (void)presentViewController:(UIViewController *)viewControllerToPresent
{
	[self presentViewController:viewControllerToPresent animated:YES completion:nil];
}

- (void)adLoaded
{
  NSLog(@"Ad is loaded and ready to play");
  [self showAd];
}

- (void)adError:(NSString *)error
{
  NSLog(@"There was an error with the ad: %@", error);
}

- (void)adFailedWithError:(NSError *)error
{
  // called when there is no ad available or can't reach ad server
  NSLog(@"Ad Failed with error: %@", error.localizedDescription);
}

@end
```
