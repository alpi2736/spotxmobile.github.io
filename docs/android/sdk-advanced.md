# SpotX Android SDK Advanced Documentation
Advanced documentation for SpotX Android SDK

## Optional Ad Parameters
You may specify additional parameters to refine your ad request with SpotX. The values for the following parameters should adhere to the [OpenRTB API Specification 2.2](http://www.iab.com/wp-content/uploads/2015/06/OpenRTBAPISpecificationVersion2_2.pdf).

| Parameter | Description |
| --- | --- |
|app[cat]|A string of the [IAB content categories](/iab-categories) for the overall application. (e.g. `"IAB1"`)|
|app[privacypolicy]|Specifies whether the app has a privacy policy. `"1"` means there is a policy and `"0"` means there is not.|
|app[storeurl]|For QAG 1.5 compliance, an app store URL for an installed app should be passed in the bid request. (e.g. `"https://play.google.com/store/apps/details?id=com.mydomain.myapp"`)|
|app[content][language]|Language of the content. Use [alpha-2/ISO 639-1 codes](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) (e.g. `"en"`).|
|app[content][contentrating]|MPAA Content rating: `"G"`, `"PG"`, `"PG-13"`, `"R"`, `"NC-17"` |
|device[dnt]|If `"1"` then tracking is set to true, `"0"` for false. [Read more on how to set](#do-not-track)|


## Do Not Track
To respect the user's preferences of `Do Not Track` you can set the `device[dnt]` parameter to `"1"` to NOT track, and `"0"` to allow tracking. You can set `Do Not Track` by:

Include Google Ad Services in your application.  In Android Studio, you can add this dependency by adding the following
to the `build.gradle` file for your app.
```
compile 'com.google.android.gms:play-services-ads:+'
```

You must query Google Ad Services to get the status of the *limit tracking* property.  Unfortunately, the query will require
you to perform the operation on a background thread.  There are many ways to handle this type of operation, and your implementation
will depend on the design of your app.  Here is a simple example on how to obtain the *limit tracking* property.
```java
private boolean _isLimitTrackingEnabled = true;
private void queryLimitTrackingStatus() {
final Context context = this.getApplicationContext();

    // Unfortunately, the call to obtain the Advertising Info in Google Ad Services
    // must not be performed on the main thread
    new Thread(new Runnable() {
        @Override
        public void run() {
            try {
                AdvertisingIdClient.Info info = AdvertisingIdClient.getAdvertisingIdInfo(context);
                _isLimitTrackingEnabled = info.isLimitAdTrackingEnabled();
            } catch (IOException e) {
                e.printStackTrace();
            } catch (GooglePlayServicesNotAvailableException e) {
                e.printStackTrace();
            } catch (GooglePlayServicesRepairableException e) {
                e.printStackTrace();
            }
        }
    }).start();
}
```

Set the `device[dnt]` parameter using the SpotX ad builder, before loading your ads.

```java
String doNotTrack = _isLimitTrackingEnabled ? "1" : "0";
// doNotTrack = "1"  -  no tracking
// doNotTrack = "0"  -  tracking ok

SpotXAdBuilder adBuilder = SpotX.newAdBuilder(channelId);

// set the do not track parameter before loading ads
adBuilder.param("device[dnt]", doNotTrack);

// execute the ad load
Future<SpotXAdGroup> future = adBuilder.loadWithCount(1);
```
