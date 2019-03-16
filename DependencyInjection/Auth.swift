import Foundation

struct Session: Hashable {
    let descriptrion: String
}

class AuthGateway {
    
    func authenticate() -> Session {
        return Session(descriptrion: "Acquired at runtime")
    }
}
