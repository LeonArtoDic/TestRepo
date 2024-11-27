////
////  Greeting.swift
////  ScreenCheckerPrototype
////
////  Created by Артем Леонов on 27.11.24.
////
//
//import Foundation
//import AppIntents
//
//@available(iOS 16.0, macOS 13.0, watchOS 9.0, tvOS 16.0, *)
//struct Greeting: AppIntent, CustomIntentMigratedAppIntent, PredictableIntent {
//    static let intentClassName = "GreetingIntent"
//
//    static var title: LocalizedStringResource = "Greet User"
//    static var description = IntentDescription("Sends a greeting with the user's name and age")
//
//    @Parameter(title: "Name")
//    var name: String?
//
//    @Parameter(title: "Age")
//    var age: String?
//
//    static var parameterSummary: some ParameterSummary {
//        Summary("Enter \(\.$name) and \(\.$age)")
//    }
//
//    static var predictionConfiguration: some IntentPredictionConfiguration {
//        IntentPrediction(parameters: (\.$name, \.$age)) { name, age in
//            DisplayRepresentation(
//                title: "Enter \(name!) and \(age!)",
//                subtitle: ""
//            )
//        }
//    }
//
//    func perform() async throws -> some IntentResult & ReturnsValue<String> {
//        // TODO: Place your refactored intent handler code here.
//        return .result(value: String(/* fill in result initializer here */))
//    }
//}
//
//@available(iOS 16.0, macOS 13.0, watchOS 9.0, tvOS 16.0, *)
//fileprivate extension IntentDialog {
//    static func nameParameterDisambiguationIntro(count: Int, name: String) -> Self {
//        "There are \(count) options matching ‘\(name)’."
//    }
//    static func nameParameterConfirmation(name: String) -> Self {
//        "Just to confirm, you wanted ‘\(name)’?"
//    }
//    static func ageParameterDisambiguationIntro(count: Int, age: String) -> Self {
//        "There are \(count) options matching ‘\(age)’."
//    }
//    static func ageParameterConfirmation(age: String) -> Self {
//        "Just to confirm, you wanted ‘\(age)’?"
//    }
//}
//
////struct AppShortcuts: AppShortcutsProvider {
////    static var appShortcuts: [AppShortcut] {
////        AppShortcut(
////            intent: Greeting(),
////            phrases: ["Say hello in \(.applicationName)"],
////            shortTitle: "Greet User",
////            systemImageName: "person.fill"
////        )
////        
////        AppShortcut(
////            intent: Display(),
////            phrases: ["Test \(.applicationName)"],
////            shortTitle: "test",
////            systemImageName: "person.fill"
////        )
////    }
////}
//
//
