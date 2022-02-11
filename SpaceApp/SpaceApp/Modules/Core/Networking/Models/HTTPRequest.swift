import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

public enum HTTPRequestParameters {
    case body([String: Any])
    case urlQuery([String: String])
    case bodyData(Data)
    case requestPlain
}

public protocol HTTPRequestType {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: HTTPRequestParameters { get }
    var headers: [String: String]? { get }
}

public extension HTTPRequestType {
    var parameters: HTTPRequestParameters { .requestPlain }
    var headers: [String: String]? { nil }
}

public struct AnyHTTPRequest: HTTPRequestType {
    public let baseURL: URL
    public let path: String
    public let method: HTTPMethod
    public let parameters: HTTPRequestParameters
    public let headers: [String: String]?

    public init(
        baseURL: URL,
        path: String = "",
        method: HTTPMethod,
        parameters: HTTPRequestParameters = .requestPlain,
        headers: [String: String]? = nil
    ) {
        self.baseURL = baseURL
        self.path = path
        self.method = method
        self.parameters = parameters
        self.headers = headers
    }
}

