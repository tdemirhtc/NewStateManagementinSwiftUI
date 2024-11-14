//
//  NewStateManagementApp.swift
//  NewStateManagement
//
//  Created by Hatice Taşdemir on 11.11.2024.
//

import SwiftUI
import SwiftData

@main
struct NewStateManagementApp: App {
  
    var body: some Scene {
        WindowGroup {
            ContentView()
            //structlarda aynı değişkeni env. kullandık bu değişkenin tek bir instance var.  bu kod ile inject ettim  
                .environment(DarkTheme())
        }
    
    }
}
