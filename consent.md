# Consent Mode Guide

## What is Consent Mode?

Consent mode allows you to control what type of functionality is enabled across Triptease products. This in turn controls the 
usage of first and third party storage mechanisms of the browser and which Triptease products run.
If your site has a cookie/storage banner used for GDPR compliance, you can pass the user's consent to the Triptease script.

### What do you mean by Cookie or Storage?

In this document we will refer to storage to include cookies and any other web browser technology like localStorage or sessionStorage.
Triptease does not use browser fingerprinting or any other means that can not be controlled by the end user. 

## How do you change Consent Mode

It is as simple as setting the `data-storage-consent` attribute on the Triptease script tag. 

### Example:

```html
<script defer async crossorigin="anonymous" type="text/javascript"
        src="https://onboard.triptease.io/bootstrap.js?integrationId=REPLACE_ME"
        data-storage-consent="marketing">
</script>
```

The attribute can be set or updated and the Triptease script will automatically detect the change and make sure only the correct 
storage mechanisms are allowed and that the correct Triptease products are loaded. 

This attribute can have any of the following values: `none`, `essential`, `functionality`, `performance`, `marketing`, `all`

Multiple values can also be provided. e.g. `essential, functionality, performance` which would combine the applications allowed.

### Example:

```html
<script defer async crossorigin="anonymous" type="text/javascript"
        src="https://onboard.triptease.io/bootstrap.js?integrationId=REPLACE_ME"
        data-storage-consent="functionality, performance">
</script>
```

## What does each Consent Mode do?

### None

Storage consent `none` can be used *before* the user has given any explicit consent. No Triptease products will be run and no browser
storage or cookies will be used. If the user closes the browser and then reopens it, Triptease will treat it as two completely 
different users. In effect the browser is automatically forgetting any user when closed.

If the user then gives consent, the `data-storage-consent` attribute should be updated so that the Triptease script can then load the 
correct applications and allow storage access.

| First Party Storage | Third Party Storage | Applications |
|---------------------|---------------------|--------------|
| Denied              | Denied              | None         |



### Essential (strictly necessary)

If the user only gives `essential` or strictly necessary storage consent, then Triptease will actually treat this 
in exactly the same way as `none`. So no storage or applications will be allowed. 

We have taken this strict view to align with the [GDPR recommendation](https://gdpr.eu/cookies/) because a user would
still be able to complete a booking with or without Triptease products. This is the litmus test we use.

| First Party Storage | Third Party Storage | Applications |
|---------------------|---------------------|--------------|

| Denied              | Denied              | None         |

### Functionality (personalisation/preferences)

When `functionality` storage consent is present it will enable all Convert products such as Messages, Price Check and Chat. 

NB: Attract products will *not* be enabled as they are not providing any additional functionality 
from a user perspective.


| First Party Storage | Third Party Storage | Allowed Applications                              |
|---------------------|---------------------|---------------------------------------------------|
| Granted             | Granted             | Messages (including Price Check), Parity and Chat |

### Performance (statistics/analytics)

When `performance` storage consent is present it will enable products that are used to measure the performance
of your website and booking funnel.

NB: User facing Convert products will *not* be enabled 

| First Party Storage | Third Party Storage | Allowed Applications         |
|---------------------|---------------------|------------------------------|
| Granted             | Granted             | Parity, Meta and Paid Search |

### Marketing (advertising) or All 

When `marketing` or `all` storage consent is present it will enable all Triptease products.

| First Party Storage | Third Party Storage | Allowed Applications |
|---------------------|---------------------|----------------------|
| Granted             | Granted             | All                  |
