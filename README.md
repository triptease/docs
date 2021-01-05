## Welcome to docs.triptease.io

### Overview

This page has all the information required to get you up and running with Triptease products as quickly and easily as possible.

#### What do we need from you? 

To integrate with Triptease we need a single script to be placed across the full funnel of your website.
It does not matter if the page is a brand.com page, or hotel vanity page, or hotel booking engine page - the same script works everywhere.


##### Your script tag

```html
<script defer async crossorigin="anonymous" type="text/javascript"
src="https://onboard.triptease.io/bootstrap.js">
</script>
```

Our recommended way of getting this script onto your page is via a tag manager (e.g. GTM).

#### What does the script do? 

The script performs the following tasks:
- Detects the current page and loads the correct script (i.e. on Synxis booking engine it loads the script capable of reading Synxis pages)  
- Identifies your brand and the hotel 
- Loads the correct products for your page
- Reads page specific data i.e. search & rate availability or booking information

#### What specific data do we read?

We read the following information (if available)
- Search query
    - Checkin, 
    - Checkout, 
    - Number of adults, 
    - Number of children
- Search results
    - Room and rate names
    - Price
- Booking confirmation pages
    - Booking reference
    - Total price, 
    - Room only price
    - Room and rate names
- Guest’s information
    - IP address (always masked), 
    - Approximate Geo location (country/region), 
    - Browser and device information (from User Agent)
- Hotel information
    - Street
    - Postal Code
    - City
    - Country
    - Geo location

#### What data do we never read?

We never read any sensitive information such as:
- Guest details 
    - First name, last name,
    - Address, 
    - Email, 
    - Telephone etc
- Payment details 
    - Card number, 
    - Expiry etc

For more information head over to our help section on [How Triptease Collects and Uses Data](https://help.triptease.com/en/collections/102136-getting-started#how-triptease-collects-and-uses-data).

#### What is the performance impact on my page?

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

#### What happens if my booking engine is not supported?

If your booking engine is not supported, please reach out to us, and we may be able to integrate with your booking engine.
Alternatively, you can provide us the data we need using industry standard [Structured Data](https://structured-data.triptease.io/).
