//
//  NewRestaurantView.swift
//  FoodPin
//
//  Created by Simon Ng on 20/10/2022.
//

import SwiftUI

struct NewRestaurantView: View {

    enum PhotoSource: Identifiable {
        case photoLibrary
        case camera

        var id: Int {
            hashValue
        }
    }

    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var context

    @State private var restaurantName = ""
    @State private var showPhotoOptions = false
    @State private var photoSource: PhotoSource?
    @State private var restaurantFormViewModel = RestaurantFormViewModel()

    var body: some View {
        NavigationStack {

            ScrollView {
                VStack {

                    Image(uiImage: restaurantFormViewModel.image)
                        .resizable()
                        .scaledToFill()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 200)
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 20.0))
                        .padding(.bottom)
                        .onTapGesture {
                            self.showPhotoOptions.toggle()
                        }

                    FormTextField(label: "NAME", placeholder: "Fill in the restaurant name", value: $restaurantFormViewModel.name)

                    FormTextField(label: "TYPE", placeholder: "Fill in the restaurant type", value: $restaurantFormViewModel.type)

                    FormTextField(label: "ADDRESS", placeholder: "Fill in the restaurant address", value: $restaurantFormViewModel.location)

                    FormTextField(label: "PHONE", placeholder: "Fill in the restaurant phone", value: $restaurantFormViewModel.phone)

                    FormTextView(label: "DESCRIPTION", value: $restaurantFormViewModel.description, height: 100)
                }
                .padding()

            }

            // Navigation bar configuration
            .navigationTitle("New Restaurant")

            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark")
                    }

                }

                ToolbarItem(placement: .navigationBarTrailing) {

                    Button {
                        storeRestaurant()
                    } label: {
                        Text("Save")
                            .font(.headline)
                            .foregroundColor(Color("NavigationBarTitle"))
                    }

                }
            }
        }
        .actionSheet(isPresented: $showPhotoOptions) {

            ActionSheet(title: Text("Choose your photo source"),
                        message: nil,
                        buttons: [
                            .default(Text("Camera")) {
                                self.photoSource = .camera
                            },
                            .default(Text("Photo Library")) {
                                self.photoSource = .photoLibrary
                            },
                            .cancel()
                        ])
        }
        .fullScreenCover(item: $photoSource) { source in
            switch source {
            case .photoLibrary: ImagePicker(sourceType: .photoLibrary, selectedImage: $restaurantFormViewModel.image).ignoresSafeArea()
            case .camera: ImagePicker(sourceType: .camera, selectedImage: $restaurantFormViewModel.image).ignoresSafeArea()
            }
        }
        .accentColor(.primary)
    }

    private func storeRestaurant() {
        let restaurant = Restaurant(context: context)
        restaurant.name = restaurantFormViewModel.name
        restaurant.type = restaurantFormViewModel.type
        restaurant.location = restaurantFormViewModel.location
        restaurant.phone = restaurantFormViewModel.phone
        restaurant.image = restaurantFormViewModel.image.pngData()!
        restaurant.summary = restaurantFormViewModel.description
        restaurant.isFavorite = false

        do {
            try context.save()
            dismiss()
        } catch {
            print("Failed to save the record...")
            print(error.localizedDescription)
        }
    }
}

#Preview {
    NewRestaurantView()
}
