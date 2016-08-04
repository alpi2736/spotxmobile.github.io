# Release Notes For SpotX iOS SDK

Latest version: `2.2.4` released on **2016-08-04**

### 2.2.4
* Updated to new `mraid.js` url.
* Fixed issue with deal device targeting.
* Removed `device[didsha1]` and `device[dpidsha1]` request parameters.

### 2.2.3
* Removed `device[ip]` and `media_transcoding` from request parameters.
* Added the `X-Device-User-Agent` header to all network requests.
* Added `device[ua]` and `preload=0` to the request parameters.

### 2.2.2
* Fixed memory issues.
* Added public function `[SpotXView -dispose]` to explicitly release WebView resources.

### 2.2.1
* HTTPS fix for `mraid.js`.
* Added bitcode support.
* Turn off module debug symbols because of Xcode 7.

### 2.2.0
* Add support for `end_slate` parameter.
* Added `device["lang"]` to request parameters.
* In-content playback starts when _> 50%_ of the player is in view and stops when _< 50%_.
* Using new v1 endpoint of `mraid.js` url.
