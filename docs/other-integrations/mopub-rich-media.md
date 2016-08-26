SpotX can be integrated with MoPub's Rich Media creative via an EASI integration; this will allow an interstitial ad to be displayed and failover if no ad is returned.  This integration is intended to substitute SpotX's MoPub MRAID Creative for Android since MoPub does not support failover for MRAID interstitials, as described in [MoPub's documentation](http://dev.twitter.com/mopub/network-mediation/custom-network-best-practices). The following is needed to integrate SpotX's EASI with MoPub's Rich Media:

* CSS that centers the creative, [as provided by MoPub](http://dev.twitter.com/mopub-demand/creative-and-ad-formats/ad-markup-and-creative-best-practices)
* JavaScript that failsover if SpotX did not return an ad
* An EASI tag, [as provided by SpotX](https://www.spotxchange.com/tag-generator/)

To get started, follow MoPub's documentation to setup a [Rich Media Creative](https://dev.twitter.com/mopub/ui/rich-media-creative). In the body section of MoPub's Rich Media UI the centering CSS, failover JavaScript, and SpotX EASI tag; an Integration might look like: 

```
<head>
    <style type='text/css'>
        html,
        body {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
        }

        html {
            display: table;
        }

        body {
            display: table-cell;
            vertical-align: middle;
            padding: 20px;
            text-align: center;
            -webkit-text-size-adjust: none;
        }
    </style>
</head>

<body>
    <div id="spotxvideo"></div>
    <script type="text/javascript">
	    function failover(spotx_ad_found)  {
	        if(!spotx_ad_found)  {
	            loaded=true; 
	            window.location="mopub://failLoad"
	        }
	    }
    </script>
    <script type="text/javascript" 
    	src="http://search.spotxchange.com/js/spotx.js" 
    	data-spotx_channel_id="85394" 
    	data-spotx_ad_unit="incontent" 
    	data-spotx_ad_done_function="failover" 
    	data-spotx_content_container_id="spotxvideo" 
    	data-spotx_autoplay="1" 
    	data-spotx_ad_volume="0" 
    	data-spotx_content_width="" 
    	data-spotx_content_height="">
	</script>
</body>
```

It's important to note the following:

* Do not check MoPubs "MRAID Ad" box, otherwise the failover will not work on Android devices
* These fields are required and **must** be set exactly as shown:
    * data-spotx_ad_unit="incontent"
    * data-spotx_content_width=""
    * data-spotx_content_height=""

