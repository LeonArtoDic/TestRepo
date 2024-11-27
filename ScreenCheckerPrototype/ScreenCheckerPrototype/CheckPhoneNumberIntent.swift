import Foundation
import AppIntents
import SwiftUI

class CheckNumberService {
    let numberArray = [
        "+375 (25) 505-32-09": "George W. Bush"
    ]

    func chekPhone(number: String) -> String {
        var result = "Ya hui znaet kto eto"
        
        numberArray.forEach { key, value in
            if key == number {
                result = value
            }
        }
        
        return result
    }
}


struct CustomView: View {
    var body: some View {
        Image("eatOne")
            .resizable()
            .frame(width: 100, height: 100)
            .clipped()
    }
}


struct CheckPhoneNumberIntent: AppIntent {
    static var title: LocalizedStringResource = "Check phone number"
    static var description: IntentDescription = "Check phone number"

    @Parameter(title: "number")
    var phoneNumber: String
    
    static var parameterSummary: some ParameterSummary {
        Summary("Check \(\.$phoneNumber)")
    }

    @MainActor
    func perform() async throws -> some ProvidesDialog & ShowsSnippetView {
        let result = CheckNumberService().chekPhone(number: phoneNumber)
        let vi = CustomView()
        return .result(dialog: "\(result)", view: vi)
    }
}

struct AppShortcuts: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: CheckPhoneNumberIntent(),
            phrases: ["test \(.applicationName)"], 
            shortTitle: "Check",
            systemImageName: "person.fill"
        )
    }
}
