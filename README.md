# KOInject

Simple and lightweight IoC container, works on the register / resolve / dispose pattern with scopes of use and multiple arguments. It also supports lazy and isolated resolving.

## Features

- Support for [Register / Resolve / Dispose](#register--resolve--dispose) pattern with multiple generic arguments.
- Support for [register with scopes of use ](#register-with-scopes) - Possibility to declare lifetime of resolved object by registering it with scope parameter.
- [Lazy resolver](#lazy-resolver) - Possibility to late resolve object only when it is needed. It can be useful for database connection, when we don't want to have opened connection for all lifetime of object.
- [Isolated resolver](#isolated-resolver) - Isolated usage of resolved object, where object is automatically resolved on start of the isolated action and disposed on completed. Usable for all types of transactions.

## Requirements

* iOS 11.0+ / macOS 10.13+ / tvOS 11.0+ / watchOS 4.0+
* Xcode 11.0+
* Swift 5.1

## Installation

KOInject doesn't contains any external dependencies. If you want to stay updated install KOInject by Cocoapods.

### CocoaPods

Add below entry to the target in Podfile
```
pod 'KOInject', '~> 1.0'
```

For example

```
platform :ios, '11.0'
use_frameworks!

target 'Target Name' do
pod 'KOInject', '~> 1.0'
end
```
Install the pods by running

```
pod install
```

### Manually

You can use KOInject manually and change it how you like. One of the simplest way to do that.

1. Download repository.
2. Copy the KOInject.xcodeproj and folder Sources to the your project directory.
3. In project explorer click "Add Files to 'Your project'" -> choose KOInject.xcodeproj. Xcode will add automatically KOInject as a sub-project.
4. In project settings -> Target -> Add embeded library ->  choose Workspace -> KOInject ->  KOInject.framework.
5. If you don't want to build KOInject manually every time when you change something. Go to the Build Phases -> Dependencies -> Add ->  choose Workspace -> KOInject ->  KOInject.framework

## Usage

You need to add following import to the top of the file where you plan to use this framework.

```swift
import KOInject
```

### Register / Resolve / Dispose

1) First register the dependencies that you want to resolve later.

```swift
let container = KOIContainer()
container.register(forType: ApiClientProtocol.self) { _ in
    ApiClient()
}
container.register(forType: DataStorageProtocol.self) { _ in
    DataStorage()
}
```
Fell free to add multiple arguments, so register can look like that.

```swift
container.register(forType: DataStorageProtocol.self) { _, rootPath, clearOnDispose in
    DataStorage(rootPath: rootPath, clearOnDispose: clearOnDispose)
}
```

The first argument is type of KOIResolverProtocol, so you can resolve another dependencies that you need to create new object.

```swift
container.register(forType: GameDetailsViewModelProtocol.self, scope: .separate) { (resolver, game: GameModel) in
    GameDetailsViewModel(apiClient: resolver.resolve()!, game: game)
}
container.register(forType: GameDetailsViewControllerProtocol.self, scope: .separate) { (resolver, game: GameModel) in
    GameDetailsViewController(viewModel: resolver.resolve(arg1: game)!)
}
```
2)  Resolve dependency

```swift
struct GameModel {
    let uuid: String
    let name: String
}
// ...
let game = GameModel(uuid: "123-123-123", name: "TestGame")
let gameDetailsViewController: GameDetailsViewControllerProtocol? = container.resolve(arg1: game)
```

3) Dispose register data when you don't need it.

```swift
container.dispose()
```

### Register with scopes

During register type, you can pass additional scope parameter, that will be determine lifetime of resolved object. 

1) shared - The default scope. Object will be created only once at first resolve. In next resolve's invokes the same object will be used.

