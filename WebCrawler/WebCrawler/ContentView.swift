//
//  ContentView.swift
//  WebCrawler
//
//  Created by Andrew Althage on 4/6/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var logViewModel = LogViewModel.instance

//    // Define the callback function
//    let logCallback: @convention(c) (UnsafePointer<CChar>?) -> Void = { cString in
//        if let cString = cString {
//            let logMessage = String(cString: cString)
//            LogViewModel.instance.addLog(logMessage)
//        }
//    }
//
//    func registerLogCallback() {
    ////        let callbackPointer = UnsafeMutableRawPointer(bitPattern: Int(bitPattern: logCallback))
    ////        RegisterLogCallback(callbackPointer)
//        let pointerToCallback = unsafeBitCast(logCallback, to: UnsafeMutableRawPointer.self)
//        RegisterLogCallback(pointerToCallback)
//    }

//    let logCallback: @convention(c) (UnsafePointer<CChar>?) -> Void = { cString in
//        if let cString = cString {
//            let logMessage = String(cString: cString)
//            logViewModel.addLog(logMessage)
//        }
//    }

    var body: some View {
        VStack {
            Text("Web Crawler")
                .font(.title)
                .padding()
            Divider()
            VStack {
                if logViewModel.logs.isEmpty {
                    Text("No logs to display")
                } else {
                    List {
                        ForEach(logViewModel.logs, id: \.id) { entry in
                            Text(entry.log)
                        }
                    }
                }

            }.padding()
            Divider()
            Button("Press Me") {
                let myString = "Message from Swift to Go!"
                if let cString = myString.cString(using: .utf8) {
                    let mutableCPointer = UnsafeMutablePointer(mutating: cString)
                    let result = SayHello(mutableCPointer)

                    let val = String(cString: result!)
                    print(val)

                    logViewModel.addLog(val)
                }
            }
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .padding()
    }
}

#Preview {
    ContentView()
}
