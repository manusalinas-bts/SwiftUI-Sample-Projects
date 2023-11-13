import Foundation

// MARK: - Environment
enum Environment {
    case development
    case staging
    case qa
    case production

    var baseURL: String {
        "\(urlProtocol)://\(subdomain).\(domain)\(route)"
    }

    var urlProtocol: String {
        switch self {
        case .production:
            return "https"
        default:
            return "http"
        }
    }

    var domain: String {
        switch self {
        case .development, .staging, .qa, .production:
            return "domain.com"
        }
    }

    var subdomain: String {
        switch self {
        case .development:
            return "dev.subdomain"

        case .staging:
            return "test.subdomain"

        case .qa:
            return "qa.subdomain"

        case .production:
            return "prod.subdomain"
        }
    }

    var route: String {
        "/api/v2"
    }
}

extension Environment {
    var host: String {
        "\(self.subdomain).\(self.domain)"
    }
}

// MARK: - Base URL
#if DEBUG
let environment: Environment = Environment.development
#else
let environment: Environment = Environment.staging
#endif

let baseUrl = environment.baseURL

/**
 Note: It depends of Developer preferences to create Path struct in the same file or in separated file.  The idea is to centralize proper baseUrl + environment + methods for easy manipulation and identification
 */
// MARK: - Path
struct Path {
    var signUp: String { return "\(baseUrl)/signUp" }
    var login: String { return "\(baseUrl)/login" }
    var forgotPassword: String { return "\(baseUrl)/forgotPassword" }
    var logout: String { return "\(baseUrl)/logout" }

    // MARK: User module
    struct User {
        var getProfile: String { return "\(baseUrl)/profile" }
        var deleteUser: (Int) -> String = { userID in
            return "\(baseUrl)/profile/\(String(userID))"
        }

        struct Task {
            var getTasks: String { return "\(baseUrl)/tasks" }
            var getTaskDetail: (Int, Int) -> String = { userID, taskID in
                return "\(baseUrl)/profile/\(String(userID))/task/\(String(taskID))"
            }
        }
    }

    // MARK: Feed module
    struct Feed {
        var getFeed: String { return "\(baseUrl)/feed" }
        var deleteFeedItem: (Int) -> String = { itemId in
            return "\(baseUrl)/feed/delete/item/\(String(itemId))"
        }
        var updateFeedItem: (Int) -> String = { itemId in
            return "\(baseUrl)/feed/update/item/\(String(itemId))"
        }
        var getFeedItemDetail: (Int) -> String = { itemId in
            return "\(baseUrl)/feed/detail/item/\(String(itemId))"
        }
    }
}



// MARK: -  Usage of Environment+Path implementation
print("\n* * * * * * *  Environment info * * * * * * ")
print("baseURL:", baseUrl)
print("Domain:", environment.domain)
print("Host:", environment.host)
print("Subdomain:", environment.subdomain)
print("Url Protocol:", environment.urlProtocol)
print("Route:", environment.route)

print("\n* * * * * * *  Main Path methods * * * * * * ")
print("Login path:", Path().login)
print("Sign up path:", Path().signUp)
print("Forgot password path:", Path().forgotPassword)
print("Logout path:", Path().logout)

print("\n* * * * * * *  User methods * * * * * * ")
print("Get User path:", Path.User().getProfile)
print("Delete user path:", Path.User().deleteUser(777))
print("Get tasks path:", Path.User.Task().getTasks)
print("Get task detail path:", Path.User.Task().getTaskDetail(333, 20))

print("\n* * * * * * *  Feed methods * * * * * * ")
print("Get item path:", Path.Feed().getFeed)
print("Delete item path:", Path.Feed().deleteFeedItem(666))
print("Item detail path:", Path.Feed().getFeedItemDetail(666))
print("Update item path:", Path.Feed().updateFeedItem(666))
