# Star Wars Movie App

## Description

Star Wars enthusiasts deserve a dedicated mobile app to explore the vast galaxy of Star Wars movies. The app provides a user-friendly interface presenting a list of Star Wars movies, allowing users to access detailed information by selecting a specific title from the main list.

## Features

- Display a list of Star Wars movies.
- Allow users to select a movie for more detailed information.
- Utilize the Star Wars API for up-to-date and accurate content.



## Getting Started

1. Ensure Flutter is installed on your machine. If not, follow the [official Flutter installation guide](https://flutter.dev/docs/get-started/install).
2. Clone the repository.
3. Run `flutter pub get` to install dependencies.
4. Execute `flutter run` to launch the Star Wars Movie App on your emulator or physical device.

## Design

Refer to the provided Figma Design link for detailed information on assets, fonts, and layouts.

### Figma Design for Android
[Android Figma Design](https://www.figma.com/file/bETEiO2G6UuAoXpIB09vNJ/Thinki-it-Mobile-(Android)?node-id=5%3A75&mode=dev)



### Screenshots


![Screenshot of the SplashScreen interface](screenshots/SplashScreen.png)


![Screenshot of the people interface](screenshots/people.png)


![Screenshot of the film_details interface](screenshots/film_details.png)


### Videos

<video width="320" height="240" controls>
  <source src="videos/Star-Wars.mp4" type="video/mp4">
  Your browser does not support the video tag.
</video>

## API Information

The app fetches movie data from the public Star Wars API. For API documentation and usage details, visit [Star Wars API](https://swapi.dev/).

## Pubspec.yaml

Here is a snippet from the `pubspec.yaml` file to give you an overview of project dependencies:

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
  http: ^0.13.3
  flutter_screenutil: ^5.9.0
  auto_size_text: ^3.0.0
  intl: ^0.19.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.0

flutter:
  uses-material-design: true
  assets:
    - assets/
  fonts:
    - family: Archivo
      fonts:
        - asset: fonts/Archivo-Regular.ttf
