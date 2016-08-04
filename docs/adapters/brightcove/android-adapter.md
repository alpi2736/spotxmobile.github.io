# Brightcove Adapter for the Android SpotX SDK

## Who Can Use the Adapter

To use the adapter, you need to be a SpotX publisher and use the Brightcove Player SDK for Android.
If you are not already a SpotX publisher, [apply to become a spotx publisher](http://www.spotxchange.com/publishers/apply-to-become-a-spotx-publisher/).

## What the adapter Does

The adapter allows the [SpotX Android SDK](/android/sdk) and the Brightcove Player SDK to work together so you can monetize your player's content.

## How to Install the Adapter

Follow the documentation for installing the [SpotX Android SDK](/android/sdk/#install-the-sdk).

## Set Up

To set up and use the SpotX adapter you need to initialize the SpotX SDK and construct the adapter with your publisher channel ID within your activity.
```java
// init SpotX
SpotX.initialize(getApplicationContext());

// construct adapter
String channelId = "85394";
EventEmitter emitter = brightcoveVideoView.getEventEmitter()
SpotXBrightcoveAdapter spotxAdapter = new SpotXBrightcoveAdapter(emitter, this, channelId);
```

You can set the number of ads that the adapter will play be setting the `adCount` property to value greater than 1.
```java
spotxAdapter.adCount = 3; // default: 1 ad
```

You can also specify the duration of ads in seconds you would like to play that will override the set count by setting `adDuration`.
```java
spotxAdapter.adDuration = 90; // default: 0 seconds
```

If you want to customize the timeout length for loading an ad you can set the `adLoadTimeoutSeconds` property.
```java
spotxAdapter.adLoadTimeoutSeconds = 5; // default: 10 seconds
```

## Configure

If you wish to set additional settings such as `useHTTPS` you can access the `SpotXAdBuilder` with the function `getAdBuilder()`.
```java
spotxAdapter.getAdBuilder().useHTTPS = true;
```

To learn more about the additional settings and parameters you can pass, check out the [SpotX SDK Android Documentation](/android/sdk/#ad-integration) and the [Advanced Android Documentation](/android/sdk-advanced/).

## Usage

You can look at the [SpotX Demo App](https://github.com/spotxmobile/spotx-demo-android) on how to integrate the  Brightcove adapter, or you can follow [Brightcove's sample app](https://github.com/BrightcoveOS/android-plugin-guide/blob/master/sample/SamplePluginApplication/src/main/java/com/brightcove/player/application/MainActivity.java) on how to configure and use the adapter with the Brightcove SDK.
