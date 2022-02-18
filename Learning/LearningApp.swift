//
//  LearningApp.swift
//  Learning
//
//  Created by Khayrul on 2/18/22.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {HomeView()
            .environmentObject(ContentModel())
            
        }
    }
}
