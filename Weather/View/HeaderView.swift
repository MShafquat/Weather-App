//
//  HeaderView.swift
//  Weather
//
//  Created by Shafquat Mahbub on 11/10/23.
//

import SwiftUI

struct HeaderView: View {
    @Binding var lastLocationName: String?

    var body: some View {
        Text(lastLocationName ?? "")
            .font(.largeTitle)
    }
}

#Preview {
    HeaderView(lastLocationName: .constant("Dhaka, Bangladesh"))
}
