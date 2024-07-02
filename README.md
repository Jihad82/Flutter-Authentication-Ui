<h1>Authentication Mobile App</h1>
    <p>This repository contains the source code for a Flutter mobile application that implements user authentication and profile management using Firebase and GetX.</p>
    
  <h2>Features</h2>
    <ul>
        <li><strong>User Authentication:</strong>
            <ul>
                <li>Login</li>
                <li>Signup</li>
                <li>Email Verification</li>
                <li>Forgot Password</li>
                <li>Logout</li>
            </ul>
        </li>
       
<h2> Inside App</h2>
    <p align="center">
        <img src="https://github.com/Jihad82/Flutter-Authentication-Ui/assets/91656309/ead7ea58-20a8-4cfa-a520-36c55bd3f184" alt="Image 1" width="150">
        <img src="https://github.com/Jihad82/Flutter-Authentication-Ui/assets/91656309/64f769a2-97e4-4668-a52c-f61ec1c01bf2" alt="Image 2" width="150">
        <img src="https://github.com/Jihad82/Flutter-Authentication-Ui/assets/91656309/27d30f0d-61d5-43b9-9faa-09a1bde2c2de" alt="Image 3" width="150">
        <img src="https://github.com/Jihad82/Flutter-Authentication-Ui/assets/91656309/1236e0ab-f244-4c94-8e9a-bc4d17c05d46" alt="Image 4" width="150">
</p>

  <h2>Getting Started</h2>
    
  <h3>Prerequisites</h3>
    <ol>
        <li><strong>Flutter:</strong> Install Flutter from <a href="https://flutter.dev/docs/get-started/install">https://flutter.dev/docs/get-started/install</a>.</li>
        <li><strong>Firebase:</strong> Create a Firebase project from <a href="https://console.firebase.google.com/">https://console.firebase.google.com/</a>.</li>
        <li><strong>GetX:</strong> Install the GetX package by running <code>flutter pub add get</code>.</li>
        <li><strong>GetStorage:</strong> Install the GetStorage package by running <code>flutter pub add get_storage</code>.</li>
    </ol>
    
   <h3>Firebase Setup</h3>
    <ol>
        <li><strong>Firebase Project Setup:</strong>
            <ul>
                <li>Create a new Firebase project or use an existing one.</li>
                <li>Add a new Android or iOS application to your Firebase project.</li>
                <li>Download the <code>google-services.json</code> (Android) or <code>GoogleService-Info.plist</code> (iOS) file and place it in the appropriate location in your project.</li>
            </ul>
        </li>
        <li><strong>Firebase Authentication Setup:</strong>
            <ul>
                <li>Enable "Email/Password" authentication in your Firebase project.</li>
            </ul>
        </li>
        <li><strong>Firebase Storage Setup (for profile pictures):</strong>
            <ul>
                <li>Enable Firebase Storage in your Firebase project.</li>
            </ul>
        </li>
    </ol>
    
   <h3>Project Setup</h3>
    <ol>
        <li><strong>Clone the repository:</strong>
            <pre><code>git clone https://github.com/Jihad82/Flutter-Authentication-Ui.git</code></pre>
        </li>
        <li><strong>Install dependencies:</strong>
            <pre><code>flutter pub get</code></pre>
        </li>
        <li><strong>Configure Firebase:</strong>
            <p>Replace the placeholder Firebase configuration values in <code>lib/firebase_options.dart</code> with the actual values from your Firebase project.</p>
        </li>
        <li><strong>Run the app:</strong>
            <pre><code>flutter run</code></pre>
        </li>
    </ol>
    
  <h2>Project Structure</h2>
    <pre>
authentication-mobile-app
├── lib
│   ├── auth
│   │   └── auth_repository.dart
│   ├── models
│   │   └── user.dart
│   ├── services
│   │   └── auth_service.dart
│   ├── screens
│   │   ├── login_screen.dart
│   │   ├── signup_screen.dart
│   │   ├── forgot_password_screen.dart
│   │   ├── home_screen.dart
│   │   └── profile_screen.dart
│   ├── utils
│   │   └── app_constants.dart
│   ├── main.dart

  </pre>
    
   <h2>Contributing</h2>
    <p>Contributions are welcome! Please feel free to open an issue or submit a pull request.</p>
    
  <h2>License</h2>
    <p>This project is licensed under the MIT License. See the LICENSE file for details.</p>
    
  <p><strong>Remember to:</strong></p>
    <ul>
        <li>Replace <code>yourusername</code> with your actual GitHub username in the <code>git clone</code> command.</li>
        <li>Fill in the actual Firebase configuration values in <code>lib/firebase_options.dart</code>.</li>
        <li>Add any specific instructions or information that is relevant to your project, such as how to configure the app for different platforms or how to use specific features.</li>
    </ul>
    
  <p>This HTML provides a solid foundation for your project. Feel free to customize it further to better reflect the specifics of your mobile application.</p>
</body>
</html>
