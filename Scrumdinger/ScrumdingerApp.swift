//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by 백대홍 on 2022/05/01.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData) //리스트 뷰를 보여줌
        }
    }
}
