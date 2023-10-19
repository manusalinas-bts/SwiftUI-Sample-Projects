
# Observable Counter

Getting familiar with `ObservableObject`  and its `@Published` properties. 

`ObservedObject` will be added on reader view 

![Simulator Screen Recording - iPhone 15 Pro - 2023-10-17 at 11 01 01](https://github.com/manuelsalinas-mx/SwiftUI-Samples/assets/110424672/d0e54b85-0c42-47d3-bde0-1ac3f4881148)


# Migrating from the **Observable Object protocol** to the **Observable macro**

### **BEFORE** (Observable Object protocol)
```
class UserProgress: ObservableObject {
    @Published var score = 0
}

struct InnerView: View {
    @ObservedObject var progress: UserProgress

    var body: some View {
        Button("Increase") {
            if progress.score < 21 {
                progress.score += 1
            }
        }
        .buttonStyle(.bordered)
        .tint(.yellow)
        .font(.title2)
    }
}

struct ContentView: View {
    @StateObject var progress = UserProgress()
    
    var body: some View {
        VStack {
            Text("Your score is\n\(progress.score)")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            
            InnerView(progress: progress)
        }
        .padding()
    }
}
```


### **UPDATED (Oct 17, 2023) (Observable macro)**
```
@Observable
class UserProgress {
    var score = 0
}

struct InnerView: View {
    @Bindable var progress: UserProgress

    var body: some View {
        Button("Increase") {
            if progress.score < 21 {
                progress.score += 1
            }
        }
        .buttonStyle(.bordered)
        .tint(.yellow)
        .font(.title2)
    }
}

struct ContentView: View {
    @State var progress = UserProgress()
    
    var body: some View {
        VStack {
            Text("Your score is\n\(progress.score)")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            
            InnerView(progress: progress)
        }
        .padding()
    }
}
```
