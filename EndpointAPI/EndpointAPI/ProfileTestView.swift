//
//  ProfileTestView.swift
//  EndpointAPI
//
//  Created by Manuel Salinas on 10/18/23.
//

import SwiftUI
import MapKit

struct ProfileTestView: View {
    var body: some View {
        VStack {
                   /* MapView()
                        .frame(height: 300)


                    CircleImage()
                        .offset(y: -130)
                        .padding(.bottom, -130)
            */


                    VStack(alignment: .leading) {
                        Text("Turtle Rock")
                            .font(.title)
                        HStack {
                            Text("Joshua Tree National Park")
                            Spacer()
                            Text("California")
                        }
                        .font(.subheadline)
                        .foregroundStyle(.secondary)


                        Divider()


                        Text("About Turtle Rock")
                            .font(.title2)
                        Text("Descriptive text goes here.")
                    }
                    .padding()


                    Spacer()
                }
    }
}

#Preview {
    ProfileTestView()
}
