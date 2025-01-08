## Structured Data Guide

### Overview

[Schema.org](http://schema.org/) contains a rich vocabulary that can be used to help tools read and understand web pages in wide number of domains.
This page details the markup that can be added to a hotel website for the benefit of not only Triptease products but also your SEO and Google listings.

If you notice anything wrong please raise an [issue](https://github.com/triptease/structured-data/issues).

### Microdata vs RDFa vs JSON-LD

If the markup is static (like your hotel name and address) then JSON-LD is generally the easiest to test and debug, while if the meta data is more dynamic (like offers or rate details)
you may want to use the microdata format embedded in the HTML so that you keep the UI in sync with the meta data.

Triptease supports all three formats so if you are already using one then don’t worry about switching.

### Handling data updates

If you are an SPA (Single Page App) or support multiple updates on the same page (i.e. searches), please update the HTML/JSON in place. Do NOT keep adding additional elements as this will just corrupt the data.

### Validating your code

You can use [schema.org's validator](https://validator.schema.org) to check the output of your structured data and fix any errors.

A common error to watch out for is trailing commas in JSON-LD.

### Getting started

There are different kinds of meta-data required for different parts of your booking funnel. The diagram below explains which parts are required for each stage.

![structured-data-overview](assets/images/structured-data-overview.png)

* [Application details](#application-details)
* [Identification](#identification)
* [Lodging Search](#lodging-search)
* [Offers for Hotel Rooms](#offers-for-hotel-rooms)
* [No availability](#no-availability)
* [Reservation](#reservation)

### Identification

*If you are already using another form of identification (apiKeys, property codes etc.) then you can safely skip this step*

This is the simplest and most important meta-data you can add throughout your marketing website and booking engine. Ideally you want this on every page that represents a single hotel.
Doing this will automatically allow your hotel to appear on Google search pages and Google Maps. Just putting the hotel name and @type on each page will help Triptease identify your hotel automatically.

#### JSON-LD Example

```html
<script type="application/ld+json">
{
 "@context": "http://schema.org",
 "@type": "Hotel",
 "name": "Sea View Hotel",
 "identifier": "1234567",
 "brand": "Great Escapes",
 "address": 
  {
  "@type": "PostalAddress",
  "streetAddress": "1 Piccadilly",
  "addressLocality": "St. James's",
  "addressRegion": "London",
  "postalCode": "W1 9B",
  "addressCountry": "United Kingdom"
  },
  "geo": {
      "@type": "GeoCoordinates",
      "latitude": "15.234",
      "longitude": "-80.3242"
  },
 "telephone": "+44 1234 5678",
 "image": "http://example.com/image.png",
 "url": "http://example.com/"
}
</script>
```

#### Microdata Example

```html
<div itemscope itemtype="http://schema.org/Hotel">
    <h1 itemprop="name">Sea View Hotel</h1>
    <span itemprop="identifier">123456</span>
    <h2 itemprop="brand">Great Escapes</h1>
    <div itemprop="address" itemscope itemtype="http://schema.org/PostalAddress">
        <span itemprop="streetAddress">1 Piccadilly</span>
        <span itemprop="addressLocality">St. James's</span>
        <span itemprop="addressRegion">London</span>
        <span itemprop="postalCode">W1 9B</span>
        <span itemprop="addressCountry">United Kingdom</span>
    </div>
     <div itemprop="geo" itemscope itemtype="http://schema.org/GeoCoordinates">
        latitude:<span itemprop="latitude">15.234</span>, 
        longitude:<span itemprop="longitude">-80.3242</span>
    </div>
 <div>Telephone: <span itemprop="telephone">+44 1234 5678</span></div>
 <div>
    <a href="http://example.com/" itemprop="url">
        <img itemprop="image" src="http://example.com/image.png"/>
    </a>
 </div>
</div>
```

Let's walk through this:

#### @type

Make sure you set this to [Hotel](https://schema.org/Hotel), [LodgingBusiness](https://schema.org/LodgingBusiness) or [BedAndBreakfast](https://schema.org/BedAndBreakfast) rather than the more generic [WebSite](https://schema.org/WebSite), [LocalBusiness](https://schema.org/LocalBusiness) or [Organization](https://schema.org/Organization).
(Use Organization in a separate metadata block to describe your parent organisation or group if needed)

*Used by: Google, Triptease*

#### name

The [name](https://schema.org/name) should be a unique name within your group or brand.

*Used by: Google, Triptease*

#### identifier (Optional)

The [identifier](https://schema.org/identifier) should be a unique property code for your hotel.

*Used by: Triptease*

#### brand (Optional)

The [brand](https://schema.org/brand) can help Triptease group your hotels together.

*Used by: Triptease*

#### address (Optional)

The [address](https://schema.org/address) allows Triptease and Google to correctly associate your Hotel with it's location. At a minimum add the [postalCode](https://schema.org/postalCode) and [addressCountry](https://schema.org/addressCountry).

*Used by: Google, Triptease*

#### geo (Optional)

The [geo](https://schema.org/geo) allows Triptease and Google to accurately display your Hotel  on a map.

*Used by: Google, Triptease*

#### telephone (Optional)

The [telephone](https://schema.org/telephone) will allow Google to correctly list your contact details

*Used by: Google*

#### url (Optional)

The [url](https://schema.org/url) will allow Triptease and Google to link to your hotel home page.

*Used by: Google, Triptease*

#### image (Optional)

The [image](https://schema.org/image) will allow Google (Search and Maps) to display a thumbnail image next to your name

*Used by: Google*




### Reservation

After identifying the hotel, the next-most important data you can provide is the reservation information after a customer completes their booking. If you support multi room booking just repeat the script tag  or itemScope root element (use an array in JSON-LD).

*Used by: Triptease*

#### JSON-LD Example

```html
<script type="application/ld+json">
{
  "@context": "http://schema.org",
  "@type": "LodgingReservation",
  "reservationId": "abc456",
  "reservationStatus": "http://schema.org/ReservationConfirmed",
  "checkinTime": "2017-04-11T16:00:00-00:00",
  "checkoutTime": "2017-04-13T11:00:00-00:00",
  "totalPrice": "800.00",
  "basePrice": "750.00",
  "priceCurrency": "GBP",
  "offerCode": ["AA"],
  "provider": {
    "@type": "Hotel",
    "name": "Sea View Hotel",
    "identifier": "1234567",
    "brand": "Great Escapes"
  }
}
</script>
```

#### Microdata Example

```html
<div itemscope itemtype="http://schema.org/LodgingReservation">
    <h1>Reservation #<span itemprop="reservationId">abc456</span></h1>
    <h2>Details</h2>
    <dl>
        <dt>Status</dt>
        <dd itemprop="reservationStatus" content="http://schema.org/ReservationConfirmed">Confirmed</dd>
        <dt>Checkin</dt>
        <dd itemprop="checkinTime" content="2017-04-11T16:00:00-00:00">On 11th April from 4pm</dd>
        <dt>Checkout</dt>
        <dd itemprop="checkoutTime" content="2017-04-13T11:00:00-00:00">On 13th April by 11am</dd>
        <dt>Total</dt>
        <dd><span itemprop="totalPrice">800.00</span> <span itemprop="priceCurrency">GBP</span></dd>
        <dd><span itemprop="basePrice">750.00</span> <span>GBP</span></dd>
        <dt>Promotion/Discount</dt>
        <dd><span itemprop="offerCode"/>AA</span></dd>
    </dl>
    <div itemprop="provider" itemscope itemtype="http://schema.org/Hotel">
        <span itemprop="name">Sea View Hotel</span>
        <meta itemprop="identifier" content="8901234">
        <div itemprop="address" itemscope itemtype="http://schema.org/PostalAddress">
            <span itemprop="streetAddress">1 Piccadilly</span>
            <span itemprop="addressLocality">St. James's</span>
            <span itemprop="addressRegion">London</span>
            <span itemprop="postalCode">W1 9B</span>
            <span itemprop="addressCountry">United Kingdom</span>
        </div>
        <span itemprop="telephone">+44 1234 5678</span>
    </div>
</div>
```

Let's walk through this:

#### @type

Set this to [LodgingReservation](https://schema.org/LodgingReservation)

#### reservationId

The [reservationId](https://schema.org/reservationId) should be unique and verifiable.

#### reservationStatus

The [reservationStatus](https://schema.org/reservationStatus) should be set to [ReservationConfirmed](https://schema.org/ReservationConfirmed).
If you wish to expose reservations earlier in the funnel then make sure you use one of the other [ReservationStatusType](https://schema.org/ReservationStatusType). If you support cancellations please also add the correct structured data to that page and change the [reservationStatus](https://schema.org/reservationStatus) to [ReservationCancelled](https://schema.org/ReservationCancelled)

#### checkinTime

Triptease requires [checkinTime](https://schema.org/checkinTime) to be a date in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format without time or timezone e.g. `2021-10-12`.
NB: This deviates from the specification as we have consistently seen incorrect dates provided due to timezone adjustments. Any time or timezone will be ignored.

#### checkoutTime

Triptease requires [checkoutTime](https://schema.org/checkoutTime) to be a date in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format without time or timezone e.g. `2021-10-13`.
NB: This deviates from the specification as we have consistently seen incorrect dates provided due to timezone adjustments. Any time or timezone will be ignored.

#### totalPrice

The [totalPrice](https://schema.org/totalPrice) is the total price for the duration of the stay *including* taxes etc. It does not include the currency symbol.

#### basePrice (Optional)

The basePrice is the base price for the duration of the stay *excluding* taxes etc. It does not include the currency symbol.

#### priceCurrency

The [priceCurrency](https://schema.org/priceCurrency) is the three digit ISO currency code.

#### offerCode (Optional)

Offer can either be a string or array of strings. It should be used any time the offers have been filtered or the price changed due
to the user apply any of the following: promo/discount/group/corporation/government/agency/rate/room code.

**A Triptease extension*

#### provider (Optional)

The [provider](https://schema.org/provider) field should be set to the [Hotel](https://schema.org/Hotel), [LodgingBusiness](https://schema.org/LodgingBusiness) or [BedAndBreakfast](https://schema.org/BedAndBreakfast) to which the individual reservation applies.
> When not provided, it defaults to the hotel in [Identification](#identification) section.


### Lodging Search

*Used by: Triptease*

These are the parameters the customer searched with. [schema.org](http://www.schema.org/) does not directly model these concepts so TripTease has made a small extension to capture
these additional parameters while trying to keep to the same naming conventions and domain language.

#### JSON-LD Example

```html
<script type="application/ld+json">
{
  "@context": "https://structured-data.triptease.io",
  "@type": "LodgingSearch",
  "checkinTime": "2017-04-11T12:00:00-00:00",
  "checkoutTime": "2017-04-13T12:00:00-00:00",
  "numAdults": "2",
  "numChildren": "0",
  "numRooms": "1",
  "offerCode": ["AA"] 
}
</script>
```

#### Microdata Example

```html
<div itemscope itemtype="https://structured-data.triptease.io/LodgingSearch">
    <meta itemprop="checkinTime" content="2017-04-11T12:00:00-00:00"/>
    <meta itemprop="checkoutTime" content="2017-04-13T12:00:00-00:00"/>
    <meta itemprop="numAdults"  content="2"/>
    <meta itemprop="numChildren" content="0"/>
    <meta itemprop="numRooms" content="1"/>
    <meta itemprop="offerCode" content="AA"/>
</div>
```

Let's walk through this:

#### @context

Set this to https://structured-data.triptease.io

#### @type

Set this to LodgingSearch*

#### checkinTime

Triptease requires [checkinTime](https://schema.org/checkinTime) to be a date in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format without time or timezone e.g. `2021-10-12`.
NB: This deviates from the specification as we have consistently seen incorrect dates provided due to timezone adjustments. Any time or timezone will be ignored.

#### checkoutTime

Triptease requires [checkoutTime](https://schema.org/checkoutTime) to be a date in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format without time or timezone e.g. `2021-10-13`.
NB: This deviates from the specification as we have consistently seen incorrect dates provided due to timezone adjustments. Any time or timezone will be ignored.

#### numAdults (Optional)

The [numAdults](https://schema.org/numAdults) is the total number of adults that were searched for. Defaults to 2

#### numChildren (Optional)

The [numChildren](https://schema.org/numChildren) is the total number of children that were searched for. Defaults to 0

#### numRooms (Optional)

The numRooms* is the total number of rooms that were searched for. Defaults to 1

> `numRooms` should not be present unless the search results could show a different price to what a guest would pay if they were only booking one room (e.g. a user searches for 3 rooms and the prices displayed are for the total of all 3 rooms) 

#### offerCode (Optional)

Offer can either be a string or array of strings. It should be used any time the offers have been filtered or the price changed due 
to the user apply any of the following: promo/discount/group/corporation/government/agency/rate/room code.

**A Triptease extension*


### Offers for Hotel Rooms

*Used by: Triptease*

These are the offer or rooms and rates the hotel has available for the specified search parameters.
[schema.org](http://www.schema.org/) models this around [offers](http://schema.org/Offer) for [hotel rooms](http://schema.org/HotelRoom). This image explains the concept:

![Schema Diagram showing the relationship between entities](https://schema.org/docs/schema_hotels_1.png)

Multiple offers can be added to a page either inside a single script tag containing an array or multiple script/div tags etc.

#### JSON-LD Example

```html
<script type="application/ld+json">
[
  {
    "@context": "http://schema.org/",
    "@type": "Offer",
    "itemOffered": {
      "@type": "HotelRoom",
      "name": "Deluxe Double",
      "identifier": "DD-001"
    },
    "name": "Best Available Rate",
    "identifier": "BAR-001",
    "priceSpecification": {
      "@type": "UnitPriceSpecification",
      "price": "99.00",
      "priceCurrency": "USD",
      "unitText": "Nightly"
    },
    "offeredBy": {
      "@type": "Hotel",
      "name": "Sea View Hotel",
      "identifier": "1234567",
      "brand": "Great Escapes"
    }
  },
  {
    "@context": "http://schema.org/",
    "@type": "Offer",
    "itemOffered": {
      "@type": "HotelRoom",
      "name": "Deluxe Double",
      "identifier": "DD-001"
    },
    "name": "Member Rate",
    "identifier": "MER-001",
    "priceSpecification": {
      "@type": "UnitPriceSpecification",
      "price": "88.00",
      "priceCurrency": "USD",
      "unitText": "Nightly"
    },
    "offeredBy": {
      "@type": "Hotel",
      "name": "Garden View Hotel",
      "identifier": "8901234",
      "brand": "Great Escapes"
    }
  }
]
</script>
```

#### Microdata Example

```html
<div itemscope itemtype="http://schema.org/Offer">
  <div itemprop="itemOffered" itemscope itemtype="http://schema.org/HotelRoom">
      <span itemprop="name">Deluxe Double</span>
      <meta itemprop="identifier" content="DD-001">
  </div>
  <span itemprop="name">Best Available Rate</span>
  <meta itemprop="identifier" content="BAR-001">
  <span itemprop="priceSpecification" itemscope itemtype="http://schema.org/UnitPriceSpecification">
    <meta itemprop="price" content="99.00">$99.00
    <meta itemprop="priceCurrency" content="USD">
    <meta itemprop="unitText" content="Nightly">per night
  </span>
  <span itemprop="offeredBy" itemscope itemtype="http://schema.org/Hotel">
    <span itemprop="name">Sea View Hotel</span>
    <meta itemprop="identifier" content="123456">
    <span itemprop="brand">Great Escapes</span>
  </span>
</div>
```

Let's walk through this:

#### @type

Set this to [Offer](http://schema.org/Offer)

#### itemOffered

The [itemOffered](https://schema.org/itemOffered) should link to a [HotelRoom](https://schema.org/HotelRoom) with a room [name](https://schema.org/name) or type and optional [identifier](https://schema.org/identifier) for the room code.

#### name

The [name](https://schema.org/name) should contain the rate name

#### identifier (Optional)

The [identifier](https://schema.org/identifier) can be used to set a rate code

#### priceSpecification

The [priceSpecification](https://schema.org/UnitPriceSpecification) contains the [price](https://schema.org/price) and [currency](https://schema.org/currency):

price: The numeric value of the offer

currency: The 3 character currency code of the offer

unitText (optional): "Total" if the price is for the entire stay. "Nightly" if the price is per night. Defaults to "Nightly".

#### offeredBy (Optional)

The [offeredBy](https://schema.org/offeredBy) field should be set to the [Hotel](https://schema.org/Hotel), [LodgingBusiness](https://schema.org/LodgingBusiness) or [BedAndBreakfast](https://schema.org/BedAndBreakfast) to which the individual offer applies.
> When not provided, it defaults to the hotel in [Identification](#identification) section.
 

## Advanced

### No availability

*Used by: Triptease*

This allows you to tell us you don't have any availability for the search that was just performed. The search should be provided using LodgingSearch.

This is applicable even if you display availability for alternative dates or alternative properties. Note that the LodgingSearch should be the original search that was performed. 

#### JSON-LD Example

```html
<script type="application/ld+json">
{
  "@context": "http://schema.org/",
  "@type": "OfferCatalog",
  "numberOfItems": 0
}
</script>
```

#### Microdata Example

```html
<div itemscope itemtype="http://schema.org/OfferCatalog">
 <meta itemprop="numberOfItems" content="0"> 
 No availaible rooms for the dates you searched
</div>
```

Let's walk through this:

#### @type

Set this to [OfferCatalog](http://schema.org/OfferCatalog)

#### numberOfItems

Just set this to zero, so we know you have no availability. See https://schema.org/numberOfItems




### Application Details

*Used by: Triptease*

This allows you to tell us about your booking engine or marketing site. This is used purely for diagnosis

#### JSON-LD Example

```html
<script type="application/ld+json">
{
  "@context": "http://schema.org/",
  "@type": "SoftwareApplication",
  "name": "AwesomeBookingEngine",
  "version" "12.43"
}
</script>
```

#### Microdata Example

```html
<div itemscope itemtype="http://schema.org/SoftwareApplication">
 Powered by <span itemprop="name">AwesomeBookingEngine</span> Version: <span itemprop="version">12.43</span> 
</div>
```

Let's walk through this:

#### @type

Set this to [SoftwareApplication](http://schema.org/SoftwareApplication)

#### name

The [name](https://schema.org/name) should contain the booking engine name. The format is alphanumeric, single-word only (e.g. QuickRez) .

#### version

The [version](https://schema.org/version) should contain the booking engine version






### Further Reading

[Leverage structured data to turbo-drive your click-through rate](https://www.triptease.com/blog/schema-hoteliers-leverage-structured-data/)

[Markup for Hotels](https://schema.org/docs/hotels.html)

[Understand how structured data works](https://developers.google.com/search/docs/guides/intro-structured-data)

[Structured Data Testing Tool](https://search.google.com/structured-data/testing-tool)

[Schema.org Generator](https://developers.brewerdigitalmarketing.com/generator)

[Schema Markup Generator](https://technicalseo.com/seo-tools/schema-markup-generator/)

[Microdata](https://www.w3.org/TR/microdata/)




### Help

If you are having trouble then do reach out to your Customer Success Manager or Direct Booking Coach.
