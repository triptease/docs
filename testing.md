# Testing

## Overview

This page outlines how to test the Triptease integration on your website or booking engine.

### Requirements

To complete the testing, you will need:

- The ability to add our script via a tag manager or directly to your website or booking engine.
- Familiarity with your browser's developer tools or automated testing tools.

### The script tag

Our bootstrap script can load without an integration ID, client key, or API key (hotel key). 
If another bootstrap script is later added with any of these values, the script will automatically use the new values. 
Multiple scripts will detect each other, ensuring that only one script loads and runs.

Here’s the script without any configuration:

```html
<script defer async crossorigin="anonymous" type="text/javascript"
src="https://onboard.triptease.io/bootstrap.js">
</script>
```

We recommend adding this script via a tag manager (e.g. GTM).

### Content-Security-Policy headers

If your site uses a Content-Security-Policy (CSP) header, ensure that `triptease.io *.triptease.io` is included in any relevant directives such as `default-src`, `script-src`, `frame-src`, and `connect-src`, depending on how your policy is structured.

## Testing the integration

You can test the integration by following these steps:
1. Verify the script loaded successfully by checking for `triptease` in the network tab of your browser's developer tools.
2. Verify the existence of `window.triptease` object in the browser console.
3. Verify the following iframe was added to the page’s `<body>`.
4. Verify the iframe loaded successfully by checking for `kernel` in the network tab of your browser's developer tools.

```html
<iframe name="triptease.onboard.kernel" src="https://onboard.triptease.io/kernel/..."
style="display: none;" sandbox="allow-scripts allow-same-origin" title="blank" aria-hidden="true"></iframe>
```
NB: The `src` attribute has been abbreviated for brevity and will contain dynamic values (like version number etc.).

## Testing Hotel Identification on Hotel Specific Pages

On a hotel specific page, check that `window.triptease.config.hotelName` is the expected hotel name. 

## Testing Specific Pages

If you wish to verify specific pages are being correctly detected this can be done as follows:

1. On a rooms and rates page (showing availability search results) verify that `window.triptease.config.type` is `RoomsAndRates`.
2. After making a test booking, on the booking confirmation page verify that `window.triptease.config.type` is `Confirmation`.

## Testing Messages

To test whether a Triptease Message (e.g. Price Check) loads correctly:
* Ensure the integration is set up properly and passes the previous tests. Triptease can then enable the necessary message without further action on your end.
* If you need to validate a message, contact Triptease to arrange a test message for your environment.