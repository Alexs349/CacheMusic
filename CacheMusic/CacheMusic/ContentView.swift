import SwiftUI

struct ContentView: View {
    @State private var isLoading = false
    @State private var hasError = false
    
    var body: some View {
        ZStack {
            WebView(
                url: URL(string: "https://m.vk.com")!,
                isLoading: $isLoading,
                hasError: $hasError
            )
            .ignoresSafeArea(edges: .bottom)
            
            if isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
                    .scaleEffect(1.5)
                    .tint(.blue)
            }
            
            if hasError {
                VStack(spacing: 12) {
                    Image(systemName: "wifi.exclamationmark")
                        .font(.largeTitle)
                    Text("Не удалось загрузить")
                    Text("Проверьте интернет и попробуйте ещё раз")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 16))
            }
        }
    }
}