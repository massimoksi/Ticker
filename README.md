# Ticker 📢🐞⚠💩💣

Ticker is a simple and funny - yet expressive and configurable - logging library for iOS.

The aim of Ticker is to act as a more expressive replacement for Swift `print` statements during the development of your project.

## Description

Implementation is inspired by other full-fledged logging libraries for Swift, but it's not yet inteded as a replacement for those frameworks due to the lack of some power functions.

Its functions are - *at the moment* - limited to logging on console in the main thread but the output is **funny by default&trade;**.

## Requirements

- iOS 8.0+
- Xcode 7.2+

## Installation

The preferred way to start using Ticker inside your project is through [CocoaPods](http://cocoapods.org) even if it is not yet released to the public repository.

To integrate Ticker into your Xcode project and use the latest version of the library, specify it in your `Podfile`:

```ruby
platform :ios, '8.0'
use_frameworks!

pod 'Ticker', :git => 'https://github.com/massimoksi/Ticker.git'
```

Then run the following command:

```bash
$ pod install
```

## Usage

To start using Ticker, you just need to import it in all your source files:

```swift
import Ticker
```

Then, you need to `setup` it in order to initiliaze its instance. 

To have Ticker available as soon as the application starts, initialize it in your `AppDelegate`:

```swift
func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    // Override point for customization after application launch.

    Ticker.setup()
}
```

Then you're ready to start logging on console calling the available logging functions:

```swift
Ticker.info("This is an info message")
Ticker.debug("This is a debug message")
Ticker.warning("This is a warning message")
Ticker.error("This is an error message")
Ticker.failure("This is a failure message")
```

The generated output will be:

```
2016-01-23 15:13:23.179 - 📢 This is an info message
2016-01-23 15:13:23.179 - 🐞 This is a debug message
2016-01-23 15:13:23.179 - ⚠️ This is a warning message
2016-01-23 15:13:23.180 - 💩 This is an error message
2016-01-23 15:13:23.180 - 💣 This is a failure message
```

### Customization

The behaviour and appearance of Ticker can be costumized simply calling the `setup` function with parameters:

```swift
Ticker.setup(.Debug, style: .Verbose, showTimestamp: false)
```

- `level`: a `LogLevel` indicating the minimum log level to be output. Log messages with a level lower than this will be discarded at runtime. The default value is `.Info`.
- `style`: a `LogLevelStyle` indicating the style to be adopted by the output. The default value is `.Funny`.
- `showTimestamp`: a `Bool` value indicating whether a timestamp should be output or not. The default value is `true`.

### Log styles

Ticker implements the following styles to visualize the log level.

- `.Hidden`: the log level is not output.

- `.Verbose`: the whole log level name is printed.

```
2016-01-23 15:13:23.179 - Info: This is an info message
2016-01-23 15:13:23.179 - Debug: This is a debug message
2016-01-23 15:13:23.179 - Warning: This is a warning message
2016-01-23 15:13:23.180 - Error: This is an error message
2016-01-23 15:13:23.180 - Failure: This is a failure message
```

- `.Symbolic`: messages are printed using a ticker symbols.

```
2016-01-23 15:13:23.179 - [NFO] This is an info message
2016-01-23 15:13:23.179 - [DBG] This is a debug message
2016-01-23 15:13:23.179 - [WRN] This is a warning message
2016-01-23 15:13:23.180 - [ERR] This is an error message
2016-01-23 15:13:23.180 - [FLR] This is a failure message
```

- `.Funny`: the default log style. Log levels are output with emojis.

- `.Casual(urban: false)`: causal speech is used to present the log level in messages.

```
2016-01-23 15:13:23.179 - Psst! This is an info message
2016-01-23 15:13:23.179 - Look! This is a debug message
2016-01-23 15:13:23.179 - Wait! This is a warning message
2016-01-23 15:13:23.180 - Oops! This is an error message
2016-01-23 15:13:23.180 - Ouch! This is a failure message
```

- `.Casual(urban: true)`: a stronger - *urban* - language is used to present error messages.

```
2016-01-23 15:13:23.179 - Psst! This is an info message
2016-01-23 15:13:23.179 - Look! This is a debug message
2016-01-23 15:13:23.179 - Wait! This is a warning message
2016-01-23 15:13:23.180 - S**t! This is an error message
2016-01-23 15:13:23.180 - F**k! This is a failure message
```

### Deployment

Ticker logging functions run on the main thread, therefore it is recommendable to disable them when deploying your project to production to avoid any possible slow down.
  
Logging can be disabled in production using Swift build flags.  

1. Go to Build settings -> Swift Compiler - Custom Flags -> Other Swift Flags.
2. Add `-DDEBUG` to the Debug configuration.
3. Change the Ticker initialization:

```swift
#if DEBUG
    Ticker.setup()
#endif
```

Another possibility is to use different logging styles and levels depending on the build configuration, in order to still have a reference to errors in production:

```swift
#if DEBUG
    Ticker.setup()
#else
    Ticker.setup(.Error, style: .Short, showTimestamp: true)
#endif
```

## Contributing

Pull requests are welcome and mostly appreciated.

## Contact

Massimo Peri

- http://github.com/massimoksi
- http://twitter.com/massimoksi
- massimoperi@gmail.com

## License

Ticker is available under the MIT license. See the LICENSE file for more info.
