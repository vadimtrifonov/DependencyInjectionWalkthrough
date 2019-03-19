import Foundation

public protocol Store {
    func save(state: String)
    func retrieve() -> String?
}

public class DefaultStore: Store {
    private let session: Session
    
    // Simulates session-based persistent store (e.g., database)
    private var state: [Session: String] = [:]
    
    public init(session: Session) {
        self.session = session
    }
    
    public func save(state: String) {
        self.state[session] = state
    }
    
    public func retrieve() -> String? {
        return state[session]
    }
}
