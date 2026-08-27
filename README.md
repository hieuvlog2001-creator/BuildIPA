# MB Recreated App

Flutter project recreated from the supplied built app assets.

## Default login

- Username: `Admin`
- Password: `admin`

## GitHub Actions

The included `.github/workflows/build-ios.yml` uses a GitHub-hosted macOS runner and generates the missing iOS/Xcode project automatically with `flutter create --platforms=ios` before building.

The workflow builds an **unsigned IPA** with `flutter build ipa --release --no-codesign` and uploads it as the `MB-IPA-unsigned` artifact.

An unsigned IPA is useful for verifying the build. Installing it on a physical iPhone requires valid Apple code signing/provisioning.
