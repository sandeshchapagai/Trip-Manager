# Trip Manager

A mobile application to help groups manage and split expenses during trips. The app also includes features for setting reminders, navigating to locations, and sharing posts about the trip.

## Table of Contents

- [Features](#features)
- [Screenshots](#screenshots)
- [Technologies Used](#technologies-used)
- [Getting Started](#getting-started)
- [Setup](#setup)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Features

- **Expense Management**: Add and track expenses for each trip, and split costs among group members.
- **Reminders**: Set reminders for important tasks or items to bring along on the trip.
- **Navigation**: Integrate with maps to provide navigation to various trip locations.
- **Posts**: Create and share posts about the trip.
- **User Management**: Users can create accounts and join trips.

## Screenshots

*(Include some screenshots of your app to give users a visual overview. If you haven't taken any yet, consider adding some images showing the main screens of the app.)*

## Technologies Used

- **Frontend**: Flutter
- **Backend**: Node.js
- **Database**: *(Specify your database, e.g., MongoDB, Firebase)*
- **Design**: Figma

## Getting Started

These instructions will help you set up and run the project on your local machine for development and testing purposes.

### Prerequisites

- Flutter SDK
- Node.js
- *(Other tools/libraries needed, e.g., MongoDB, Firebase CLI)*

### Setup

1. **Clone the repository:**
    ```bash
    git clone https://github.com/yourusername/trip-manager.git
    cd trip-manager
    ```

2. **Install dependencies:**

    - For the frontend:
        ```bash
        flutter pub get
        ```
    
    - For the backend:
        ```bash
        cd backend
        npm install
        ```

3. **Set up environment variables:**
    - Create a `.env` file in the backend directory with the required configurations (e.g., database URL, API keys).

4. **Run the backend server:**
    ```bash
    npm start
    ```

5. **Run the Flutter app:**
    ```bash
    flutter run
    ```

## Usage

1. **Sign Up/Login:** Users can sign up or log in to the app.
2. **Create or Join a Trip:** Create a new trip or join an existing one.
3. **Manage Expenses:** Add, edit, and view expenses for the trip.
4. **Set Reminders:** Add reminders for tasks or items to bring.
5. **Navigate:** Use the navigation feature to get directions to trip locations.
6. **Create Posts:** Share posts and memories of the trip with other users.

## Contributing

Contributions are welcome! Please follow these steps to contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/YourFeature`).
3. Make your changes.
4. Commit your changes (`git commit -m 'Add some feature'`).
5. Push to the branch (`git push origin feature/YourFeature`).
6. Open a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
