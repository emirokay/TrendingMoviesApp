This project is an iOS application built using Swift, leveraging Structs and Enums for defining models and representing app states, while using Optionals to prevent runtime crashes. For the user interface, the app is developed with SwiftUI, where UI elements such as Text, Image, List, and NavigationView are composed declaratively. The app utilizes powerful state management techniques with @State, @Binding, @ObservedObject, and @EnvironmentObject to create dynamic and interactive interfaces. It ensures responsive design across various screen sizes with layout stacks like HStack, VStack, and ZStack, along with animations and gestures for a rich user experience.

The app fetches trending movies and TV shows from The Movie Database (TMDb) API, implementing RESTful API communication using Swift’s URLSession to send HTTP requests and parse JSON responses. It handles asynchronous network calls efficiently with Swift’s async/await, and parses data using the Codable protocol to map API data into custom model such as Result. The project follows the Model-View-ViewModel (MVVM) architectural pattern, where the Model represents the data fetched from the API, the View is the SwiftUI interface bound to state changes, and the ViewModel handles business logic and transforms raw data for the UI.

Core Swift features such as Concurrency are utilized for non-blocking tasks like fetching API data without freezing the main thread, and Property Wrappers are employed to manage state effectively. The app features dynamic and adaptive layouts, providing a seamless experience on different iPhone models. NavigationView and NavigationLink facilitate smooth navigation between screens, allowing users to explore detailed information about movies and TV shows. The use of custom UI components enhances the overall user experience and interaction.

Screen recording of the project is available in the files.

Note: The API key must be added after the equals sign "?api_key=" in the Constants file.
Example: static let apiKey = "?api_key=asd123qwe456"

