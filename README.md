# Lean iOS Demo Application

This starter application allows you to see and test all of the methods available in the LinkSDK's Swift Package. 

## Getting Started

Open `LeanDemo.xcodeproj` in xCode and build the application.

Enter your App Token in the field provided and press the return key - alternatively you can set the `appToken` parameter in the `LeanDemoApp.swift` file.

```
//
//  LeanDemoApp.swift
//  LeanDemo
//
//  Created by Alex Tomlinson on 15/04/2021.
//

import SwiftUI
import LeanSDK

@main
class LeanDemoApp: App {
    required init() {
        Lean.manager.setup(appToken: "YOUR_APP_TOKEN", sandbox: true, version: "latest")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

You may also need to update the Team settings to successfully build the project. To do this click on LeanDemo in the Project Navigator, go to Signing & Capabilities along the top navigation and update the necessary details.

## Troubleshooting

### Lean is not available, or the package is not present
If the LeanSDK function cannot be found - go to File > Swift Packages > Update to Latest Package Versions. You can also relink the Swift Package by adding `https://www.github.com/leantechnologies/link-sdk-ios-distribution` as a dependency.
