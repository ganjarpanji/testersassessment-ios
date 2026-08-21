# Test assignment

We are looking for Automation Engineers that have the mindset "only the sky is the limit" and "automation doesn't stop at testing, it's just a beginning!" ;)

The purpose of this test assignment is to assess the applicant's automation skills, allowing him/her to show the best they can do and how fast they can learn.
It is an open assignment. There is no the right answer and there is no end goal other than proving yourself. Surprise us!

Make sure that you give detailed comments or descriptions of your tests.
When the assignment is complete, please push your solution to Github(Gitlab) and send us the link 

If you have any questions, please contact us back.


Good luck.

PS. We don't expect you to spend weeks (and sleepless nights) on doing it. Lets see how far you can get in 6-10 hours. We want to see how you approach and solve problems.

PSPS. Please use mobile native tools.


## Project set-up

### Gemfile

This file specifies which Ruby dependencies (gems) are needed for our app.

### fastlane/Fastfile

This is where tha magic happens.

Two lanes were added to automate test execution:

- `unit_test` - runs the unit tests.
- `ui_test` - runs the UI tests.

# Test approach

This submission uses native XCTest and XCUITest.
Given the scope and time constraints of the assignment, the current implementation focuses on the core functionality.

## Automation approach

- Unit tests are implemented using XCTest to validate the currency helper logic independently from the UI.
- UI tests are implemented using XCUITest to validate the main user flow from the user's perspective.
- The Page Object pattern is used to keep UI interaction logic separate from test assertions and improve maintainability.
- Accessibility identifiers are used for reliable UI element identification.

## UI Test

Generated amounts are random. UI tests validate the visible currency result.

- Added accessibility identifier for the button element.
- Implemented page object pattern for the ui test.
- UI tests cover the main currency-generation flow:
  - Verifies that placeholder for hello text and button is displayed when app launched.
  - Verifies the amount that is displayed on euro format.
  - Verifies tapping the button will refresh the amount.

## Unit Test

The test scope focused on possibilities of actual input based on the app code, hence the input is limited and more detailed edge-case testing was not necessary.
- Updated test function name with more readable pattern.
- Added some test scenarios for the currency helper that cover (format and attributify functions) :
  - Verifies thousands number should return number with dutch thousands separator.
  - Verifies attributify should return unchanged string.

## Potential improvements

- Adding more boundary and invalid-input scenarios to the unit tests.
- Adding Accessibility test
- Running tests on multiple iOS versions and device configurations.
- Adding test result reporting and screenshots for UI test failures.
- Integrating the Fastlane lanes into a CI pipeline.

## How to run the tests

### Using Xcode

Open `ReferenceiOS.xcodeproj` in Xcode.

- Select the `ReferenceiOS` scheme and run the tests to execute the unit tests.
- Select the `ReferenceiOSUITests` scheme and run the tests to execute the UI tests.

### Using Fastlane

The test automation is also available through Fastlane.

First, install the project dependencies:

```bash
bundle install
```

Run the unit tests:
```bash
bundle exec fastlane unit_test
```
Run the UI tests:
```bash
bundle exec fastlane ui_test
```
Run both unit and UI tests:
```bash
bundle exec fastlane test
```

Fastlane uses the project's existing test configuration and does not require manually running the tests from Xcode.