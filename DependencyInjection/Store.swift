import Foundation

class Store {
    private let session: Session
    
    // Simulates session-based persistent store (e.g., database)
    private var state: [Session: String] = [:]
    
    init(session: Session) {
        self.session = session
    }
    
    func save(state: String) {
        self.state[session] = state
    }
    
    func retrieve() -> String? {
        return state[session]
    }
}
