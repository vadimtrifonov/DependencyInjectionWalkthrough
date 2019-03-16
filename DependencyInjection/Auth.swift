import Foundation

struct Session: Hashable {
    let descriptrion: String
}

protocol AuthGateway {
    func authenticate() -> Session
}

class DefaultAuthGateway: AuthGateway {
    
    func authenticate() -> Session {
        return Session(descriptrion: "Acquired at runtime")
    }
}
