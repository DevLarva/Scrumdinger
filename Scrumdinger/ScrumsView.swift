//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by 백대홍 on 2022/05/01.
//

import SwiftUI

struct ScrumsView: View {
    let scrums: [DailyScrum]
    
    
    var body: some View {
        List {
            ForEach(scrums) { scrum in
                
                NavigationLink(destination: DetailView(scrum:scrum)){
                //이니셜라이저의 대상으로 텍스트(scrum.title)를 전달하여 NavigationLink를 추가합니다.
                CardView(scrum: scrum)
                    
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            
        }
        .navigationTitle("Daily Scrums")
        .toolbar {
            Button(action: {}) { //일단 버튼에 빈 동작을 전달합니다.
                Image(systemName: "plus")
            }
            .accessibilityLabel("New Scrum")
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {   //ScrumsView.swift에서 ScrumsView를 NavigationView에 포함시킵니다.
            ScrumsView(scrums: DailyScrum.sampleData)
        }
        
    }
}
