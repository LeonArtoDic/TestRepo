import AppIntents
import SwiftUI

struct CheckPhoneNumberIntent: AppIntent {
        
    static var title: LocalizedStringResource = "Check phone number"
    static var description: IntentDescription = "Check phone number"

//    @Parameter(title: "number")
//    var phoneNumber: String
//    
//    static var parameterSummary: some ParameterSummary {
//        Summary("Check \(\.$phoneNumber)")
//    }

    func perform() async throws -> some ProvidesDialog {
        let result = try await CheckNumberService().chekPhone(number: ["1", "2", "3", "4", "5"].randomElement()!)
        let avatar = await ImageLoader.shared.loadImage(from: result.image)
        let banner = BannerView(image: avatar, name: result.name, location: result.location.name)
        let firstExtract = UserDefaults.standard.string(forKey: "firstExtractedNumber")
        let secondExtract = UserDefaults.standard.string(forKey: "secondExtractedNumber")
        let numbersFromScreens = "Screenshot one - \(firstExtract ?? "")\nScreenshot two - \(secondExtract ?? "")"
        UserDefaults.standard.removeObject(forKey: "firstExtractedNumber")
        UserDefaults.standard.removeObject(forKey: "secondExtractedNumber")
        return .result(dialog: "\(numbersFromScreens)")
    }
}

struct AppShortcuts: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: CheckPhoneNumberIntent(),
            phrases: ["CheckPhone"],
            shortTitle: "Check",
            systemImageName: "person.fill"
        )
        
        AppShortcut(
            intent: FirstExtractPhoneNumberIntent(),
            phrases: ["ExtractPhone"],
            shortTitle: "FirstExtract",
            systemImageName: "person.fill"
        )
        
        AppShortcut(
            intent: SecondExtractPhoneNumberIntent(),
            phrases: ["ExtractPhone"],
            shortTitle: "SecondExtract",
            systemImageName: "person.fill"
        )
    }
}
