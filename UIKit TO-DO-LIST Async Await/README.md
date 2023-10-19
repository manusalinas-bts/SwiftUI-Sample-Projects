
# TO-DO UIKit 





## API Reference

#### Get all items

```http
  GET 
  https://gist.githubusercontent.com/rigovides/12708f4aed26f847a0fe34f0fef1dbd7/raw/bb5a9a21f599acb2a46d01f45709d0aeb669f965/items.json
```


## Optimizations

the most important here is how we did conversion from callback function to async/await function 

```
func fetchData<T: Codable>(_ completion: @escaping(Result<T, Error>) -> Void)
```

- withCheckedThrowingContinuation (Automatic Xcode Async wrapper)
```
func fetchToDoTasks() async throws -> [ToDoTask] 
```

- withCheckedThrowingContinuation (Manually using Generics)
```
func fetchData<T: Codable>() async throws -> T
```

- Manually
```
func fetchToDoTasksGeneric<T: Codable>() async throws -> T 
```

![Simulator Screen Recording - iPhone 15 Pro - 2023-10-17 at 10 26 24](https://github.com/manuelsalinas-mx/SwiftUI-Samples/assets/110424672/4f04da84-98c2-4f78-9a2a-aac80ba1917b)





