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

Yes, the script can work with cookie banners.

We recommend that you communicate the guest's consent preferences to the Triptease script. We record the consent state your site passes to us, so processing stays within what the guest agreed. Please see [consent mode guide](/consent) for details.

### Is the script GDPR compliant?

Yes, the script is GDPR compliant provided you do one of the following:
1. Add the Triptease script all the time (prior to displaying the cookie banner, and regardless of consent chosen on the cookie banner) and communicate the guest's consent preferences to the Triptease script (see the [consent mode guide](/consent)); or
2. Add the Triptease script only when the guest has given consent to Marketing/Advertising or all cookies.

We advise against choosing option 2. See [why we advise against it](/cookie-banner).

### When should the script be added?

The script should be added as early as possible. It is designed to load asynchronously, which means it will not block the rendering of your page.

If the script has been set up to receive the guest's cookie choices (option 1 [above](#is-the-script-gdpr-compliant)), you don't need to wait for the guest to explicitly make a cookie choice before adding the script.

If you've chosen to add the script after the cookie banner (option 2 [above](#is-the-script-gdpr-compliant)), ensure that once the guest grants consent, the script is added immediately without requiring a page reload.

### Where should the script be placed?

The script should be placed towards the end of the `<body>` tag.

If your booking engine is in an iframe, the script should be placed in two places:
1. On the parent page, towards the end of the `<body>` tag
2. On the booking engine iframe, towards the end of the `<body>` tag

### How should your content security policy be changed?

If your site uses a Content-Security-Policy (CSP) header, ensure that `triptease.io *.triptease.io` is included in any relevant directives such as `default-src`, `script-src`, `frame-src`, and `connect-src`, depending on how your policy is structured.

This defines Triptease domain and subdomains as a trusted source for scripts and ensures that the Triptease script will not be blocked by the browser.

### Can you copy our script or use a fixed version instead?

No. Please use only the unversioned script we provide. This script is redirected (HTTP 307) to a versioned file that is cached for a year. We update our code many times a day, and this setup makes sure that whenever a browser is not using its cache, it always loads the most up-to-date version without you needing to do anything.

If you copy the script or hard-code a fixed version, it can fall out of sync with our other client-side scripts and server-side code, and the product may not work as expected.

### What does the script do?

The script performs the following tasks:
- Detects the current location in the funnel (group page, hotel page, search page or confirmation page)
- Loads the correct script for that location (e.g. on the booking engine it loads the script capable of reading search and confirmation pages)
- Identifies your group/brand and the specific hotel
- Loads the correct products for that page
- Reads page specific data (see below) and provides it to the loaded products

### What data do we read?

We read the following information (if available).

| Area                 | What we read                                                                       | Note                                                                        |
|----------------------|------------------------------------------------------------------------------------|-----------------------------------------------------------------------------|
| Identifiers          | Pseudonymous identifiers for the browser and for the session                       | Stored in a cookie or local storage once the guest has consented to storage |
|                      | IP address                                                                         | Masked before storage                                                       |
| Search query         | Check-in and check-out dates                                                       |                                                                             |
|                      | Number of adults and children                                                      |                                                                             |
|                      | Promotional or rate codes applied                                                  |                                                                             |
| Search results       | Room and rate names                                                                |                                                                             |
|                      | Price                                                                              |                                                                             |
| Booking confirmation | Booking reference and status                                                       |                                                                             |
|                      | Total price and room-only price                                                    |                                                                             |
|                      | Room and rate names                                                                |                                                                             |
| Guest's visit        | Pages viewed during the session, their titles, and the site the guest arrived from |                                                                             |
|                      | Advertising click identifiers and campaign tags on the URL                         |                                                                             |
|                      | Which links and buttons were clicked                                               |                                                                             |
|                      | Approximate location derived from the IP address                                   | City level                                                                  |
|                      | Browser, operating system, device type, screen size, time zone and language        |                                                                             |

### What data do we read only when you enable a feature?

We read these only after you set up the feature on the Triptease platform.

| What we read                                       | Feature               | Lawful basis and use                                                                           |
|----------------------------------------------------|-----------------------|------------------------------------------------------------------------------------------------|
| Email address                                      | Cart Abandonment      | Your legitimate interest in recovering the abandoned booking. Never used for general marketing |
| Email address, name, title, postal code, telephone | Data Capture messages | The guest's marketing consent, given in the message                                            |

### What data do we never read?

- Payment details: card number, expiry date, security code, cardholder name
- Form input, beyond the feature-specific items above
- Special categories under GDPR Article 9, such as health or religion

For the complete field-level list of what we store, see [Triptease Event Data](guest-event-data.html).

For more information head over to our help section on [How Triptease collects and uses data](https://help.triptease.com/en/collections/102136-getting-started#how-triptease-collects-and-uses-data).

### What is the performance impact on your page?

We have specifically engineered our scripts with the following principles in mind:
- Always load after all of your content has finished rendering
- Ensure everything is asynchronous and never blocks the main thread
- Only run the specific products required for your integration
- Cache as much as possible
- Always use HTTP/2 and HTTP/3
- Use GZIP and Brotli compression
- Automatically detect changes without expensive polling

You can use Google Lighthouse or [Page Speed Insights](https://developers.google.com/speed/pagespeed/insights/) to measure our impact.
Compare the score with and without our script.

### What happens if your booking engine is not supported?

If your booking engine is not supported, get in touch through the [contact form](https://www.triptease.com/en/contact), or email [customersuccess@triptease.com](mailto:customersuccess@triptease.com) if you are already a customer. We may be able to add support for it.
Alternatively, you can provide us the data we need using industry standard [Structured Data](/structured-data).

### Other resources

Additional information about the data we collect and how we use cookies can be found at:
- [Privacy Policy](https://www.triptease.com/en/privacy-policy)
- [Cookie Policy](https://www.triptease.com/en/cookie-policy)
