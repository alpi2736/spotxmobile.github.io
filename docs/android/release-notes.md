# Release Notes For SpotX Android SDK

### v3.0.4
* Fixed issue with deal device targeting.
* Removed 'no media file' assertion.
* Fixed VAST wrapper parsing.
* Removed `device[os]` and `device[devicetype]` request parameters.
* Added `player_width` and `player_height` request parameters.

### v3.0.3
* Removed the `device[didsha1]` and `device[ip]` request parameters.
* Added Support for **MoPub** and **Brightcove** adapters.

### v3.0.2
* Added the `X-Device-User-Agent` header to all network requests.
* Added `device[ua]` to the request parameters.

### v3.0.1
* In-content playback starts when _> 50%_ of the player is in view and stops when _< 50%_.

### v3.0.0
* New SDK, supports playing video ads natively either interstitial or in-content.
