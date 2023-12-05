//
//  ContentView.swift
//  SwiftFileBuffer
//
//  Created by Nicky Taylor on 12/5/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var verificationTool = VerificationTool()
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 12.0) {
                HStack {
                    Spacer()
                    TextField("Relative File Path", text: $verificationTool.relativePath)
                        .frame(width: 300.0)
                        .textFieldStyle(.roundedBorder)
                    Spacer()
                }
                
                HStack(spacing: 12.0) {
                    Spacer()
                    Button {
                        verificationTool.save()
                    } label: {
                        HStack {
                            Spacer()
                            Text("Save")
                            Spacer()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .frame(width: 300.0 / 2.0 - 8.0)
                    Button {
                        verificationTool.load()
                    } label: {
                        HStack {
                            Spacer()
                            Text("Load")
                            Spacer()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .frame(width: 300.0 / 2.0 - 8.0)
                    Spacer()
                }
            }
            .frame(width: 320.0)
            .padding(.horizontal, 16.0)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
