import SwiftUI

struct DetailView: View {
    let scrum: DailyScrum
    
    @State private var isPresentingEditView = false

    var body: some View {
        List {
            Section(header:Text("Metting Info")){
                NavigationLink(destination: MeetingView()) {
                    Label("Start Meeting",systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                HStack {
                    Label("Length",systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine) //HStack에 내게 필요한 옵션 요소(하위:)를 추가하여 내게 필요한 옵션 사용자에 대한 레이블 및 텍스트 요소를 결합합니다.
                HStack {
                    Label("Theme",systemImage: "paintpalette")
                    Spacer()
                    Text(scrum.theme.name)
                        .padding(4)//패딩값이 커지면 사각형이 커진다.
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                    
                }
                .accessibilityElement(children: .combine)
            }
            Section(header:Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Label(attendee.name,systemImage: "person")
                    
                }
            }
            
        }
        .navigationTitle(scrum.title)
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView {
                DetailEditView()
                    .navigationTitle(scrum.title)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        isPresentingEditView = false
                        }
                    }
                }
            
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(scrum: DailyScrum.sampleData[0])
    }
}
