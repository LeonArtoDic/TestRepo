import AppIntents

struct SecondExtractPhoneNumberIntent: AppIntent {
    static var title: LocalizedStringResource = "Extract second number"
    static var description: IntentDescription = "Extract second number"

    @Parameter(title: "textFromSecondScreen")
    var textFromScreen: String
    
    static var parameterSummary: some ParameterSummary {
        Summary("Extract second number \(\.$textFromScreen)")
    }

    func perform() async throws -> some IntentResult {
        print(textFromScreen)
        let extracted = ExtractorPhoneNumber().extractPhonePartsRaw(from: textFromScreen)
        UserDefaults.standard.set(extracted, forKey: "secondExtractedNumber")
        return .result()
    }
}
