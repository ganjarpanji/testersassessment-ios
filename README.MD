
# 📱 iOS Test Automation Assessment

This application is built with **Swift**, **XCTest**, **XCUITest**, and **Fastlane**. The project uses native iOS testing tools and modern automation practices, including **Page Object Pattern**, **Accessibility Identifiers**, **JUnit reporting**, and **GitHub Actions** for automated test execution and CI.

## 🧩 Project Highlights

- 🧪 **XCTest** – Native unit testing for testing application logic.
- 📱 **XCUITest** – Native UI automation for validating user flows.
- 🧱 **Page Object Pattern** – Keeps UI interactions and screen assertions separate from test cases.
- ♿ **Accessibility Identifiers** – Provides reliable UI element identification.
- 🚀 **Fastlane** – Automates unit and UI test execution.
- 📊 **JUnit Reporting** – Generates test results that can be consumed by CI.
- 🤖 **GitHub Actions** – Runs automated tests as part of the pull request workflow.
- 📦 **Test Artifacts** – Test reports can be archived for further investigation.

## ✅ Prerequisites

### 1. Xcode

Install Xcode with the iOS Simulator required to run the project.

Open the project using:

```bash
open ReferenceiOS.xcodeproj
```

### 2. Ruby and Bundler

The project uses Ruby and Bundler to manage the Fastlane dependencies.

Install the project dependencies with:

```bash
bundle install
```

The project uses the dependency versions defined in `Gemfile.lock`.

### 3. Fastlane

Fastlane is used to automate test execution.

The following lanes are available:

| Lane | Description |
|---|---|
| `test_unit` | Runs the unit test suite |
| `test_ui` | Runs the UI test suite |
| `test` | Runs both unit and UI tests |

---

## 🚀 Tech Stack

| **Category** | **Technology** |
|---|---|
| Language | Swift |
| Unit Testing | XCTest |
| UI Testing | XCUITest |
| Test Pattern | Page Object Pattern |
| Test Automation | Fastlane |
| Test Reporting | JUnit |
| CI | GitHub Actions |
| CI Artifacts | Test reports |

---

## 🧪 Test Approach

This submission uses native XCTest and XCUITest.

The assignment implementation focuses on the core functionality and the main user flow.

### Automation Approach

- Unit tests are implemented using XCTest to validate the currency helper
  logic independently from the UI.
- UI tests are implemented using XCUITest to validate the main user flow
  from the user's perspective.
- The Page Object pattern is used to keep UI interaction logic separate
  from test assertions and improve maintainability.
- Accessibility identifiers are used for reliable UI element identification.
- Fastlane provides a consistent command-line entry point for running
  the test suites.
- Test execution is integrated with CI through GitHub Actions.

---

## 📱 UI Tests

Generated amounts are random. The UI tests therefore validate the visible
currency result.

### Test Coverage

- Added accessibility identifiers for the amount label and Generate button.
- Implemented the Page Object pattern for UI interactions.
- UI tests cover the main currency-generation flow:
  - Verifies that the hello text placeholder and Generate button are displayed
    when the app is launched.
  - Verifies that the generated amount is displayed using the expected
    Euro currency format.
  - Verifies that tapping the Generate button refreshes the displayed amount.

---

## 🧪 Unit Tests

The unit tests cover the supported formatting behavior and relevant edge
cases defined by the application code, including rounding, zero values,
negative values, and locale-specific separators. Attribution behavior is
also covered for formatted currency strings.

### Test Coverage

- Updated test function names using a more readable naming pattern.
- Added test scenarios for the `CurrencyHelper` functions:
  - `format`
  - `attributify`

The tests cover:

- Verifies that thousands numbers are formatted using the Dutch thousands
  separator.
- Verifies that `attributify` returns an already formatted currency string
  unchanged.
- Verifies rounding behavior for values with three decimal places.
- Verifies formatting of decimal values using the expected decimal separator.
- Verifies formatting of regular numeric values as currency.
- Verifies formatting of zero as a currency value.
- Verifies formatting of negative values as a currency value.

`attributify` currently assumes that the input contains at least two decimal
characters. Short or empty input can therefore create an invalid `NSRange` and
crash. The related regression test is kept commented out until the behavior is
defined and handled safely in the application code.

---

## 🚀 Fastlane

Fastlane is used as the command-line interface for executing the test suites.

Three lanes were added:

```text
test_unit
test_ui
test
```

### Run Unit Tests

```bash
bundle exec fastlane test_unit
```

### Run UI Tests

```bash
bundle exec fastlane test_ui
```

### Run All Tests

```bash
bundle exec fastlane test
```

The Fastlane lanes use the project's existing test configuration and do not
require the tests to be manually started from Xcode.

---

## 🤖 CI/CD with GitHub Actions

This project includes a pull request workflow for automated test execution.

### 🔍 Pull Request Checks

The workflow runs automatically when a pull request is opened or updated
against the `main` branch.

The workflow:

- Sets up the required Ruby and Bundler environment.
- Installs the project dependencies.
- Runs the unit tests through Fastlane.
- Runs the UI tests through Fastlane.
- Uploads generated test reports as GitHub Actions artifacts.
- Makes the automated test execution part of the pull request validation.

### Test Reports

The unit test execution generates a JUnit-compatible report:

```text
fastlane/test_output/report.junit
```

The test output directory is uploaded as a GitHub Actions artifact so that
test reports and other generated test results can be inspected after the
workflow completes.

---

## 🔮 Potential Improvements

The current implementation focuses on the core requirements within the
assessment scope. Possible future improvements include:

- Defining safe invalid-input behavior and enabling the documented
  `attributify` regression test.
- Adding dedicated accessibility tests.
- Running tests across multiple iOS versions and device configurations.
- Improving UI test failure diagnostics with additional screenshots or
  test attachments.
- Expanding CI test result reporting.
- Running UI tests on multiple simulator configurations.
- Adding additional test coverage for unexpected UI states.

---

## ▶️ How to Run the Tests

### Using Xcode

Open:

```text
ReferenceiOS.xcodeproj
```

Then:

- Select the `ReferenceiOS` scheme and run the unit tests.
- Select the `ReferenceiOSUITests` scheme and run the UI tests.

### Using Fastlane

First, install the project dependencies:

```bash
bundle install
```

Run the unit tests:

```bash
bundle exec fastlane test_unit
```

Run the UI tests:

```bash
bundle exec fastlane test_ui
```

Run both unit and UI tests:

```bash
bundle exec fastlane test
```

---

## 📊 Test Reporting

Fastlane generates test reports during test execution.

The generated JUnit report can be found at:

```text
fastlane/test_output/report.junit
```

Additional generated test output is stored under:

```text
fastlane/test_output/
```

These files can be used locally for investigating test execution and are
also archived by the CI workflow.

---

## 📝 Scope

This assessment intentionally focuses on test automation rather than
application build and distribution.

The `Jenkinsfile` contains additional build, archive, and parallel deployment
stages as a reference for a broader pipeline. Those stages are intentionally
out of scope for this submission because the available Fastlane lanes are
limited to `test_unit`, `test_ui`, and `test`.

The implementation demonstrates:

- Native iOS unit testing with XCTest.
- Native iOS UI automation with XCUITest.
- Maintainable UI automation using the Page Object pattern.
- Reliable UI element identification using accessibility identifiers.
- Automated test execution using Fastlane.
- CI integration using GitHub Actions.
- Test reporting and artifact preservation.
