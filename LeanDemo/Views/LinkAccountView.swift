//
//  LinkAccountView.swift
//  LeanDemo
//
//  Created by Alex Tomlinson on 24/04/2021.
//

import SwiftUI
import LeanSDK

struct LinkAccountView: View {
    @State var customerId: String = ""
    @State var bankId: String = ""
    @State var isPresented = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(alignment: .leading){
                Image("link")
                    .ignoresSafeArea()
                    .frame(minWidth: 0,
                           maxWidth: .infinity,
                           minHeight: 0,
                           maxHeight: 150,
                           alignment: .center)
                List {
                    VStack(alignment: .leading) {
                        Text("Link Account")
                            .bold()
                            .padding(.top)
                            .font(.title)
                        Text("Calling the Link function allows you to easily guide users through connecting a bank account, gaining the required permissions to access their identity, account, balance and transaction data.")
                            .padding(.vertical)
                            .foregroundColor(.gray)
                        Text("Note: this is only required for use with the Data API")
                            .padding(.bottom)
                            .foregroundColor(.gray)
                    }
                    TextField("Customer ID", text: $customerId)
                    TextField("Bank ID", text: $bankId)
                    FilledButton(title: "Link Account", action: LeanLink)
                }
            }
        }.fullScreenCover(isPresented: $isPresented, content: {
            Lean.manager.view.ignoresSafeArea()
        })
    }
    
    func LeanLink() {
        isPresented = true
        print(bankId.count)
        Lean.manager.link(
            customerId: customerId,
            permissions: [LeanPermission.Accounts, LeanPermission.Balance, LeanPermission.Transactions],
            bankId: nil,
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

struct LinkAccountView_Previews: PreviewProvider {
    static var previews: some View {
        LinkAccountView()
    }
}
