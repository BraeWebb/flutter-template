# Dalian Summer 2019 Flutter Template

## Getting Started

Documentation for flutter is available here:
[documentation](https://flutter.io/).

### Prerequisites
To get started, you'll need the following prerequisites:
* IntelliJ Idea or Android Studio
* Flutter and Dart plugins installed on either IntelliJ Idea or Android studio

### Opening The Project
Once IntelliJ is downloaded and installed, the project can be cloned using this command:

`git clone https://github.com/summerprogram2019/flutter-template`

To create a new Flutter project which existing Flutter source code files:

1. In the IDE, click **`Create New Project`** from the 'Welcome' window or **`File > New > Project...`** from the main IDE window.
    - **NOTE**: Do *not* use the **`New > Project from existing sources..`** option for Flutter projects.
2.  Select **`Flutter`** in the menu, and click **`Next`**.
3. Under **`Project location`** enter, or browse to, the directory under which the project is cloned
4. Click **`Finish`**.

## Running Tests
To run the tests the following command can be used:

`flutter test`

Run the command inside the project directory.

## Running Application
To run the application, your IntelliJ/Android Studio should provide you with run button.

Ensure that you have selected the device you want to run it on (this device can be a simulator or a cable connected phone).

Ensure that `main.dart` is selected as the file to run and press the play button.


## Deployment
To deploy to Android, the following command can be used in the project directory

`flutter build apk`, the resulting `.apk` can then be deployed to the Google Play Store.


To deploy to iOS, the following command can be used 

`flutter build ios`, the result `.app` can then be deployed to the Apple Store.

## Project Structure
All the relevant files for running the application can be found inside the `lib` folder.

The top-level `.dart` files in the `lib` directory specify the public interface of each package. i.e. `screens.dart` will define, by `export` statements the public interfaces for the `screens` package.
It is best practice to keep the public interface minimised exporting only what is required between packages.

Everything within the `src` directory inside `lib` is hidden by default. If something within that package needs to be accessed externally it must be exported by one of the top-level files.

Assets are located in the `assets` folder but must also be declared in the pubspec.yaml file

## Stateless vs Stateful Widgets
Flutter uses the concept of state to make the development of user interfaces easier, instead of updating what is displayed manually you update a member variables of a `State` class.

### Stateless
A stateless widget is simple to create, you just create a class and give it a build method, as below.
```dart
/// Custom button widget
class CustomButton extends StatelessWidget {
  /// Construct the custom button
  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      key: Key('fantastic_button'),
      child: Text(hint, style: TextStyle(color: Colors.white)),
      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
      color: Colors.lightBlueAccent,
      elevation: 5.0,
      padding: EdgeInsets.symmetric(vertical: 16.0)
    );
  }
}
```

### Stateful
A stateful widget actually requires two classes, a widget and a state class.
The widget class needs to have a createState method that returns the state class for the widget.
The state class for stateful widgets is the class which has the build method.
```dart
/// Login page for the user.
class LoginPage extends StatefulWidget {
  /// Tag of this screen
  static String tag = "loginPage";

  @override
  _LoginPageState createState() => _LoginPageState();
}

// Sets up the state of the login page
class _LoginPageState extends State<LoginPage> {
  /// determines the currently highlighted widget on the screen
  final FocusNode focus = FocusNode();
  
  // true if the user has started logging in
  bool _loggingIn = false;

  // Handles the validation and database communication which occurs on pressing
  // the login button
  void _pressLogin() {
    // displays the loading icon
    setState(() {
      _loggingIn = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    // the email entry field
    final email = TextFormField(
      key: Key('email_field'),
      keyboardType: TextInputType.emailAddress,
      focusNode: focus,
      controller: emailController,
    );

    // password entry field
    final password = TextFormField(
      key: Key('password_field'),
      autofocus: false,
      obscureText: true,
      controller: passwordController,
    );
    
    final loginButton = bubbleButton("login", "Log In", _pressLogin);

    // assembles the above widgets on the screen to be returned
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              children: <Widget>[
                logo,
                // Sizedboxes are used for whitespace and padding on the screen
                SizedBox(height: 48.0),
                email,
                SizedBox(height: 8.0),
                password,
                SizedBox(height: 24.0),
                loginButton,
              ],
            ),
            new Offstage(
              // displays the loading icon while the user is logging in
              offstage: !_loggingIn,
              child: new Center(
                child: _loggingIn ? new CircularProgressIndicator(
                  value: null,
                  strokeWidth: 7.0,
                ) : null
              )
            )
          ]),
      ),
    );
  }
}
```

In the example above, what content is displayed is controlled by the value of one of the states member variables (`_loggingIn`), when we update this variable by calling setState, it will automatically change what is displayed by the widget.
