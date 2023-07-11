# Welcome to docs.triptease.io

## Overview

This page has all the information required to get you up and running with Triptease products as quickly and easily as possible.

### What do we need from you? 

To integrate with Triptease we need a single script to be placed across the full funnel of your website.
It does not matter if the page is a brand.com page, or hotel vanity page, or hotel booking engine page - the same script works everywhere.


#### Your script tag

```html
<script defer async crossorigin="anonymous" type="text/javascript"
src="https://onboard.triptease.io/bootstrap.js?integrationId=REPLACE_ME">
</script>
```

Our recommended way of getting this script onto your page is via a tag manager (e.g. GTM).

### Can the script work with cookie banners?

Yes, the script can work with cookie banners. Here are the available options:

1. Follow our [consent mode guide](/consent) to pass the user's cookie choices to the Triptease script.
2. If implementing the consent mode is not currently feasible for you (as it would require development work on your end), please contact Triptease. We can assess if your Consent Manager Provider is already supported or if we can add support.
3. Failing that, it is recommended to add the Triptease script only when the user has given consent to Marketing/Advertising or all cookies. 

We advise against choosing option 3. Please refer to the [cookie banner](/cookie-banner) for detailed information on why this option is not recommended.

### Is the script GDPR compliant?

Yes, the script is GDPR compliant, provided you have chosen one of the three options listed [above](#can-the-script-work-with-cookie-banners).

### When should the script be added?

The script should be added as early as possible. It is designed to load asynchronously, which means it will not block the rendering of your page.

If the script has been wired up to receive user's cookie choices (options 1 or 2 [above](#can-the-script-work-with-cookie-banners)), you don't need to wait for the user to explicitly make a cookie choice before adding the script.

If you have chosen option 3 [above](#can-the-script-work-with-cookie-banners), please ensure that a page reload is not required after the user has given consent for the script to be added.

### Where should the script be placed?

The script should be placed towards the end of the `<body>` tag.

If your booking engine is in an iframe, the script should be placed in two places:
1. On the parent page, towards the end of the `<body>` tag
2. On the booking engine iframe, towards the end of the `<body>` tag

### What does the script do? 

The script performs the following tasks:
- Detects the current location in the funnel (group page, hotel page, search page or confirmation page)
- Loads the correct script for that location (i.e. on the booking engine it loads the script capable of reading search and confirmation pages)  
- Identifies your group/brand and the specific hotel 
- Loads the correct products for that page
- Reads page specific data (see below) and provides it to the loaded products

### What data do we read?

We read the following information (if available)
- Search query
    - Checkin 
    - Checkout 
    - Number of adults 
    - Number of children
- Search results
    - Room and rate names
    - Price
- Booking confirmation pages
    - Booking reference
    - Total price 
    - Room only price
    - Room and rate names
- Guest’s information
    - IP address (always masked) 
    - Approximate Geo location (country/region) 
    - Browser and device information (from User Agent)
- Hotel information
    - Street
    - Postal Code
    - City
    - Country
    - Geolocation

### What data do we never read?

We never read any sensitive information such as:
- Guest details 
    - First / last name,
    - Address
    - Email (except when you have opted-in for Cart Abandonment feature)
    - Telephone etc
- Payment details 
    - Card number
    - Expiry etc

For more information head over to our help section on [How Triptease collects and uses data](https://help.triptease.com/en/collections/102136-getting-started#how-triptease-collects-and-uses-data).

### What is the performance impact on my page?

We have specifically engineered our scripts with following principles mind:
 - Always load after all of your content has finished rendering 
 - Ensure everything is asynchronous and never blocks the main thread. 
 - Only run the specific products required for your integration
 - Cache as much as possible
 - Always use HTTP2/3
 - Use GZIP and Brotli compression
 - Automatically detect changes without expensive polling
 
You can use Google Lighthouse or [Page Speed Insights](https://developers.google.com/speed/pagespeed/insights/) to measure our impact. 
You should see a minimal change in score with or without our script.

### What happens if my booking engine is not supported?

If your booking engine is not supported, please reach out to us, and we may be able to integrate with your booking engine.
Alternatively, you can provide us the data we need using industry standard [Structured Data](/structured-data).
