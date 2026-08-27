# MB Recreated App

Flutter iOS project with a recreated MB-style login and home interface based on the supplied reference screenshots.

## Build with GitHub Actions

1. Push the project to GitHub.
2. Open **Actions → Build IPA → Run workflow**.
3. When the run succeeds, open the run and download the **MB-IPA-unsigned** artifact.

The workflow creates the iOS project automatically with `flutter create`, then builds an unsigned IPA.
