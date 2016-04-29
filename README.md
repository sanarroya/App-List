# AppList
This app displays a list of the top 20 free apps of the App Store

## Running the app

```sh
$ git clone https://github.com/sanarroya/App-List.git
$ cd App-List
$ open -a Xcode AppList.xcworkspace
```
Select an iPad or iPhone simulator and run the app

##Libraries

This project was built using the following libraries:

####Alamofire

An HTTP library networking library used to get the apps from the endpoint in the specification.

[Alamofire documentation](https://github.com/Alamofire/Alamofire)

####ModelRocket

This library maps the JSON response into the model objects it simplifies writing data models for interacting with APIs that use JSON as their data exchange format.

[ModelRocket documentation](https://github.com/ovenbits/ModelRocket)

####Realm

Used as database of the app

[Realm documentation](https://realm.io/)

####RxSwift

Rx is a generic abstraction of computation expressed through ```Observable<Element>``` interface. This library was used in conjunction with Alamofire to handle the request to the API

[RxSwift documentation](https://github.com/ReactiveX/RxSwift/blob/master/Documentation/GettingStarted.md)
