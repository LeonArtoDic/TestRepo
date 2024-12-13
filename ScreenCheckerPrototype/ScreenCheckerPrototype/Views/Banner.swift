import SwiftUI

struct BannerView: View {
    let image: Image?
    let name: String
    let location: String

    init(image: Image?, name: String, location: String) {
        self.image = image
        self.name = name
        self.location = location
    }

    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            image?
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 8))

            VStack(alignment: .leading, spacing: 8) {
                Text(name)
                    .font(.headline)
                    .foregroundColor(.primary)

                Text(location)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            Spacer()
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground)) // Задний фон баннера
        .cornerRadius(12)
        .shadow(radius: 4)
    }
}
