# Consent Mode Guide

## What is Consent Mode?

Consent mode allows you to control what type of functionality is enabled across Triptease products. This in turn controls the 
usage of first and third party storage mechanisms of the browser and which Triptease products run.
If your site has a cookie/storage banner used for GDPR compliance, you can pass the user's choices to the Triptease script.

## How do you provide Consent Mode?

It is as simple as setting the `data-storage-consent` attribute on the Triptease script tag. 
Note that the value should not be hardcoded in your HTML (or Tag Manager etc.) but should be based on the user's choices on the cookie banner.  

#### Example:

```html
<script defer async crossorigin="anonymous" type="text/javascript"
        src="https://onboard.triptease.io/bootstrap.js?integrationId=REPLACE_ME"
        data-storage-consent="marketing">
</script>
```

The attribute can be set or updated. Triptease script will automatically detect a change in the attribute and ensure that the storage mechanisms used and products loaded are as per the updated value. 

This attribute can have any of the following values: `none`, `essential`, `functionality`, `performance`, `marketing`, `all`

Multiple values can also be provided. e.g. `essential, functionality, performance` which would combine the applications allowed.

#### Example:

```html
<script defer async crossorigin="anonymous" type="text/javascript"
        src="https://onboard.triptease.io/bootstrap.js?integrationId=REPLACE_ME"
        data-storage-consent="functionality, performance">
</script>
```

## How do you map your user's cookie choices to the consent modes?

We have listed the terms typically used in cookie banners, grouping the common aliases together, in the table below. Please use this as a guide.   

| Chosen on Cookie Banner                       | Consent Mode to Use |
|-----------------------------------------------|---------------------|
| Deny                                          | `none`              |
| Essential / Necessary                         | `essential`         |
| Functionality / Personalisation / Preferences | `functionality`     |
| Performance / Statistics / Analytics          | `performance`       |
| Marketing / Advertising                       | `marketing`         |
| Allow All                                     | `all`               |

Here is a typical example of a cookie banner where the user has selected Necessary, Preferences and Statistics.
You would provide `data-storage-consent="essential, functionality, performance"` in this scenario.  

![cookie-banner-example.png](assets/images/cookie-banner-example.png)

## What is the default behaviour?

If `data-storage-consent` attribute has not been set we assume the consent mode is `all`. We consider the addition of our script to be implicit consent in this case.

## What does each Consent Mode do?

### None

Storage consent `none` can be used *before* the user has given any explicit consent. No Triptease products will be run and no persistent 
browser storage or cookies will be used. If the user closes the browser and then reopens it, Triptease will treat it as two completely 
different users. In effect the browser is automatically forgetting any user when closed.

If the user then gives consent, the `data-storage-consent` attribute should be updated so that the Triptease script can then load the 
correct applications and allow storage access.

| First Party Storage | Third Party Storage | Applications |
|---------------------|---------------------|--------------|
| Denied              | Denied              | None         |

#### Example:

```html
<script ...
        data-storage-consent="none">
</script>
```


### Essential (strictly necessary)

If the user only gives `essential` or strictly necessary storage consent, then Triptease will actually treat this 
in exactly the same way as `none`. So no storage or applications will be allowed. 

We have taken this strict view to align with the [GDPR recommendation](https://gdpr.eu/cookies/) because the litmus test is 
"_Can a user complete a booking journey without Triptease products?_".

| First Party Storage | Third Party Storage | Applications |
|---------------------|---------------------|--------------|
| Denied              | Denied              | None         |

#### Example:

```html
<script ...
        data-storage-consent="essential">
</script>
```

### Functionality (personalisation/preferences)

When `functionality` storage consent is present it will enable all Convert products such as Messages, Price Check and Chat. 

NB: Attract products will *not* be enabled as they are not providing any additional functionality 
from a user perspective.


| First Party Storage | Third Party Storage | Allowed Applications                              |
|---------------------|---------------------|---------------------------------------------------|
| Granted             | Granted             | Messages (including Price Check), Parity and Chat |

#### Example:

```html
<script ...
        data-storage-consent="functionality">
</script>
```


### Performance (statistics/analytics)

When `performance` storage consent is present it will enable products that are used to measure the performance
of your website and booking funnel.

NB: User facing Convert products will *not* be enabled 

| First Party Storage | Third Party Storage | Allowed Applications         |
|---------------------|---------------------|------------------------------|
| Granted             | Granted             | Parity, Meta and Paid Search |

#### Example:

```html
<script ...
        data-storage-consent="performance">
</script>
```

### Marketing (advertising) or All 

When `marketing` or `all` storage consent is present it will enable all Triptease products.

| First Party Storage | Third Party Storage | Allowed Applications |
|---------------------|---------------------|----------------------|
| Granted             | Granted             | All                  |

#### Example:

```html
<script ...
        data-storage-consent="marketing">
</script>
```

### What do we mean by Cookie or Storage?

In this document we will refer to storage to include cookies and any other web browser technology like localStorage or sessionStorage.
Triptease does not use browser fingerprinting or any other means that cannot be controlled by the end user.
