//
//  LogViewModel.swift
//  WebCrawler
//
//  Created by Andrew Althage on 4/6/24.
//

import Foundation

/// This is the view model for the logs from the Go code.
class LogViewModel: ObservableObject {
    @Published var logs: [LogEntry] = []

    static let instance = LogViewModel()

    private init() {}

    func addLog(_ log: String) {
        DispatchQueue.main.async {
            self.logs.append(LogEntry(log: log))
        }
    }
}

struct LogEntry: Identifiable {
    let id = UUID()
    let log: String
}
