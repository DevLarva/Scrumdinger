import Foundation

struct DailyScrum: Identifiable, Codable {
    let id: UUID
    var title: String
    var attendees: [Attendee]
    var lengthInMinutes: Int
    var theme: Theme
    var history: [History] = []
    
    
    init(id:UUID = UUID(),title:String,attendees:[String],lengthInMinutes: Int, theme: Theme){
        self.id = id
        self.title = title
        self.attendees = attendees.map{Attendee(name: $0) }
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
    init(data: Data) {
        id = UUID()
        title = data.title
        attendees = data.attendees
        lengthInMinutes = Int(data.lengthInMinutes)
        theme = data.theme
    }
}
extension DailyScrum {
    struct Attendee: Identifiable, Codable {
        let id:UUID
        var name: String
        
        init(id:UUID = UUID(),name:String){
            self.id = id
            self.name = name
        }
        
    }
    struct Data {
        var title:String = ""
        var attendees:[Attendee] = []
        var lengthInMinutes :Double = 5
        var theme:Theme = .seafoam
    }
    var data:Data {
        Data(title: title, attendees: attendees, lengthInMinutes: Double(lengthInMinutes), theme: theme)
    }
}

extension DailyScrum {
    static let sampleData: [DailyScrum] =
    [
        DailyScrum(title: "Design", attendees: ["Cathy", "Daisy", "Simon", "Jonathan"], lengthInMinutes: 10, theme: .yellow),
        DailyScrum(title: "App Dev", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5, theme: .orange),
        DailyScrum(title: "Web Dev", attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"], lengthInMinutes: 5, theme: .poppy)
    ]
    mutating func update(from data: Data) { // 오류 발생하고 나서 따로 추가한 문장
            title = data.title
            attendees = data.attendees
            lengthInMinutes = Int(data.lengthInMinutes)
            theme = data.theme
        }
}
