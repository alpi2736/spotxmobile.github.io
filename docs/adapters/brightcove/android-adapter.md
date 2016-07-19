# Brightcove Adapter for the Android SpotX SDK

## Who Can Use the Adapter

To use the plugin, you need to be a SpotX publisher and use the Brightcove Player SDK for Android.
If you are not already a SpotX publisher, click [here](http://www.spotxchange.com/publishers/apply-to-become-a-spotx-publisher/) to apply.

## What the Plugin Does

The plugin allows the [SpotX SDK](/android/sdk) and the Brightcove Player SDK to work together so you can monetize your player's content. To use this new plugin, SpotX publishers will need to integrate the SpotX SDK and the Brightcove Player SDK into their App.

## How to Install the Adapter

There are three ways to install this plugin:

### Gradle Dependency (preferred)

Simply add the following to your build.gradle.

```groovy
compile 'com.spotxchange:spotx-brightcove:3.0.+'
```

### Maven Dependency

Declare the dependency in Maven:

```xml
<dependency>
    <groupId>com.spotxchange</groupId>
    <artifactId>spotx-brightcove</artifactId>
    <version>3.0</version>
</dependency>
```

### As a Library Project

Download the library and import it as a library project in Android Studio or Eclipse. The project is available from our [bintray repo](https://bintray.com/spotxmobile/maven/com.spotxchange%3Aspotx-brightcove).

Get more information on how to do this at the [Android Developer Docs](http://developer.android.com/tools/projects/index.html#LibraryProjects).

## Set Up

To set up and use the SpotX plugin you need to initialize the SpotX SDK and construct the adapter with your publisher channel ID within your activity.
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

To learn more about the additional settings and parameters you can pass, check out the [SpotX SDK Android Documentation](/android/sdk/#ad-integration).

## Usage

You can look at the [SpotX Demo App](https://github.com/spotxmobile/spotx-demo-android) on how to integrate the  Brightcove adapter, or you can follow [Brightcove's sample app](https://github.com/BrightcoveOS/android-plugin-guide/blob/master/sample/SamplePluginApplication/src/main/java/com/brightcove/player/application/MainActivity.java) on how to configure and use the plugin with the Brightcove SDK.
