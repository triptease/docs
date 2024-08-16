## Legacy Integration Guide

In the past, Triptease relied on our booking engine partners to provide the necessary information for integration. However, we now prefer to use Triptease-owned integrations. This approach is designed to eliminate any development effort on the part of the booking engine. Additionally, we aim to make the implementation process (adding the script) as simple as possible for both the booking engine and the client.

While most of our integrations are now managed internally by Triptease, there are still a few cases where booking engines provide us with the required information. In these instances, we’ve transitioned to using structured data based on [Schema.org](https://schema.org/), an industry-standard format. If you prefer this route, our [documentation](https://docs.triptease.io/structured-data) offers clear guidance on how to develop this integration.

If you currently have a legacy integration, we encourage you to get in touch with us. We can either create a Triptease-owned integration for you or assist you in adopting the new structured data approach.

### Providing Search, Rooms and Rates information 



### Providing Confirmation information

Add a script to your booking confirmation page as described below:

```javascript
<script defer async crossorigin="anonymous" type="text/javascript"
        src="https://onboard.triptease.io/bootstrap.js?integrationId=INTEGRATION_ID&bookingValue=VALUE&bookingCurrency=CURRENCY&bookingReference=REFERENCE">
</script>
```

replacing the following values:
* INTEGRATION_ID - Integration id specific to the hotel group
* VALUE - Value of the booking inclusive of all taxes, fees etc.
* CURRENCY - Currency corresponding to the value
* REFERENCE - Reference for the booking