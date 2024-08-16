## Legacy Integration Guide

### Transitioning to Triptease-Owned Integrations

In the past, Triptease relied on our booking engine partners to provide the necessary information for integration. However, we now prefer to use Triptease-owned integrations. This approach is designed to eliminate any development effort on the part of the booking engine. Additionally, we aim to make the implementation process — such as adding the necessary scripts — as simple as possible for both the booking engine and the client.

While most of our integrations are now managed internally by Triptease, there are still a few cases where booking engines provide us with the required information. In these instances, we’ve transitioned to using structured data based on [Schema.org](https://schema.org/), an industry-standard format. If you prefer this route, our [documentation](https://docs.triptease.io/structured-data) offers clear guidance on how to develop this integration.

If you currently have a legacy integration, we encourage you to get in touch with us. We can either create a Triptease-owned integration for you or assist you in adopting the new structured data approach.

### Updating Triptease Domain (Optional)

Triptease scripts can be served from one of the following domains:

- **Current Domain:** `onboard.triptease.io`
- **Legacy Domains:**
    - `static.triptease.io`
    - `paperboy.triptease.net`
    - `widget.triptease.net`

If your script references one of the legacy domains, we recommend updating it to use the latest domain, `onboard.triptease.io`. To do this, simply replace the domain while **keeping the path and query parameters unchanged**.

This update is optional but helps align your integration with our current infrastructure, reducing the likelihood of future issues.

For example, if your current script looks like this:

```html
<script defer async crossorigin="anonymous" type="text/javascript"
src="https://paperboy.triptease.net/abc1234XYZ.js?hotelkey=123abc456def789ghi012jkl345mno678pqrs">
</script>
```

You should update it to:

```html
<script defer async crossorigin="anonymous" type="text/javascript"
src="https://onboard.triptease.io/abc1234XYZ.js?hotelkey=123abc456def789ghi012jkl345mno678pqrs">
</script>
```



