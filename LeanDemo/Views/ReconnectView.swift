//
//  LinkAccountView.swift
//  LeanDemo
//
//  Created by Alex Tomlinson on 24/04/2021.
//

import SwiftUI
import LeanSDK

struct ReconnectView: View {
    @State var reconnectId: String = ""
    @State var isPresented = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(alignment: .leading){
                Image("reconnect")
                    .ignoresSafeArea()
                    .frame(minWidth: 0,
                           maxWidth: .infinity,
                           minHeight: 0,
                           maxHeight: 150,
                           alignment: .center)
                List {
                    VStack(alignment: .leading) {
                        Text("Reconnect")
                            .bold()
                            .padding(.top)
                            .font(.title)
                        Text("Calling the Reconnect function allows you to collect OTPs from your user when a call from the backend returns RECONNECT_REQUIRED.")
                            .padding(.vertical)
                            .foregroundColor(.gray)
                        Text("Note: this is only required for use with the Data API")
                            .padding(.bottom)
                            .foregroundColor(.gray)
                    }
                    TextField("Reconnect ID", text: $reconnectId)
                    FilledButton(title: "Reconnect", action: LeanReconnect)
                }
            }
                
        }.fullScreenCover(isPresented: $isPresented, content: {
            Lean.manager.view.ignoresSafeArea()
        })
    }
    
    func LeanReconnect() {
        isPresented = true
        Lean.manager.reconnect(
            reconnectId: reconnectId,
            success: {
                print("Link Success")
                isPresented = false
            }, error: { (status) in
                print(status)
                isPresented = false
            }
        )
    }
}

struct ReconnectView_Previews: PreviewProvider {
    static var previews: some View {
        ReconnectView()
    }
}
