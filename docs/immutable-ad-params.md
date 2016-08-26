# Immutable Ad Parameters
By default SpotX will add certain parameters to a search request. If any of these parameters are set during integration then they will be replaced during search time.  These parameters are set so SpotX can further enhance the ad experience.

## Application Parameters
| Parameter | Description |
| --- | --- |
|app[ext][spotxsdk][ver]|The version of SpotX's SDK.|
|app[ext][spotxsdk][name]|The name of SpotX's SDK (e.g. spotx-sdk-android or spotx-sdk-ios).|
|app[name]|The name of the application using SpotX's SDK.|
|app[version]|The version of the application using SpotX's SDK.|
|app[bundle]|The bundle id of the application using SpotX's SDK.|
|app[uid]|A unique identifier derived from the advertiser id and specific to an app installation used for frequency capping and fraud detection.|

## Device Parameters
| Parameter | Description |
| --- | --- |
|device[os]|The OS the device is running.|
|device[osv]|The OS version the device is running.|
|device[make]|The make of the device.|
|device[model]|The model of the device.|
|device[geo][country]|The ISO-3 country code of the device.|
|device[ifa]|The device's advertising id.|
|device[lmt]|The device's limit ad tracking setting.|
|device[lang]|The ISO-639-1 language code of the device.|
|device[ua]|The user agent of the device as defined by the application's web view installation.|
|device[geo][lon]|The longitude of the device's location, set if the user allows the app access to their location service.|
|device[geo][lat]|The latitude of the device's location, set if the user allows the app access to their location service.|
|device[connectiontype]| A numerical identifier that denotes if a device is on a cellular network or wifi. This parameter will only be set if the user allows the app access to their network state.|
|device[carrier]|The carrier the device is using, this parameter will be empty if the user does not allow the app to access their telephony service.|

!!! note
The parameters `app[uid]` can be reset by resetting the advertiser id. Here are instructions on how to do this for iOS and Android:

### iOS
1. Go to Settings > Privacy
2. Scroll to and select "Advertising"
3. Click "Reset Advertising Identifier..."

### Android
1. Open "Google Settings". This can be found in one of two places:
    * "Google Settings" application
    * Settings > Google
2. Scroll to and select "Ads"
3. Click "Reset advertising ID"