SpotX tvOS Integration
=========================

Monetize your tvOS app with SpotX!

## Prerequisites

  * Xcode 7.1.1
  * SpotX publisher account
  	* [Apply to become a SpotX Publisher](http://www.spotxchange.com/publishers/apply-to-become-a-spotx-publisher/)


## Presenting an Ad in a Native App

  1. Include SpotXAd.swift in your project. Don't worry, there are no additional dependencies.
  2. Instantiate a SpotXAd instance with your publisher channel ID and any additional parameters you wish to collect.
  3. Attach an implementation of the SpotXAdDelegate protocol, if you are interested in Ad lifecycle events.
  4. Present the Ad by calling SpotXAd.show().


```swift
static let CHANNEL_ID = "85394"

func playAd() {
	self.ad = SpotXAd(channelId: CHANNEL_ID, delegate: self)
	self.ad?.show(self, animated: true)
}
```


## Presenting an Ad in a TVML App

  1. Load the SpotX SDK. Don't worry, there are no additional dependencies.
  2. Load up a SpotX Ad with your publisher channel ID.
  3. Add any additional parameters you wish to collect.
  4. Pass a callback to receive the SpotXAdPlayer.
  5. Add event listeners to the player, if you are interested in Ad lifecycle events.
  6. Present the Ad by calling `player.standalone().play()`.


```javascript
// NOTE: Subject to change after prerelease development
var SPOTX_SDK = 'https://m.spotx.ninja/tvos/v2/sdk.js';
var CHANNEL_ID = '85394'

App.onLaunch = function(options) {
  evaluateScripts([SPOTX_SDK], function() {
    loadAd();
  });
};

function loadAd() {
  var params = {
    custom_1: 'custom-param'
  };

  SpotX.load(CHANNEL_ID, params, function (error, player) {
      var AD_EVENTS = ['AdStarted', 'AdStopped', 'AdError'];
      AD_EVENTS.forEach(function(event) {
        player.addEventListener(event, function() {
          console.log('Received event: ' + event);
        });
      });

      player.standalone().play();
  });
}
```
