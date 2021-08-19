//
//  LinkAccountView.swift
//  LeanDemo
//
//  Created by Alex Tomlinson on 24/04/2021.
//

import SwiftUI
import LeanSDK

struct PayView: View {
    @State var paymentIntentId: String = ""
    @State var accountId: String = ""
    @State var isPresented = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(alignment: .leading){
                Image("Pay")
                    .ignoresSafeArea()
                    .frame(minWidth: 0,
                           maxWidth: .infinity,
                           minHeight: 0,
                           maxHeight: 150,
                           alignment: .center)
                List {
                    VStack(alignment: .leading) {
                        Text("Initiate Payment")
                            .bold()
                            .padding(.top)
                            .font(.title)
                        Text("After you have created a Payment Intent - pass it into the Pay method to initiate and complete the transaction")
                            .padding(.vertical)
                            .foregroundColor(.gray)
                    }
                    TextField("Payment Intent ID", text: $paymentIntentId)
                    TextField("Account ID (optional)", text: $accountId)
                    FilledButton(title: "Pay", action: LeanUpdatePaymentSource)
                }
            }
        }.fullScreenCover(isPresented: $isPresented, content: {
            Lean.manager.view.ignoresSafeArea()
        })
    }
    
    func LeanUpdatePaymentSource() {
        isPresented = true
        Lean.manager.pay(
            paymentIntentId: paymentIntentId,
            accountId: accountId.count > 1 ? accountId : nil,
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

struct PayView_Previews: PreviewProvider {
    static var previews: some View {
        PayView()
    }
}
