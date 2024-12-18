import Foundation

class ExtractorPhoneNumber {
    
    func extractPhonePartsRaw(from text: String) -> String {
        // Регулярное выражение для извлечения номеров
        let pattern = #"""
        [\+\-\(\)\d\s]+          # Часть номера с допустимыми символами (+, -, (), цифры)
        """#
        
        // Разделение текста на строки
        let lines = text.split(separator: "\n")
        var extractedParts: [String] = []
        
        // Создание регулярного выражения
        guard let regex = try? NSRegularExpression(pattern: pattern, options: [.allowCommentsAndWhitespace]) else {
            return ""
        }
        
        // Поиск совпадений
        for line in lines {
            // Игнорирование строк с '%' или ':'
            if line.contains("%") || line.contains(":") {
                continue
            }
            
            let range = NSRange(line.startIndex..<line.endIndex, in: line)
            if let match = regex.firstMatch(in: String(line), options: [], range: range) {
                if let matchRange = Range(match.range, in: line) {
                    extractedParts.append(String(line[matchRange]).trimmingCharacters(in: .whitespaces))
                }
            }
        }
        
        // Возврат извлечённых частей в исходном порядке
        return extractedParts.joined(separator: "\n")
    }
}
