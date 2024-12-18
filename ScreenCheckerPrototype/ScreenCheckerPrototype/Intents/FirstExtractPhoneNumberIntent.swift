import AppIntents

struct FirstExtractPhoneNumberIntent: AppIntent {
    static var title: LocalizedStringResource = "Extract first number"
    static var description: IntentDescription = "Extract first number"

    @Parameter(title: "textFromFirtsScreen")
    var textFromScreen: String
    
    static var parameterSummary: some ParameterSummary {
        Summary("Extract first number \(\.$textFromScreen)")
    }

    func perform() async throws -> some IntentResult {
        print(textFromScreen)
        let extracted = ExtractorPhoneNumber().extractPhonePartsRaw(from: textFromScreen)
        UserDefaults.standard.set(extracted, forKey: "firstExtractedNumber")
        return .result()
    }
}
