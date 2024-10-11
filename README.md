# AutoFLEX
Auto inject [FLEX](https://github.com/FLEXTool/FLEX) to any iOS app!

## Features
* Always build with newest FLEX with Github actions
* Inject single deb into you ipa and profit
* Works even without jailbreak, and inject any 3rd party app.
* Open FLEX at application launch.

## Install
**Do NOT install the deb directly**, the released deb is not for direct installation.
Instead, you must use sideloady or other ipa patcher to patch this deb into ipa.
And install ipa with Trollstore or sideloady or other app sideload things, you will get FLEX right after app starts.

## What does it do?
It basically inject beloved FLEX debugger into any iOS application.

## How do I reopen FLEX window?
- Lock and unlock your device with the app open
- Long press status bar

## Wait, we already have FLEXList or FLEXing or blah....
Yes. yes, but first they __do not have the newest FLEX__, second they cannot be used when you have no jailbreak.

## Yes but I absolutely want to install this deb directly!
OK, you have to fork this repo, modify the autoflex.plist file to include the app bundle id you wanna hook, and run the workflow to get your deb.

## Do I need to install other FLEX library?
No, this deb is self contained, and compiled with all FLEX sources.

More details at https://hope1ess.com/2024/10/09/enhancing-ios-debugging-creating-a-custom-flex-loader-to-any-3rd-party-ios-application/
