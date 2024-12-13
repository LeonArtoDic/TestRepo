import Foundation
import AppIntents
import SwiftUI

struct CheckPhoneNumberIntent: AppIntent {
    static var title: LocalizedStringResource = "Check phone number"
    static var description: IntentDescription = "Check phone number"

    @Parameter(title: "number")
    var phoneNumber: String
    
    static var parameterSummary: some ParameterSummary {
        Summary("Check \(\.$phoneNumber)")
    }

    func perform() async throws -> some ShowsSnippetView {
        let result = try await CheckNumberService().chekPhone(number: ["1", "2", "3", "4", "5"].randomElement()!)
        let avatar = await ImageLoader.shared.loadImage(from: result.image)
        let banner = BannerView(image: avatar, name: result.name, location: result.location.name)
        return .result(view: banner)
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
