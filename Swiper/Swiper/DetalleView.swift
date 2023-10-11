//
//  DetalleView.swift
//  Swiper
//
//  Created by Manuel Salinas on 5/19/23.
//

import SwiftUI

struct DetalleView: View {
    var item: String
    
    var body: some View {
        Text(item)
            .font(.largeTitle)
    }
}

struct DetalleView_Previews: PreviewProvider {
    static var previews: some View {
        DetalleView(item: "hey")
    }
}
