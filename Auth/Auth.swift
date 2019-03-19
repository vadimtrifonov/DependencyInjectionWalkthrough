import Foundation

public struct Session: Hashable {
    public let descriptrion: String
}

public protocol AuthGateway {
    func authenticate() -> Session
}

public class DefaultAuthGateway: AuthGateway {
    
    public init() {}
    
    public func authenticate() -> Session {
        return Session(descriptrion: "Acquired at runtime")
    }
}
