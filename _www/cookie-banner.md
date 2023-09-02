# Cookie Banner

#### Typical Cookie Banner
Suppose that you have your cookie banner set up as follows:

- A cookie banner appears on your webpage, requesting users to consent to cookies.
- If a user accepts the cookies, the Triptease script is added to your webpage.
- If a user rejects the cookies, the Triptease script is not added to your webpage.
- If a user allows a selection of cookies (usually chosen from Essential, Functionality, Performance, Marketing), the Triptease script is included only if Marketing has been chosen.

Unfortunately, this configuration of your cookie banner limits your ability to fully leverage the capabilities offered by Triptease, as detailed below.

#### Limitations

- **Missed tracking and insights**: By not adding the Triptease script, you are essentially missing out on tracking and gaining valuable insights into your guests' journey that could inform your marketing strategies and website optimisation efforts.
- **Limited personalisation and engagement**: Triptease provides various features and functionalities that allow you to personalise the guest experience and engage with them effectively. Without the script, you are unable to leverage these capabilities, resulting in a less tailored and engaging experience for your guests. Personalised messages, price checks, and chat functionalities are just a few examples of what you would miss out on without the Triptease script.
- **Reduced conversion rates**: Triptease has proven to be instrumental in improving conversion rates for many businesses. By not adding the Triptease script, you are potentially depriving yourself of a powerful tool that can help drive conversions on your website. The script enables you to implement persuasive elements such urgency messaging, and targeted offers that can significantly boost your conversion rates.
- **Missed performance-enhancing capabilities**: Triptease's Parity, Paid Search, and Meta applications are specifically designed to optimise website performance, increase visibility, and drive direct bookings. Without incorporating the Triptease script, you may be limiting your ability to effectively maintain rate parity, optimise your search engine marketing campaigns, and leverage metasearch channels, resulting in missed opportunities to enhance website performance, attract more guests, and maximise revenue potential.

These limitations are even more prevalent when you have a non-invasive banner which allows your guest to go through the entire booking journey without accepting or rejecting your cookies.

#### Did you know?

- **Functionality** (a.k.a personalisation/preferences) consent is all you need for **Messages** (including Price Check), **Parity** and **Chat**
- **Performance** (a.k.a statistics/analytics) consent is all you need for **Parity**, **Meta** and **Paid Search**
- **Marketing** (a.k.a advertising) consent is a necessity only for **Retargeting**

#### Compliance and Privacy

At Triptease, we understand that compliance and privacy are paramount for you and your guests. However, we believe that meeting these requirements should not result in sacrificing the products and services you have invested in. That's why we have developed Consent Mode, a solution that empowers you to retain control over Triptease's functionality while respecting your users' consent preferences.

We care about the user’s “right to be forgotten” so much that we don’t just limit cookie consent to cookies and instead apply it to all persistent storage such as local storage. When a user rejects cookies we only rely on non-persistent storage such as session storage. If the user closes the tab and returns later, the person is well and truly forgotten and seems like a completely different person.

This means you can add Triptease script all the time, even without the user accepting cookies, and as long as you have passed the user’s cookie choices to the Triptease script you are compliant. See below for IP address justification.

For more details about consent mode, and how to implement it please follow our [consent mode guide](https://docs.triptease.io/consent).

##### IP address justification

When Triptease script is added, the client browser establishes a connection with Triptease server which provides the IP address.

Whilst IP address is considered personal data, it is not necessary to obtain user consent as there is legitimate interest.

Three-part test for legitimate interest:
1. Purpose Test: Triptease has a valid reason to process the IP address in order to provide you with services on the website and track the services you have accessed outside the website (e.g. Paid Search, Meta, Retargeting).
2. Necessity Test: There are no alternative methods that are less intrusive and equally effective.
3. Balancing Test: This does not override the data subject's interests or fundamental rights and freedoms. The complete IP address is not stored by Triptease, making it impossible to identify the data subject.
