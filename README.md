<p align="center">
  <img src=".github/assets/oraffle.svg" alt="ORaffle logo" width="128" height="128">
</p>

<p align="center">
  <img src="https://github.com/WidgetSuite/oraffle/actions/workflows/flutter_workflow.yml/badge.svg" alt="CI Status">
  <img src="https://github.com/WidgetSuite/oraffle/actions/workflows/deploy_web.yml/badge.svg" alt="Web CD Status">
  <img src="https://github.com/WidgetSuite/oraffle/actions/workflows/publish_android.yml/badge.svg" alt="Android CD Status">
  <img src="https://github.com/WidgetSuite/oraffle/actions/workflows/publish_ios.yml/badge.svg" alt="iOS CD Status">
  <img src="https://github.com/WidgetSuite/oraffle/actions/workflows/publish_macos.yml/badge.svg" alt="MacOS CD Status">
  <img src="https://github.com/WidgetSuite/oraffle/actions/workflows/publish_microsoft_store.yml/badge.svg" alt="Windows Store CD Status">
</p>

# ORaffle

A professional cross-platform raffle application built with Flutter. ORaffle provides a powerful system for organizing drawings, managing participants, and selecting winners with beautiful animations and custom branding.

**🌟 Official Versions**

Access ORaffle on your favorite platform:

- 🌐 **Web**: [WidgetSuite.github.io/oraffle](https://WidgetSuite.github.io/oraffle/)
- 📱 **Android**: [Google Play Store](https://play.google.com/store/apps/details?id=es.victorcarreras.raffle_app)
- 🪟 **Windows**: [Microsoft Store](https://apps.microsoft.com/store/detail/ORaffle)
- 📱 **iOS**: [App Store](https://apps.apple.com/app/oraffle)
- 🍎 **macOS**: [Mac App Store](https://apps.apple.com/app/oraffle)

![ORaffle Demo](.github/assets/demo.png)

_ORaffle provides an intuitive interface for managing participants and picking winners with smooth animations and comprehensive tracking._

## Features

- **Interactive Participant Management**: Add, edit, and remove participants with real-time validation and duplicate detection.
- **Bulk Import**: Paste a list of names (one per line) for rapid participant setup.
- **Animated Winner Selection**: Exciting visual effects and animations during the drawing process.
- **Multiple Winner Support**: Select multiple winners with automatic position tracking (1st, 2nd, 3rd place, etc.).
- **Custom Branding**:
  - **Logo Integration**: Display your company or event logo in the app header.
  - **Theming**: Personalize the UI color scheme via custom hex codes to match your brand identity.
- **Winner History**: Dedicated screen to view all selected winners with timestamps and rankings.
- **Results Sharing**: Easily export and share raffle results via clipboard with clean, formatted text.
- **Multilingual Support**: Available in 13 languages including English, Spanish, French, German, Italian, Portuguese, Catalan, Basque, Galician, Hindi, Chinese, Arabic, and Japanese.
- **Cross-Platform**: High-performance experience across iOS, Android, Web, Windows, macOS, and Linux.

## App Structure

ORaffle follows **Clean Architecture** principles, ensuring the codebase is maintainable, testable, and scalable.

- **Presentation Layer**: UI components built with Material 3, animations, and BLoC state management.
- **Domain Layer**: Core business logic, drawer models, and repository interfaces.
- **Data Layer**: Local storage implementations and preference management using SharedPreferences.

## 🚀 Getting Started

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/WidgetSuite/oraffle.git
   cd oraffle
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run
   ```

### Running a Raffle

1. **Add Participants**: Enter names manually or paste a bulk list in the input area.
2. **Customize Branding**: Go to Settings to upload your logo URL and set your brand's primary color.
3. **Pick Winners**: Return to the raffle screen and click "Start Raffle" to begin the drawing.
4. **View & Share**: Check the "Winners" tab to see the final results and copy them to share on social media or email.

## Development

### Key Commands

- `flutter run`: Development mode with hot reload.
- `flutter test`: Run the test suite.
- `flutter build <platform>`: Generate production builds for Android, iOS, Web, etc.

## Contributing

Contributions are welcome! If you find a bug or have a feature request, please open an issue.

1. Fork the repo.
2. Create your feature branch (`git checkout -b feature/amazing-feature`).
3. Commit your changes (`git commit -m 'Add some amazing feature'`).
4. Push to the branch (`git push origin feature/amazing-feature`).
5. Open a Pull Request.

## License

This project is licensed under the BSD 3-Clause License - see the [LICENSE](LICENSE) file for details.
