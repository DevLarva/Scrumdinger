//
//  ErrorWrapper.swift
//  Scrumdinger
//
//  Created by 백대홍 on 2022/09/21.
//

import Foundation

struct ErrorWrapper: Identifiable {
    let id: UUID
    let guidance: String
    let error: Error
    
    init(id: UUID = UUID(),error:Error, guidance:String) {
        self.id = id
        self.error = error
        self.guidance = guidance
    }
}
