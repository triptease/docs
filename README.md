## Welcome to docs.triptease.io

### Overview

This page has all the information required to get you up and running with Triptease products as quickly and easily as possible.

#### What do we need from you? 

To integrate with Triptease we need a single script to be placed across the full funnel of your website.
It does not matter if the page is a brand.com page, or hotel vanity page, or hotel booking engine page - the same script works everywhere.


##### The script

The script for your integrationId

```html
<script>(function(a,t,b,c,d){c=a.createElement(t);c.src=b,c.defer=true,c.async=true,c.crossOrigin='anonymous';c.type="text/javascript";d=a.getElementsByTagName(t)[0];d.parentNode.insertBefore(c,d)})(document,"script","https://onboard.triptease.io/bootstrap.js?integrationId=XXX");</script>
```

Our recommended way of getting this script onto your page is via a tag manager (e.g. GTM).

#### What does the script do? 

The script performs the following tasks:
- Detects the current page and loads the correct script (i.e. on Synxis booking engine it loads the script capable of reading Synxis pages)  
- Identifies your brand and the hotel 
- Loads the correct products for your page
- Reads page specific data i.e. search & rate availability or booking information

#### What specific data do we read?

We read the following information
- Search & rate availability pages
    - Checkin, checkout, number of adults, number of children  
    - Room name, rate name, price
- Booking confirmation pages
    - Booking reference
    - Total price, room only price
- Guest’s location, browser and device information
- Hotel address

#### What data do we never read?

We never read any sensitive information such as:
- Guest details (first name, last name, address, email, telephone etc)
- Payment details (card number, expiry etc) 

For more information head over to our help section on [How Triptease Collects and Uses Data](https://help.triptease.com/en/collections/102136-getting-started#how-triptease-collects-and-uses-data).

#### What is the performance impact on my page?

We have specifically engineered our scripts to only load after all of your content has finished rendering and to never block the main thread.
You can use Google Lighthouse or [Page Speed Insights](https://developers.google.com/speed/pagespeed/insights/) to measure our impact.   

#### What happens if my booking engine is not supported?

If your booking engine is not supported, please reach out to us, and we may be able to integrate with your booking engine.
Alternatively, you can provide us the data we need using industry standard [Structured Data](https://structured-data.triptease.io/).
