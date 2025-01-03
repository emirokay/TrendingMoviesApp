# TrendingMoviesApp

A Swift/SwiftUI-based iOS application that fetches and displays trending movies and TV shows using The Movie Database (TMDb) API. The app provides an engaging interface to explore popular titles with detailed information, including descriptions, ratings, and release dates. Users can also save their favorite titles for future reference.

## Screen Recording
https://github.com/user-attachments/assets/cb8a5a2d-c074-4aa3-bb1d-60a011353f94

## Features
- **Browse Trending Titles**:
  - Displays trending movies and TV shows fetched dynamically from TMDb.
  - Titles are presented in categorized, scrollable lists for easy navigation.

- **Detailed Information**:
  - View details for each title, such as:
    - Title
    - Description
    - Release date
    - Average rating

- **Favorites Management**:
  - Add movies and TV shows to a favorites list for quick access.
  - Easily manage the favorites list with a dedicated view.

- **Interactive and Dynamic UI**:
  - Smooth navigation between trending lists and detailed views using `NavigationView` and `NavigationLink`.
  - Custom animations and gestures enhance user experience.

- **Real-Time Data Fetching**:
  - Implements RESTful API communication using `URLSession` for fetching data.
  - Efficiently handles API calls with Swift’s `async/await` concurrency model.

- **Adaptive Design**:
  - Ensures a responsive layout using `HStack`, `VStack`, and `ZStack`.
  - Provides a seamless experience across various iPhone models.

## Technologies Used
- **Language**: Swift
- **Framework**: SwiftUI
- **API Communication**: RESTful API integration with `URLSession`
- **Concurrency**: `async/await` for non-blocking tasks
- **Data Handling**: Codable for parsing JSON responses
- **State Management**: `@State`, `@ObservedObject`, `@EnvironmentObject`
- **Architecture**: MVVM (Model-View-ViewModel)

## Project Structure
- **Models**:
  - Defines data structures for movies and TV shows, conforming to `Codable` for seamless JSON parsing.
  - Uses `Enums` and `Optionals` to represent app states and prevent runtime crashes.

- **ViewModels**:
  - `TrendingViewModel`: Fetches and processes trending movies and TV shows from the TMDb API.
  - `FavoritesViewModel`: Manages the user’s favorite titles with persistent local storage.

- **Views**:
  - `ContentView`: Entry point for the app, connecting the different views.
  - `TrendingView`: Displays trending titles in categorized lists.
  - `DetailView`: Shows detailed information for a selected title.
  - `FavoritesView`: Dedicated view for managing and accessing favorite titles.
  - `SideScrollView`: Custom component for horizontal scrolling of trending titles.
  - `LoadingView`: Displays a loading indicator during API calls.
  - `AddedIndicatorView`: Provides feedback when a title is added to favorites.

- **Helpers**:
  - `WebService`: Handles API communication with TMDb.
  - `NetworkService`: Encapsulates network operations.
  - `Constants`: Stores API keys and endpoint URLs for easy configuration.

## How It Works
1. **Trending Movies and TV Shows**:
   - Fetches trending titles dynamically from TMDb using RESTful API communication.
   - Presents the data in categorized lists for movies and TV shows.

2. **Favorites Management**:
   - Allows users to save and manage their favorite movies and TV shows.
   - Persistently stores the favorites list for easy access across app sessions.

3. **Detailed Views**:
   - Displays comprehensive information for a selected movie or TV show, including descriptions and ratings.

4. **Dynamic State Management**:
   - Utilizes SwiftUI’s state management features (`@State`, `@ObservedObject`) to update the UI in real-time.

5. **Asynchronous Data Handling**:
   - Implements `async/await` for efficient and non-blocking API requests.

## Getting Started

### Prerequisites
- **Xcode**: Version 12.0 or higher
- **iOS**: Deployment target of iOS 14.0 or higher
- **macOS**: Version 10.15 or higher

### Steps

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/emirokay/TrendingMoviesApp.git
2. Navigate to the Project Directory:
	```bash
	cd MoviesApp
3. Add Your TMDb API Key:
- Open Constants.swift.
- Replace ?api_key= with your TMDb API key:
	```bash
	static let apiKey = "?api_key=your_api_key_here"
4. Open in Xcode:
	```bash
	open MoviesApp.xcodeproj
5. Build and Run:
- Select a simulator or connect a physical device.
- Click the 'Run' button in Xcode to build and launch the ap

## Requirements
- **Xcode**: Version 12.0 or higher
- **iOS**: Deployment target of iOS 14.0 or higher
- **TMDb API Key**: A valid API key from [The Movie Database (TMDb)](https://www.themoviedb.org/) is required to fetch trending movies and TV shows.
  - Add the API key in the `Constants.swift` file:
    ```swift
    static let apiKey = "?api_key=your_api_key_here"
    ```

## Contributing
Contributions are welcome! Please fork the repository and submit a pull request with your proposed changes.

## License
This project is licensed under the MIT License. See the LICENSE file for details.

## Screenshots
<img width="444" alt="Screenshot 2024-11-27 at 22 44 18" src="https://github.com/user-attachments/assets/4e14b40e-7f9a-42b5-88e2-6a93824ecbb0">
<img width="444" alt="Screenshot 2024-11-27 at 22 44 23" src="https://github.com/user-attachments/assets/11201f37-4a1b-4577-8394-96e3555fc944">
<img width="444" alt="Screenshot 2024-11-27 at 22 44 30" src="https://github.com/user-attachments/assets/48975481-994c-443e-bd6a-cbc5651545e3">
<img width="444" alt="Screenshot 2024-11-27 at 22 44 36" src="https://github.com/user-attachments/assets/093392f2-ef3b-4da9-b7f7-3be3555e264a">
<img width="444" alt="Screenshot 2024-11-27 at 22 44 55" src="https://github.com/user-attachments/assets/944376fa-96cb-4ee1-a6aa-d9c001409e76">
<img width="444" alt="Screenshot 2024-11-27 at 22 45 20" src="https://github.com/user-attachments/assets/067f52c0-aa6c-4838-8a8a-69ef414785e5">
<img width="444" alt="Screenshot 2024-11-27 at 22 45 24" src="https://github.com/user-attachments/assets/4aca7106-7937-46dd-ae2b-4e4adcb384e0">
<img width="444" alt="Screenshot 2024-11-27 at 22 45 39" src="https://github.com/user-attachments/assets/cb6d617a-8c0e-42ce-9f5f-f57c3af01162">
