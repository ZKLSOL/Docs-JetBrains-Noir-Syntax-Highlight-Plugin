# Screenshot Automation Tools

Automated screenshot capture for Noir JetBrains Plugin documentation using JetBrains RemoteRobot.

## Prerequisites

- JDK 17+
- IntelliJ IDEA Ultimate with Remote Robot plugin installed
- Noir JetBrains Plugin installed in test IDE
- nargo installed and in PATH

## Setup

1. **Install Remote Robot Plugin in IDE**
   - Go to Settings → Plugins → Marketplace
   - Search for "Robot Server Plugin"
   - Install and restart IDE

2. **Start IDE with Robot Server**
   ```bash
   # From the main plugin directory
   ./gradlew runIdeForUiTests
   ```

3. **Open Demo Project**
   - Open `demo-project/` in the running IDE
   - Wait for indexing to complete

## Running Screenshot Capture

```bash
# Run all screenshot tests
./gradlew test

# Run specific test
./gradlew test --tests "screenshots.ScreenshotRunner.captureSyntaxHighlighting"
```

## Output

Screenshots are saved to `output/` with version-stamped filenames:
- `syntax-keywords-v0.1.0.png`
- `lsp-completion-v0.1.0.png`
- etc.

## Creating GIFs

For dynamic features (completion, hover, navigation), use screen recording + ffmpeg:

```bash
# Record screen (macOS)
screencapture -v output/recording.mov

# Convert to GIF
ffmpeg -i output/recording.mov -vf "fps=15,scale=1280:-1" -gifflags +transdiff output/feature-v0.1.0.gif
```

## Demo Project

The `demo-project/` contains minimal Noir code demonstrating all plugin features:
- `src/main.nr` - Functions, structs, tests, various syntax elements

## Configuration

- **Window Size**: 1280x800 (set in IDE appearance settings)
- **Theme**: Darcula (dark)
- **Font Size**: Default (13px)
