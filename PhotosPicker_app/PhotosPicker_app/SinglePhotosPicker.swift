//
//  SinglePhotosPicker.swift
//  PhotosPicker_app
//
//  Created by Manuel Salinas on 8/1/23.
//

import SwiftUI
import PhotosUI

struct SinglePhotosPicker: View {
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedPhotoData: Data?
    
    var body: some View {
        ZStack {
            if let selectedPhotoData,
                let image = UIImage(data: selectedPhotoData) {
             
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            }
            
            PhotosPicker(selection: $selectedItem, matching: .images) {
                Label("Select", systemImage: "photo")
            }
            .tint(.indigo)
            .controlSize(.large)
            .buttonStyle(.borderedProminent)
            .onChange(of: selectedItem) {
                Task {
                    if let data = try? await selectedItem?.loadTransferable(type: Data.self) {
                        selectedPhotoData = data
                    }
                }
            }
        }
        .navigationTitle("Single Selection")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SinglePhotosPicker()
}
