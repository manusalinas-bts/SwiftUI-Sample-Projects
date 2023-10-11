//
//  MultiplePhotosPicker.swift
//  PhotosPicker_app
//
//  Created by Manuel Salinas on 8/1/23.
//

import SwiftUI
import PhotosUI

struct MultiplePhotosPicker: View {
    
    @State private var selectedItems: [PhotosPickerItem] = []
    @State private var selectedPhotosData: [Data] = []
    
    var body: some View {
        ZStack {
            if !selectedPhotosData.isEmpty {
                Grid {
                    ForEach(selectedPhotosData, id: \.self) { photoData in
                        if let image = UIImage(data: photoData) {
                            Image(uiImage: image)
                                .resizable()
                        }
                    }
                }
                .ignoresSafeArea()
            }
            
            PhotosPicker(selection: $selectedItems, maxSelectionCount: 5, matching: .images) {
                Label("Select", systemImage: "photo.on.rectangle.angled")
            }
            .tint(.indigo)
            .controlSize(.large)
            .buttonStyle(.borderedProminent)
            .onChange(of: selectedItems) {
                
                selectedPhotosData.removeAll()
                selectedItems.forEach { photo in
                    Task {
                        if let data = try? await photo.loadTransferable(type: Data.self) {
                            selectedPhotosData.append(data)
                        }
                    }
                }
            }
        }
        .navigationTitle("Multiple Selection")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    MultiplePhotosPicker()
}
