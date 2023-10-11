//
//  ContentView.swift
//  LoginFormApp
//
//  Created by Manuel Salinas on 7/26/23.
//

import SwiftUI

struct ContentView: View {
    enum LoginField {
        case username, password
    }
    
    @State private var username = ""
    @State private var password = ""
    @FocusState private var activeField: LoginField?
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Login Form")
                .font(.largeTitle)
                .foregroundStyle(.white)
                .padding([.top, .bottom], 40)
            
            Image(systemName: "apple.logo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .padding([.bottom], 40)
                .foregroundStyle(.white)
            
            VStack(spacing: 15) {
                TextField("Username", text: $username)
                    .focused($activeField, equals: .username)
                    .padding()
                    .background(.white.opacity(0.1))
                    .cornerRadius(10)
                    .foregroundStyle(.white)
                    .tint(.white)
                    .submitLabel(.next)
                
                SecureField("Password", text: $password)
                    .focused($activeField, equals: .password)
                    .padding()
                    .background(.white.opacity(0.1))
                    .cornerRadius(10)
                    .foregroundStyle(.white)
                    .tint(.white)
                    .submitLabel(.done)

            }
            .onSubmit {
                switch activeField {
                case .username:
                    activeField = .password
                case .password:
                    print("execute login request")
                default:
                    print("nothing")
                }
            }
            .padding([.leading, .trailing], 25)
            
            
            Button {
                print("accion")
                activeField = nil
                
            } label: {
                Text("Login")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(.green)
                    .cornerRadius(10)
            }
            .padding()
            
            Spacer(minLength: 230)
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
        )
        .ignoresSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
