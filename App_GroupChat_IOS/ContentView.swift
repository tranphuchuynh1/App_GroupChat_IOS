//
//  ContentView.swift
//  App_GroupChat_IOS
//
//  Created by Tran Phuc Huynh on 24/11/24.
//

import SwiftUI

@available(iOS 16.0, *)
struct ContentView: View {
    @State var showSignIn: Bool
    
    init(showSignIn: Bool = true) {
        self.showSignIn = AuthManager.shared.getCurrentUser() == nil
    }
    
    @available(iOS 16.0, *)
    var body: some View {
        
        if showSignIn {
            SignInView(showSignIn: $showSignIn)
        } else {
            NavigationStack
            {
                ZStack {
                    ChatView()
                }
                // css cho thanh title cua chatroom
                .navigationTitle("PHÒNG NGUYÊN CỨU KHOA HỌC")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar
                {
                    ToolbarItem( placement: .navigationBarTrailing)
                    {
                        Button
                        {
                            do {
                                try AuthManager.shared.signOut()
                                showSignIn = true
                            } catch {
                                print("logout loi~")
                            }
                        } label:
                        {
                            Text("Logout")
                                .foregroundColor(.red)
                        }
                    }
                }
                
            }
        }
        
        
       
        
    }
}

#Preview {
    if #available(iOS 16.0, *) {
        ContentView()
    } else {
        // Fallback on earlier versions
    }
}
