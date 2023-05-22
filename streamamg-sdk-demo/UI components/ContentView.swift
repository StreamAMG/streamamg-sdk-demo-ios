//
//  ContentView.swift
//  streamamg-sdk-demo
//
//  Created by Franco Driansetti on 18/05/2023.
//

import SwiftUI
import StreamAMGSDK

struct ContentView: View {
    var body: some View {
        // Other views or components
        AMGPlayerView()
            .aspectRatio(16/9, contentMode: .fit)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
