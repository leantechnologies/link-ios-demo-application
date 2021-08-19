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
