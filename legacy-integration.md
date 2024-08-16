## Legacy Integration Guide

In the past, Triptease relied on our booking engine partners to provide the necessary information for integration. However, we now prefer to use Triptease-owned integrations. This approach is designed to eliminate any development effort on the part of the booking engine.

While most of our integrations are now Triptease-owned, there are still a few cases where booking engines provide us with the required information. In these instances, we’ve transitioned to using structured data based on [Schema.org](https://schema.org/), an industry-standard format. If you prefer this route, our [structured-data](https://docs.triptease.io/structured-data) documentation offers clear guidance on how to develop this integration.

If you currently have a legacy integration, we encourage you to get in touch with us. We can either create a Triptease-owned integration for you or assist you in adopting the new structured data approach.

Our new integration method also simplifies the process of adding scripts, as the same script works seamlessly across your entire website. You no longer need to provide a hotel key (API key), as we can automatically identify the hotel.

You can find more details about our standard integration method in our [documentation](https://docs.triptease.io/).

The rest of this guide is relevant if you continue to use a legacy integration.

### Providing Rooms and Rates Information

1. Add a script to your rooms and rates page as follows:

```html
<script defer async crossorigin="anonymous" type="text/javascript"
        src="https://onboard.triptease.io/bootstrap.js?integrationId=REPLACE_ME">
</script>
```
replacing the following value:
- **REPLACE_ME**: The integration ID specific to the hotel group.  


2. Add a `price-fighter-widget` div to your rooms and rates page as follows:

```html
<div class="price-fighter-widget"
    data-pf-hotelkey="HOTEL_KEY" 
    data-pf-language="LANGUAGE"
    data-pf-checkin="CHECKIN" 
    data-pf-checkout="CHECKOUT"
    data-pf-adults="ADULTS"
    data-pf-children="CHILDREN"
    data-pf-rooms="ROOMS"
    data-pf-room-type="ROOM_NAME"
    data-pf-room-rate="RATE_NAME"
    data-pf-direct-price="PRICE"
    data-pf-currency="CURRENCY"
    data-pf-total="TOTAL_CONFIG">
</div>
```

replacing the following values:
- **HOTEL_KEY**: This is the API key for the hotel provided by Triptease (optional).
- **LANGUAGE**: The ISO 639-1 language code for the page, example "en".
- **CHECKIN**: The check-in date as per the search, example "2024-08-15".
- **CHECKOUT**: The check-out date as per the search, example "2024-08-17".
- **ADULTS**: Number of adults as per the search, example "2".
- **CHILDREN**: Number of children as per the search, example "1".
- **ROOMS**: Number of rooms as per the search, example "1".
- **ROOM_NAME**: The room name for the cheapest room, example "Deluxe Double".
- **RATE_NAME**: The rate name for the cheapest rate of the cheapest room, example "Best Available Rate".
- **PRICE**: The price for the cheapest rate of the cheapest room (without a currency), example "79.99".
- **CURRENCY**: The ISO 4217 currency code corresponding to the price, example "USD".
- **TOTAL_CONFIG**: "false" if the price is for one night; "true" if the price is for the entire stay.

These values should be dynamic and update when the user changes their search.

If your booking engine supports multi-room searches, be careful to avoid a situation where the price you provide does not correspond to the search parameters (adults, children, rooms) you provide. In such cases, it's recommended that you do not include the price-fighter-widget div. 

When the guest navigates to a different page, the `price-fighter-widget` div should be removed to prevent the price check message from appearing on the wrong page.

### Providing Confirmation Information

Add a script to your booking confirmation page as described below:

```html
<script defer async crossorigin="anonymous" type="text/javascript"
        src="https://onboard.triptease.io/bootstrap.js?integrationId=REPLACE_ME&bookingValue=VALUE&bookingCurrency=CURRENCY&bookingReference=REFERENCE">
</script>
```

replacing the following values:
- **REPLACE_ME**: The integration ID specific to the hotel group.
- **VALUE**: The total value of the booking, inclusive of all taxes and fees.
- **CURRENCY**: The currency corresponding to the booking value.
- **REFERENCE**: The reference number for the booking.

When the guest navigates away from the booking confirmation page, the query parameters `bookingValue`, `bookingCurrency`, and `bookingReference` should be removed; otherwise, the page may incorrectly be considered a booking confirmation page.