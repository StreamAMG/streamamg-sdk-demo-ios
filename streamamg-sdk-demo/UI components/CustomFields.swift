//
//  CustomFields.swift
//  streamamg-sdk-demo
//
//  Created by Franco Driansetti on 22/05/2023.
//

import SwiftUI

struct CustomFieldsView: View {

  @State private var serverURL = ""
  @State private var entryID = ""
  @State private var partnerID = ""
  @State private var contentType = "LIVE"

  var body: some View {
    NavigationView {
      VStack(alignment: .center) {
        TextField("Server URL", text: $serverURL)
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .padding()
          .background(Color(UIColor.systemBackground))
          .cornerRadius(8)

        Button(action: {
          UIPasteboard.general.string = serverURL
        }) {
          Text("Paste from keyboard")
        }
        .padding()
        .background(Color(UIColor.systemBackground))
        .cornerRadius(8)

        TextField("Entry ID", text: $entryID)
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .padding()
          .background(Color(UIColor.systemBackground))
          .cornerRadius(8)

        Button(action: {
          UIPasteboard.general.string = entryID
        }) {
          Text("Paste from keyboard")
        }
        .padding()
        .background(Color(UIColor.systemBackground))
        .cornerRadius(8)

        TextField("Partner ID", text: $partnerID)
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .padding()
          .background(Color(UIColor.systemBackground))
          .cornerRadius(8)

        Text("Stream Type")
        Picker("Content Type", selection: $contentType) {
          Text("LIVE").tag("LIVE")
          Text("VOD").tag("VOD")
        }
        .padding()
        .background(Color(UIColor.systemBackground))
        .cornerRadius(8)

        Button("Save") {
          // TODO: Save the custom fields
        }
        .padding()
        .background(Color(UIColor.systemBackground))
        .cornerRadius(8)
      }
      .navigationBarTitle("Add your streaming")
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

struct CustomFields_Previews: PreviewProvider {
    static var previews: some View {
        CustomFieldsView()
    }
}
