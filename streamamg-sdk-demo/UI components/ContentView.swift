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
        NavigationView {
            
          TabView {
            // DemoListView
              DemoListView()
              .tabItem {
                Image(systemName: "video")
                Text("LIVE")
              }
          }
          .tabViewStyle(.automatic)
          .navigationBarTitle("StreamAMG Demo")
          .navigationBarItems(trailing:
            NavigationLink(destination: CustomFieldsView()) {
              Image(systemName: "gear")
            }
          )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

