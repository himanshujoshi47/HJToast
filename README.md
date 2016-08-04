# HJToast

[![CI Status](http://img.shields.io/travis/Himanshu%20Joshi/HJToast.svg?style=flat)](https://travis-ci.org/Himanshu Joshi/HJToast)
[![Version](https://img.shields.io/cocoapods/v/HJToast.svg?style=flat)](http://cocoapods.org/pods/HJToast)
[![License](https://img.shields.io/cocoapods/l/HJToast.svg?style=flat)](http://cocoapods.org/pods/HJToast)
[![Platform](https://img.shields.io/cocoapods/p/HJToast.svg?style=flat)](http://cocoapods.org/pods/HJToast)

`HJToast` is a customised library for Toast or SnackBar, that comes with powerful feature of accessory views. It can be used to display the short messages or events over the view.


## Requirements

Xcode 7.0+ and Swift 2.0

## Demo

Coming soon.

## Adding HJToast to your project

### CocoaPods

[CocoaPods](http://cocoapods.org) is the recommended way to add HJToast to your project.

1. Add a pod entry for HJToast to your Podfile `pod 'HJToast'`
2. Install the pod by running `pod install`.
3. Include HJToast wherever you need it with `import HJToast`.


## Params

```
font              - The font for the displayed message (default: system-regular-12.0pt)
textColor         - Text color for the displayed message (default: whiteColor)
textAlignment     - Text Alignment for displayed message (default: Center)
toastDuration     - Duration for which toast will present in view (default: Text reading time)
animateDuration   - Duration of animation while toast will slide up and down (default: 0.25)
edgeInsets        - Edge insets for toast subviews (default: UIEdgeInsetsMake(10, 10, 10, 10))

leftView          - Optional left view for toast
rightView         - Optional right view to toast

```


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Author

Himanshu Joshi

## License

HJToast is available under the MIT license. See the LICENSE file for more info.
