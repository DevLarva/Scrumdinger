//
//  TrailingIconLabelStyle.swift
//  Scrumdinger
//
//  Created by 백대홍 on 2022/05/01.
//

import SwiftUI

struct TrailingIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
    
}
extension LabelStyle where Self == TrailingIconLabelStyle{
        static var trailingIcon: Self {Self()}
}
