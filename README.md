iOS-UIAutomation-testing
========================

Temporary home for test/hacking of Apple's private UIAutomation framework. Tap, swipe, pinch!

This standalone application demonstrates that the UIAutomation framework can be commandeered to drive integration testing of an iOS application. In addition, as has been demontrated in other libraries and products, UIAutomation can be bridged to other tools and languages (i.e. cucumber integration tests of iOS apps).

The application uses a static library (PineCone) that encapsulates the UIAutomation functionality. PineCone functionality can be accessed directly via its static methods or by using categories (note, to link to categories you must use the objc flag: http://developer.apple.com/library/mac/#qa/qa1490/_index.html).