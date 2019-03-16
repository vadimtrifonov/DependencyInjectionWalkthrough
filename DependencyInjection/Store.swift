import Foundation

class Store {
    static let shared = Store()
    
    // Simulates session-based persistent store (e.g., database)
    private var state: [Session: String] = [:]
    
    func save(session: Session, state: String) {
        self.state[session] = state
    }
    
    func retrieve(session: Session) -> String? {
        return state[session]
    }
}
