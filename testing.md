# Testing

## Overview

This page gives a quick outline of how to test the Triptease integration on your website or booking engine.

### What do we need from you? 

You will need to have the ability to add our script via a tag manager or directly to your website or booking engine.

You will also need to be familiar with your browser's developer tools or automated testing tools.

### The script tag

Our bootstrap script has the ability to load without providing an `integration ID`, `client key` or `API key (hotel key)`. 
If another bootstrap script is later added with any of these values, the script will automatically use the new values. 
Multiple scripts will also automatically detect each other and only one script will actually load and run.

This is what the script should look like without any configuration:

```html
<script defer async crossorigin="anonymous" type="text/javascript"
src="https://onboard.triptease.io/bootstrap.js">
</script>
```

Our recommended way of getting this script onto your page is via a tag manager (e.g. GTM).

### Content-Security-Policy headers

If you are setting a Content-Security-Policy header, you will need to add `triptease.io *.triptease.io` to the `default-src` directive.

## Testing the integration

Once you have added the `script` tag (and if necessary updated your Content-Security-Policy header), you can test the integration by following these steps:
1. Verify the script loaded successfully by checking the network tab of your browser's developer tools. (Search for `triptease`)
2. Verify the existence of the `window.triptease` object in the browser console.
3. Once the script is loaded you should see the following `iframe` add to the `body` of the page:

```html
<iframe name="triptease.onboard.kernel" src="https://onboard.triptease.io/kernel/..." 
        style="display: none;" sandbox="allow-scripts allow-same-origin" title="blank" aria-hidden="true"></iframe>
```

NB: The `src` attribute has been abbreviated for brevity and will contain dynamic values (like version number etc)

4. Verify the `iframe` loaded successfully by checking the network tab of your browser's developer tools.

## Testing Specific Pages

If you wish to verify specific pages are being correctly detected this can be done as follows:

1. On a rooms and rates page (showing availability search results):
   1. Verify that `window.triptease.config.type` === `RoomsAndRates`
2. After making a test booking and viewing a confirmation page:
   1. Verify that `window.triptease.config.type` === `Confirmation`

## Testing Specific Products

If you wish to testing that a Triptease UI component or widget can load (like Price Check or a Nudge message), 
you will need to get in touch with Triptease so we can setup a test message for your specific environment. 
However if the above tests work this is not normally necessary as normally once the integration is working, 
Triptease can make changes their end to ensure the correct products are loaded.