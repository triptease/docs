# Consent Mode Guide

## What is Consent Mode?

It allows you to control what type of functionality is enabled across Triptease products. This in turn will control the 
usage of first and third party storage mechanisms of the browser and what Triptease products run.
If your site has a cookie/storage banner used for GDPR compliance, you can pass the user's consent on to the Triptease script.
If no consent is given the script will not run any Triptease products and no cookie/storage will be used so the user can know
that if they close the browser they will be forgotten and the next time they visit Triptease will think they are a completely new user.

### What do you mean by Cookie or Storage?

In this document we will refer to storage to include cookies and any other web browser technology like localStorage or sessionStorage.
Triptease does not use browser fingerprinting or any other means that can not be controlled by the end user. 

## How do you change Consent Mode

It's as simple as setting the `data-storage-consent` attribute on the Triptease script tag:

```html
<script defer async crossorigin="anonymous" type="text/javascript"
        src="https://onboard.triptease.io/bootstrap.js?integrationId=REPLACE_ME"
        data-storage-consent="none|essential,functionality,performance,marketing|all">
</script>
```

The attribute can be set or updated and the Triptease script will automatically detect the change and make sure only the correct 
storage mechanisms are allowed and that the correct Triptease products are loaded. 

This attribute can have any of the following values: `none`, `essential`, `functionality`, `performance`, `marketing`, `all`

Multiple values can also be provided. eg `essential, functionality, performance` which would combine the applications allowed.

## What does each Consent Mode do?

### None

Storage consent `none` can be used *before* the user has given any consent at all. No Triptease products will be run and no browser
storage or cookies will be used. If the user closes the browser and reopens then Triptease will think this has been done
by 2 completely different user/devices. In effect the browser is automatically forgetting this user/device when closed.

| First Party Storage | Third Party Storage | Applications |
|---------------------|---------------------|--------------|
| Denied              | Denied              | None         |



### Essential (strictly necessary)

If the user only gives essential or strictly necessary storage consent, then Triptease will actually treat this 
in exactly the same way as `none`. So no storage or applications will be allowed. 

We have taken this strict view to align with the [GDPR recommendation](https://gdpr.eu/cookies/) that only storage needed
for the functionality of the website be allowed and as a user can still make a booking without Triptease script running 
it must not be considered strictly necessary or essential.

| First Party Storage | Third Party Storage | Applications |
|---------------------|---------------------|--------------|
| Denied              | Denied              | None         |

### Functionality (personalisation/preferences)

When `functionality` storage consent is present it will enable all Convert related user functionality such as Messages, 
Price Check and Chat. 

NB: Attract related products will *not* be enabled as from a user perspective they are not providing any additional 
functionality to the user.


| First Party Storage | Third Party Storage | Allowed Applications                              |
|---------------------|---------------------|---------------------------------------------------|
| Granted             | Granted             | Messages (including Price Check), Parity and Chat |

### Performance (statistics/analytics)

When `performance` storage consent is present it will enable products that are used to measure the performance
of your website and booking funnel.

NB: User facing Convert products will *not* be enabled 

| First Party Storage | Third Party Storage | Allowed Applications        |
|---------------------|---------------------|-----------------------------|
| Granted             | Granted             | Party, Meta and Paid Search |

### Marketing (advertising) or All 

When `marketing` or `all` storage consent is present it will enable all Triptease products.

| First Party Storage | Third Party Storage | Allowed Applications |
|---------------------|---------------------|----------------------|
| Granted             | Granted             | All                  |

