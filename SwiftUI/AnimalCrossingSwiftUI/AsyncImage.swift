//  Copyright © 2020 ACartagena. All rights reserved.
//  code from: https://www.vadimbulavin.com/asynchronous-swiftui-image-loading-from-url-with-combine-and-swift/

import SwiftUI
import Combine

class ImageLoader: ObservableObject {

    @Published var image: UIImage?

    private var cancellable: AnyCancellable?
    private let url: URL

    deinit {
        cancellable?.cancel()
    }

    init(url: URL) {
        self.url = url
    }

    func load() {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
                    .map { UIImage(data: $0.data) }
                    .replaceError(with: nil)
                    .receive(on: DispatchQueue.main)
                    .assign(to: \.image, on: self)
    }

    func cancel() {
        cancellable?.cancel()
    }
}

struct AsyncImage: View {

    @ObservedObject private var loader: ImageLoader
    private let placeholderColor: Color

    init(url: URL, placeholderColor: Color = Color(.systemOrange)) {
        loader = ImageLoader(url: url)
        self.placeholderColor = placeholderColor
    }

    var body: some View {
        VStack {
            if loader.image != nil {
                Image(uiImage: loader.image!)
                    .resizable()
            } else {
                ZStack {
                    placeholderColor
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
            }
        }
        .onAppear {
            loader.load()
        }.onDisappear {
            loader.cancel()
        }
    }
}

struct AsyncImage_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImage(url: URL(string: "https://acnhapi.com/v1/images/villagers/372")!)
    }
}
