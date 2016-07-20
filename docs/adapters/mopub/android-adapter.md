#  MoPub Adapter for the Android SpotX SDK#

## Who Can Use the Adapter

To use the adapter, you need to be a SpotX publisher and use the MoPub SDK for Android.
If you are not already a SpotX publisher, [apply to become a spotx publisher](http://www.spotxchange.com/publishers/apply-to-become-a-spotx-publisher/).

## What the Adapter Does

The adapter allows the [SpotX SDK](/android/sdk) and the [MoPub SDK](https://github.com/mopub/mopub-android-sdk) to communicate with each other seamlessly.

## How to Install the Adapter

There are three ways to install this adapter:

### Gradle Dependency (preferred)

Simply add the following to your build.gradle.

```groovy
compile 'com.spotxchange:spotx-mopub-android:+'
```

### Maven Dependency

Declare the dependency in Maven:

```xml
<dependency>
    <groupId>com.spotxchange</groupId>
    <artifactId>spotx-mopub-android</artifactId>
    <version>3.0</version>
</dependency>
```

### As a Library Project

Download the library and import it as a library project in Android Studio or Eclipse. The library is available from our [bintray repo](https://bintray.com/spotxmobile/maven/com.spotxchange%3Aspotx-mopub-android).

Get more information on how to do this at the [Android Developer Docs](http://developer.android.com/tools/projects/index.html#LibraryProjects).


## Configuration

Use the custom data field to pass configuration parameters to the SpotX adapter. Get more information on MoPub custom events [here](https://dev.twitter.com/mopub/ad-networks). The custom data is a [JSON](http://json.org) object with the following mandatory keys:

* channel_id - Your SpotXchange  publisher channel ID
* playstore_url - URL to your app in the Google Play store.
* app_domain - Internet domain for your app's website
* iab_category - IAB category used to classify your app

Get step-by-step instructions on how to specify parameters through the [MoPub Dev Website](https://dev.twitter.com/mopub/ad-networks).

For more information on the SpotX Android SDK check out the [Documentation](/android/sdk/#setup-your-android-manifest).
