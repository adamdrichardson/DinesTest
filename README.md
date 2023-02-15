# DinesTest

## Steps

The following steps will be completed for this technical test:

1. Call API to retrieve menu data
2. Handle any errors from the API
3. Create local data model for the basket
4. Create local data model for the orders
4. Create functions to add to the basket
5. Create functions to retrieve the basket
6. Create UI for displaying the menu
7. Create UI for the basket
8. Create UI for checkout confirmation
9. Save order to local data store
10. UI Tests

## Device and iOS support
I have taken the decision to support iOS14 and above. iOS 14 was first released in September 2020 so has been available for around 2.5 years and any devices purchased from September 2020 will be automatically running at least iOS14.
Additionally Apple app store statistics taken from May 31st 2022 show the following:
- Only 4% of iPhones are running a version of iOS older than iOS14
- Only 10% of iPads are running a version of iOS older than iOS14

These stats can be viewed here: https://developer.apple.com/support/app-store/

It is reasonable to assume that with another release of iOS (iOS16 in September 2022) and the launch of several new iOS devices that the numbers of both iPhones and iPads running versions of iOS older than iOS14 will have reduced in the 8.5 months since these stats were generated.
Additionally MixPanel stats from 15th February 2023 show that between 5% and 6% of devices are running iOS14 or lower. It is fair to assume that a significant proportion of that figure are running iOS14 and therefore the number of active devices running a version of iOS lower than iOS14 is small.

MixPanel stats can be viewed here: https://mixpanel.com/trends/#report/ios_16/from_date:-102,report_unit:day,to_date:0

The range of devices capable of supporting iOS14 and above is also large.
For iPhone this means that the iPhone6S and iPhone 6S Plus (both released in September 2015) along with the 1st generation iPhoneSE (released in March 2016) are the oldest devices that will be supported.

For iPad this means that the 4th generation iPad Mini (released September 2015) is the oldest iPad Mini that will be supported. The 2nd generation iPad Air (released October 2014) will be the oldest iPad Air supported. The 1st generation iPad Pro in all sizes (12.9 inch released November 2015, 9.7 inch released March 2016) will be the oldest iPad Pro devices supported.

Additionally the 7th generation iPod Touch (released May 2019) will also be supported.
