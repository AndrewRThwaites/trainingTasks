//
//  EmployeeView.swift
//  SwiftUIHelloWorld
//
//  Created by MAC on 26/09/22.
//

import SwiftUI

struct EmployeeView: View {
    
    @State var employeeName: String = ""
    @State var employeeID: String = ""
    @State var employeeMail: String = ""
    @State var employeeImage: String = ""
    // @State var userName: String = ""
    // @State var password: String = ""
    @State var isLogingEnabled = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                Text("Sean Weller").font(.system(size: 36))
                }
                HStack {
                AsyncImage(url: URL(string: "https://www.hackingwithswift.com/img/paul-2.png")) { image in
                    image.resizable()
                } placeholder: {
                    Color.red
                }
                .frame(width: 128, height: 128)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                }
                //Stack {
                    
                    VStack {
                    Text("Enail Address : sean.weller@gmail.com")
                    }
                  
                    VStack {
                    Text("Employee ID : 0345524")
                    }
                //}
                
                /*
                SecureField("Pasword", text: $password)
                    .frame(height: 60.0)
                    .textFieldStyle(.plain)
                    .padding([.horizontal], 10)
                    .overlay(RoundedRectangle(cornerRadius: 16.0).stroke(Color.gray))
                    .padding(16.0).onChange(of: password) { newValue in
                        validateCredentials()
                    }
                */
                Spacer()
                Button {
                    
                } label: {
                    Text("Login")
                }.disabled(!isLogingEnabled)
                
                //Spacer()
            }
            
            .navigationBarTitle("Employee", displayMode: .inline)
        }
    }
    
    func validateCredentials() {
      /*  if userName.count > 3 && password.count > 3 {
            isLogingEnabled = true
        }else {
            isLogingEnabled = false

        }*/
    }
}

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