```swift
protocol ObjectIdentifiableProtocol {
    var id: String { get }
}

final class ObjectIdentifiable: ObjectIdentifiableProtocol, Identifiable {
    let id: String = UUID().uuidString
}
// ...

container.register(forType: ObjectIdentifiableProtocol.self) { _ in
    ObjectIdentifiable()
}
let object: ObjectIdentifiableProtocol? = container.resolve()
let object2: ObjectIdentifiableProtocol? = container.resolve()
print(object?.id == object2?.id) // prints true
```
2) weakShared - Works like shared, but when there will be no strong reference the object will be deleted.

```swift
container.register(forType: ObjectIdentifiableProtocol.self, scope: .weakShared) { _ in
    ObjectIdentifiable()
}
var object: ObjectIdentifiableProtocol? = container.resolve()
let objectId = object?.id
var object2: ObjectIdentifiableProtocol? = container.resolve()
let objectId2 = object2?.id
print(objectId == objectId2) // prints true

// remove strong's references
object = nil
object2 = nil

// resolve new object
let object3: ObjectIdentifiableProtocol? = container.resolve()
let objectId3 = object3?.id
print(objectId == objectId3) // prints false
```

3) separate - Every time resolve will return the new object.

```swift
container.register(forType: ObjectIdentifiableProtocol.self, scope: .separate) { _ in
    ObjectIdentifiable()
}
let object: ObjectIdentifiableProtocol? = container.resolve()
let object2: ObjectIdentifiableProtocol? = container.resolve()
print(object?.id == object2?.id) // prints false
```

### Lazy resolver

In some situation we don't want to keep the object always alive. Injecting an opened connection of data stream is not the best solution. So we can use, the lazy resolver.

```swift
// register dependencies
let container = KOIContainer()
container.register(forType: DataBaseClientProtocol.self) { (_, rootPath: String) in
    DataBaseClient(rootPath: rootPath)
}
container.register(forType: ViewModelProtocol.self, scope: .separate) { (resolver, rootPath: String) in
    let dataBaseLazyResolver = KOILazyResolverArg1(resolver: resolver, forType: DataBaseClientProtocol.self, arg1: rootPath) // create lazy Resolver
    return ViewModel(dataBaseLazyResolver: dataBaseLazyResolver) // inject it!
}
// ...

final class ViewModel: ViewModelProtocol {
    let dataBaseLazyResolver: KOILazyResolverArg1<DataBaseClientProtocol, String>
    
    init(dataBaseLazyResolver: KOILazyResolverArg1<DataBaseClientProtocol, String>) {
        self.dataBaseLazyResolver = dataBaseLazyResolver
    }
    
    // ...
    func append(data: Data) {
        dataBaseLazyResolver.resolve() // resolve object
        dataBaseLazyResolver.object!.append(data: data) // use it
        dataBaseLazyResolver.dispose() // dispose it
    }
}
```

### Isolated resolver

When we operate with transactions we should have very limited access to them. With isolated resolver you can use resolved object only in isolated action. Isolated resolver is a kind of adapter for lazy resolver.

```swift
// register dependencies
let container = KOIContainer()
container.register(forType: UserBillingProtocol.self, scope: .weakShared) { (_, userId: String) in
    UserBilling(userId: userId)
}
container.register(forType: ViewModelProtocol.self, scope: .separate) { (resolver, userId: String) in
    // create lazy and isolated resolvers
    let lazyResolver = KOILazyResolverArg1(resolver: resolver, forType: UserBillingProtocol.self, arg1: userId)
    let isolatedResolver = KOIIsolatedResolver(lazyResolver: lazyResolver)
    return ViewModel(userBillingIsolatedResolver: isolatedResolver)
}
// ...

final class ViewModel: ViewModelProtocol {
    let userBillingIsolatedResolver: KOIIsolatedResolver<UserBillingProtocol>
    
    init(userBillingIsolatedResolver: KOIIsolatedResolver<UserBillingProtocol>) {
        self.userBillingIsolatedResolver = userBillingIsolatedResolver
    }
    
    // ...
    func add(payment: Payment) {
        // resolve object in isolated action
        userBillingIsolatedResolver.resolve { userBilling in
            userBilling?.add(payment: payment)
        }
    }
}
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
