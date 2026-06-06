# AstroNerds 🔭

> **A social media platform built exclusively for astronomy enthusiasts.**  
> Share discoveries, engage with the community, explore the cosmos — all in one app.

📱 **Prototype**: [View on Google Drive](https://drive.google.com/file/d/16Eg9Ohk6BVQ1EmcDGIp50o-vpDYyoSmv/view?usp=share_link)

---

## Overview

AstroNerds is a Flutter-based mobile application that combines the core features of a social network with tools specific to the astronomy community. Users can post content, watch videos, view 3D celestial models, read PDFs, interact with an AI assistant, and explore augmented reality — all within a single app backed by Firebase.

---

## Features

- **Social Feed** — post text, images, and videos; like, comment, and share with the community
- **Firebase Authentication** — email/password and social sign-in with `email_auth`
- **AI Chat Assistant** — integrated ChatGPT SDK for astronomy Q&A and in-app guidance
- **Augmented Reality** — AR view of celestial objects via `augmented_reality_plugin`
- **3D Model Viewer** — render `.glb` 3D models using BabylonJS (`babylonjs_viewer`)
- **Video Playback** — full-featured video player with `chewie` + `better_player`
- **PDF Viewer** — read astronomy documents and papers in-app via Syncfusion PDF Viewer
- **WebView** — embedded browser for external astronomy resources
- **Image Upload** — pick and upload images to Firebase Storage
- **File Sharing** — attach and share files with `file_picker`
- **Real-time Data** — live updates via Firebase Realtime Database and Cloud Firestore
- **State Management** — powered by GetX for reactive state and routing
- **Glow UI Effects** — space-themed visuals using `flutter_glow`
- **Lottie Animations** — smooth animated onboarding and loading screens

---

## Tech Stack

| Layer | Technology |
|---|---|
| Framework | Flutter (Dart SDK `>=2.19.0 <3.0.0`) |
| State Management | GetX `^4.6.5` |
| Backend / Auth | Firebase Auth, Cloud Firestore, Firebase Storage, Realtime Database |
| AI | ChatGPT SDK (Flutter-ChatGPT via Git) |
| Augmented Reality | `augmented_reality_plugin ^4.0.1` |
| 3D Rendering | `babylonjs_viewer ^1.1.4` |
| Video | `video_player`, `chewie`, `better_player` |
| PDF | `syncfusion_flutter_pdfviewer` |
| WebView | `webview_flutter ^2.8.0` |
| Image / File | `image_picker`, `file_picker`, `cached_network_image` |
| Networking | `http ^0.13.5` |
| Animations | `lottie`, `flutter_glow` |
| UI Utilities | `sizer`, `velocity_x`, `rflutter_alert`, `fluttertoast` |
| Environment | `flutter_dotenv` |

---

## Project Structure

```
astronerds/
├── lib/              # Main Dart source (screens, controllers, models, services)
├── assets/           # Images, Lottie JSON files
│   └── glbs/         # 3D .glb model files for BabylonJS viewer
├── android/          # Android platform files
├── test/             # Widget and unit tests
├── pubspec.yaml      # Dependencies and asset declarations
└── analysis_options.yaml
```

---

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (Dart `>=2.19.0`)
- Android Studio or Xcode
- A Firebase project with the following services enabled:
  - Authentication
  - Cloud Firestore
  - Firebase Storage
  - Realtime Database

### Installation

1. **Clone the repository**

```bash
   git clone https://github.com/ashafio/astronerds.git
   cd astronerds
```

2. **Install dependencies**

```bash
   flutter pub get
```

3. **Configure environment variables**

   Create a `.env` file in the project root:

```env
   OPENAI_API_KEY=your_openai_api_key
```

4. **Configure Firebase**

   Add your `google-services.json` (Android) to `android/app/`. For iOS, add `GoogleService-Info.plist` to `ios/Runner/`.

5. **Run the app**

```bash
   flutter run
```

---

## Architecture

AstroNerds follows the **GetX MVC pattern**:

```
lib/
├── models/           # Data models (Post, User, Comment, etc.)
├── controllers/      # GetX controllers (reactive state, business logic)
├── views/            # Screens and widgets
├── services/         # Firebase, API, and storage service wrappers
└── main.dart         # App entry point, Firebase initialisation
```

- **GetX** handles routing, dependency injection, and reactive state without boilerplate
- **Firebase** services are abstracted into dedicated service classes
- **flutter_dotenv** keeps secrets out of source control

---

## Dependencies

```yaml
# Core
get: ^4.6.5                          # State management & routing
flutter_dotenv: ^5.0.2               # Environment variables

# Firebase
firebase_core: ^2.4.0
firebase_auth: ^4.2.1
cloud_firestore: ^4.3.1
firebase_storage: ^11.0.10
firebase_database: ^10.0.14

# AI
chat_gpt_sdk:                        # ChatGPT integration (via Git)
  git:
    url: https://github.com/iampawan/Flutter-ChatGPT.git

# Media
video_player: ^2.5.1
chewie: ^1.4.0
better_player: ^0.0.83
image_picker: ^0.8.6+1
file_picker: ^5.2.5
cached_network_image: ^3.2.3

# AR & 3D
augmented_reality_plugin: ^4.0.1
babylonjs_viewer: ^1.1.4

# PDF & Web
syncfusion_flutter_pdfviewer: ^20.4.51
webview_flutter: ^2.8.0

# UI
lottie: ^2.2.0
flutter_glow: ^0.2.0
sizer: ^2.0.15
velocity_x: ^3.6.0
rflutter_alert: ^2.0.4
fluttertoast: ^8.1.2
```

---

## Academic Context

AstroNerds was developed as part of an undergraduate Computer Science and Engineering programme, demonstrating full-stack mobile development with real-time data, AI integration, AR/3D rendering, and social platform mechanics.

---

## Author

**Shafi (Abid Rahman Shafi)** — GitHub: [@ashafio](https://github.com/ashafio)
