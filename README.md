# dog_breed

Breed dog api integration for dashboard using flutter

## Getting Started
Clean Architecture based flutter project:

the primary task was to load API data and build the UI. 
To integrate rest API in dart-flutter we prefer 3 layers. 
## Data Layer
 Pure Dart code, no-ui related codes. This code can be unit-tested. data layer has components such as
    Base api for handling, POST-GET-PUT methods on raw request/response bytes. 
    API provider is being used to build the mechanism of handling raw-request-response, propagate 
    data into proper models, listen to time-out, serialize/de-serialize of data
    
 Data Layer has other portions such as
    ### Request
    ### Response
    ### JSON serialization/Annotations

 Data Layer contains the concrete implementation of repositories.

## Domain Layer
 Domain Layer is used to manipulate business logic into the request or response data. Use-cases are
    the main candidate to invoke any custom operation on the obtained data. Domain has entity sections
    which used to feed converted response into the UI layer.
    Domain creates the bridge in-between network layer and UI layer

## UI Layer 
It contains the User interaction interface. UI layer depends on bloc and relevant states to update
    its contents, reflects the User input into data-domain via bloc/cubit. It has mostly view related code

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
