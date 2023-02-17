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

## API selection

For the purpose of this exercise I have decided to use a simple menu API provided by a 3rd party (free-food-menus-api), I have selected the best foods filter to present a reasonable sized basic menu

The API can be found here: https://free-food-menus-api-production.up.railway.app

## Testing decisions

I have opted to use XCode's in built unit tests, these are perfectly fit for purpose for iOS apps and especially in this scenario. There are alternatives such as Appium but these only really have benefits when you have dedicate QA Engineers who are writing the tests and when the tests are going to be used accross different platforms.

For UI testing I have gone with basic tests using XCode's built in UI testing. Again there are alternatives often based on Selenium but for this scenario XCodes own tests will fit the requirements. 

## UI decisions

I have selected to develop the UI using SwiftUI as this is a simple interface and SwiftUI scales well accross multiple devices and screen sizes. Additionally SwiftUI is ideal for creating quick prototype or sample apps such as this. With no existing UIKit or Storyboard views to integrate with this seemed like the most pragmatic approach to this task.

## Data storage decisions

I have selected to store the data using Core Data as this is native to iOS so no need to import any 3rd party libraries. It is also fast enough and flexible enough for the selected task.

## 3rd party SDKs

I have decided to code this app using only the native SDK, while 3rd party SDKs such as Firebase or AlamoFire could have been used I decided to keep this app simple and avoid the potential frustrations of importing Cocoapods or Swift Packages.

## Next Steps

If this app was to be taken into a production standard app a number of steps would need to be taken. Some of the next steps I would take are the following:

- Store the users order history on a remote service (most basic would be iCloud but it could also be the Dines backend)
- Integrate with a multi level API so that the menu categories are driven by the API and not hard coded
- Improve the UI layout (better colours, font selection, logo's etc)
- Integration with Crashlytics or some other form of Crash reporting
- Integration with an analytics platform to understand how the app is being used to help future developments and improvements
- Integration with an API so that the order actually goes some where and is not just stored on the device
- Integration with Payment service so that payments can be processed for the order
- Ability to add a tip (present value of 10% with the option to customise)
- Pull to refresh on the menu
- Local caching of the menu (potentially storing in Core Data - although offline usage is not a great use case as if they are offline they cannot place an order)
- User registration and login (potentially using a service such as Firebase or using Dines own authentication)
- Integration with biometrics for quick login and authentication at checkout
- Build and test automation using Fastlane or XCode Cloud
