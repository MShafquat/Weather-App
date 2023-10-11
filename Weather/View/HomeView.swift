//
//  HomeView.swift
//  Weather
//
//  Created by Shafquat Mahbub on 11/10/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var locationManager: LocationManager

    var body: some View {
        HeaderView(lastLocationName: $locationManager.lastLocationName)
    }
}

#Preview {
    HomeView(locationManager: LocationManager())
}
