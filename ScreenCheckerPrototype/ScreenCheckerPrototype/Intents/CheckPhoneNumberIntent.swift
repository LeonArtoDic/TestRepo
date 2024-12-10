import Foundation
import AppIntents

struct CheckPhoneNumberIntent: AppIntent {
    static var title: LocalizedStringResource = "Check phone number"
    static var description: IntentDescription = "Check phone number"

    @Parameter(title: "number")
    var phoneNumber: String
    
    static var parameterSummary: some ParameterSummary {
        Summary("Check \(\.$phoneNumber)")
    }

    func perform() async throws -> some ProvidesDialog {
        let result = try await CheckNumberService().chekPhone(number: phoneNumber)
        return .result(dialog: "\(result)")
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
