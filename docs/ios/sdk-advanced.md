# SpotX iOS SDK Advanced Documentation
Advanced documentation for SpotX iOS SDK


## SpotX Initialize Parameters
| Parameter | Description |
| --- | --- |
| initializeWithApiKey | not currently used, for future use, so pass in `nil` |
| category | an [IAB category](/iab-categories) key that best fits the app |
| section | the best fit IAB section for the app pulled from a relevant [IAB category](/iab-categories) |
| domain | the domain of the app or company |
| url | the URL of the app in the [App Store](https://developer.apple.com/library/ios/qa/qa1633/_index.html) |


Example:
```
[SpotX initializeWithApiKey:nil
                   category:@"IAB1"
                    section:@"Fiction"
                     domain:@"www.mydomain.com"
                        url:@"https://itunes.apple.com/us/app/my_app/id123456789"];
```

Read more about the OpenRTB [IAB Specification v2.0](http://www.iab.net/media/file/OpenRTB_API_Specification_Version2.0_FINAL.PDF) if you're interested.


## SpotXAdSettings Configuration ##

All parameters take can be `"1"` for ON or `"0"` for OFF; with the exception of `endCardDuration`.

| Parameter | Default Value | Description |
| --- | --- | --- |
| useHTTPS | 0 | sets all ad requests to use SSL over HTTPS |
| useNativeBrowser | 0 | open click-though links in the native Safari browser |
| autoplay | 1 | play the ad without user interaction |
| skippable | 0 | allow the ad to skipped by the user |
| muted | 0 | request a muted ad if the volume is muted and muted is set |
| trackable | 1 | sets the "Do Not Track" in the ad request. [Read about how to set 'dnt'](#do-not-track) |
| endCardDuration | 0 | number of milliseconds to show an end card after an ad, if available |
| allowCalendar | 0 | allow a MRAID ad to set a calendar event |
| allowPhone | 0 | allow a MRAID ad to dial a phone number |
| allowSMS | 0 | allow a MRAID ad to write a text message |
| allowStorage | 0 | allow a MRAID ad to save a file (usually an image) |

## Do Not Track

To respect the user's preferences of `Do Not Track` you can set the `trackable` parameter to `1` to enable tracking, and `0` to NOT track.

You can set `Do Not Track` by:

```objective-c
@import AdSupport;

...

// init SpotX SDK
[SpotX initializeWithApiKey:nil
                   category:@"IAB1"
                    section:@"Fiction"
                     domain:@"www.mydomain.com"
                        url:@"https://itunes.apple.com/us/app/my_app/id123456789"];

// create SpotXAdSettings object
id<SpotXAdSettings> settings = [SpotX defaultSettings];

// set "Do Not Track", i.e. "device[dnt]" parameter
ASIdentifierManager *asidManager = [ASIdentifierManager sharedManager];
settings.trackable = @(asidManager.advertisingTrackingEnabled);

...
```
