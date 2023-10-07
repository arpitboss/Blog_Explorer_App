# Blog_Explorer_App

## Table of Contents

- [Description](#description)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [Code Style and Guidelines](#code-style-and-guidelines)

## Description

Blog Explorer is a Flutter app that allows you to explore and read various blogs from different sources. Whether you're a blogger or just someone looking for interesting content, this app provides a user-friendly interface to discover and read blogs on various topics.

## Features
- API Integration :
 Used Flutter to fetch data from the provided API using the provided curl request.
- Blog List View :
    > Created a screen that displays a list of blogs.

    > Each blog item shows the blog's title and an image associated with it.

    > Tapping on a blog item navigates to a detailed view of that blog.
- Detailed Blog View :
 Implemented a screen that shows the full details of a selected blog, including its title and image.
- Interactive Features :
    > Added interactivity to the app by including the following features:

    > Allow users to mark a blog as a favorite.
- State Management :
 Utilized Flutter's state management solution `Riverpod` to manage the app's state efficiently.
- Error Handling :
 Implemented error handling to gracefully handle cases where the API is unavailable or returns an error. Displays a friendly error message to the user.
- Offline Mode :
Implemented offline support using Flutter's local storage `SQfLite` so that users can still access and interact with blogs when they are not connected to the internet.

## Installation

To run this app on your local machine, follow these steps:

1. **Clone the repository**:

   ```bash
   git clone https://github.com/arpitboss/Blog_Explorer_App.git

2. **Navigate to the project directory**:
   ```bash
   cd Blog_Explorer_App
3. **Install dependencies**:
   ```bash
   flutter pub get
4. **Run the app**:
   ```bash
   flutter run
> Ensure you have Flutter installed and configured properly on your system.

## Usage
- Launch the app on your device or emulator.
- Browse the list of available blogs.
- Tap on a blog to read its contents.
- Use the bookmark feature to save your favorite blogs for offline reading.

## Contributing

Thank you for considering contributing to the Blog Explorer app! Contributions make this project better and are highly appreciated. Below are some guidelines to help you get started:

### How to Contribute

1. Fork the repository to your GitHub account.
2. Clone the forked repository to your local machine:

   ```bash
   git clone https://github.com/arpitboss/Blog_Explorer_App.git
3. Create a new branch for your contribution:
   ```bash
   git checkout -b feature-or-bugfix-name
4. Make your changes, improvements, or bug fixes in the branch.
5. Test your changes thoroughly to ensure they work as expected.
6. Commit your changes with a clear and descriptive commit message:
   ```bash
   git commit -m "Description of your changes"
7. Push your changes to your forked repository:
   ```bash
   git push origin feature-or-bugfix-name
8. Create a pull request (PR) to the main repository. Be sure to provide a clear description of your changes in the PR.

## Code Style and Guidelines
Please follow the existing code style and guidelines in the project. Adhering to consistent code style makes it easier for everyone to read and maintain the code.

