# SpotX Android SDK Advanced Documentation
Advanced documentation for SpotX Android SDK

## Optional Ad Parameters
You may specify additional parameters to refine your ad request with SpotX. The values for the following parameters should adhere to the [OpenRTB API Specification 2.2](http://www.iab.com/wp-content/uploads/2015/06/OpenRTBAPISpecificationVersion2_2.pdf).

| Parameter | Description |
| --- | --- |
|app[cat]|Array of IAB content categories for the overall application.|
|app[privacypolicy]|Specifies whether the app has a privacy policy. “1” means there is a policy and “0” means there is not.|
|app[storeurl]|For QAG 1.5 compliance, an app store URL for an installed app should be passed in the bid request.|
|app[content][language]|Language of the content. Use alpha-2/ISO 639-1 codes.|
|app[content][contentrating]|Content rating (e.g., MPAA)|
|device[dnt]|If "1", then tracking is set to true, "0" for false.|
