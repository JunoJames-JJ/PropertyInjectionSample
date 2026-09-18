# Property Injection Sample

A simple iOS project demonstrating **property injection** in Swift - a lightweight dependency injection technique using a Singleton-based API client.

## What Is Property Injection?

Property injection is a dependency injection style where a dependency is provided through a **settable property**, rather than through an initializer (constructor injection). It's a simple way to give a class access to a dependency after it's already been created - useful when you want the flexibility to swap that dependency out later (for example, replacing a real API client with a mock in tests).

## Components

1. **`ApiClient`** - a singleton responsible for handling login requests, returning a `loggedUserIn` struct on success.
2. **`LoginViewController`** - depends on `ApiClient` through a plain property (`var api = ApiClient.instance`), rather than requiring it in an initializer. This is the property injection in action - `api` can be reassigned at any point after the view controller is created.

## How It Works

```swift
class LoginViewController: UIViewController {
    // Property Injection
    var api = ApiClient.instance

    func didTapLoginButton() {
        api.login { user in
            print("Logged in as \(user.username)")
        }
    }
}
```

Because `api` is a mutable property rather than a value locked in at initialization, it can be swapped out from outside the class - for example, assigning a mock or test-specific implementation - without changing `LoginViewController`'s internals.

## Tech Stack

- Swift
- UIKit

## Why This Pattern Matters

Property injection is one of the simplest ways to introduce testability and flexibility into a class that relies on a shared or singleton dependency, without the added complexity of a full dependency injection framework.
