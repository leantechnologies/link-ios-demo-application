//
//  LinkAccountView.swift
//  LeanDemo
//
//  Created by Alex Tomlinson on 24/04/2021.
//

import SwiftUI
import LeanSDK

struct UpdatePaymentSourceView: View {
    @State var customerId: String = ""
    @State var paymentSourceId: String = ""
    @State var paymentDestinationId: String = ""
    @State var isPresented = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(alignment: .leading){
                Image("UPS")
                    .ignoresSafeArea()
                    .frame(minWidth: 0,
                           maxWidth: .infinity,
                           minHeight: 0,
                           maxHeight: 150,
                           alignment: .center)
                List {
                    VStack(alignment: .leading) {
                        Text("Update Payment Source")
                            .bold()
                            .padding(.top)
                            .font(.title)
                        Text("To route funds from a Customer bank account to multiple destinations, you need to update a payment source for each new destination.")
                            .padding(.vertical)
                            .foregroundColor(.gray)
                    }
                    TextField("Customer ID", text: $customerId)
                    TextField("Payment Source ID", text: $paymentSourceId)
                    TextField("Payment Destination ID", text: $paymentDestinationId)
                    FilledButton(title: "Update Payment Source", action: LeanUpdatePaymentSource)
                }
            }
                
        }.fullScreenCover(isPresented: $isPresented, content: {
            Lean.manager.view.ignoresSafeArea()
        })
    }
    
    func LeanUpdatePaymentSource() {
        isPresented = true
        Lean.manager.updatePaymentSource(
            customerId: customerId,
            paymentSourceId: paymentSourceId,
            paymentDestinationId: paymentDestinationId,
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

struct UpdatePaymentSource_Previews: PreviewProvider {
    static var previews: some View {
        UpdatePaymentSourceView()
    }
}
