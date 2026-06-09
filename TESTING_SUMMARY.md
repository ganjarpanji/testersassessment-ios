# Testing & Quality Improvements Summary

## 1. UI Testing

**Purpose:** Validate critical user journeys and key application interactions from an end-user perspective.

**Command:** `bundle exec fastlane ui_tests`

**File:** `ReferenceiOSUITests.swift`

### Implementation

* Added accessibility identifiers to improve UI test stability and maintainability.
* Added UI test scenarios covering critical happy paths and key iOS interactions.
* Implemented the Page Object Model (POM) pattern with fluent interfaces to improve readability and reduce maintenance overhead.
* Integrated native accessibility audits using `XCUIAutomation`'s `performAccessibilityAudit()` to validate accessibility compliance alongside functional UI testing.



## 2. Snapshot Testing

**Purpose:** Detect visual regressions and ensure UI consistency across supported configurations.

**Command:** `bundle exec fastlane snapshot_tests`

**File:** `LandingScreenSnapshotTests.swift`

### Implementation

* Added debug-only hooks to inject deterministic mock data for snapshot testing.
* Validated rendering of dynamic content to prevent issues such as text truncation and layout regressions.
* Verified visual consistency across different simulator screen sizes.
* Added Dark Mode snapshot coverage to detect appearance-specific regressions.



## 3. Unit Testing

**Purpose:** Increase confidence in isolated business logic and utility components.

**Command:** `bundle exec fastlane unit_tests`

**File:** `CurrencyHelperTests.swift`

### Implementation

* Expanded unit test coverage for utility functions.
* Added tests for additional edge cases and regression-prone scenarios to improve long-term maintainability.



## 4. Test Orchestration

**Purpose:** Provide a consistent and simplified interface for local and CI test execution.

### Implementation

* Integrated Fastlane to standardize test execution across environments.
* Added dedicated lanes for:
  * UI tests
  * Snapshot tests
  * Unit tests

* Added a unified lane to execute the complete test suite.
* Designed each lane to run independently, enabling targeted validation and faster feedback.
* Integrated xchtmlreport as the default reporting tools.



## 5. Test Reporting

**Purpose:** Improve test result visibility and simplify failure analysis.

### Implementation

* Integrated xchtmlreport into the testing workflow.
* Each execution generates an isolated `.xcresult` artifact, which is transformed into an HTML report for easier inspection and CI integration.

---

## 6. Application Improvements

### Testability

* Added accessibility identifiers to support reliable UI automation.
* Centralized test identifier configuration to improve maintainability.
* Added debug-only data injection for deterministic snapshot testing.
* Improved helper by adding defensive handling for invalid input scenarios identified during testing.

### UI & Accessibility

* Added Dynamic Type support to improve accessibility compliance.
* Adjusted UI colours to support Dark Mode.
* Refactored layout using `UIStackView` to improve adaptability across screen sizes and dynamic font settings.

### Data Handling

* Replaced `Float` with `Decimal` for monetary values to improve precision and better align with financial application practices.



## 7. Additional Notes

* Added `bootstrap.sh` to simplify project setup and dependency installation.
* Parallel test execution was intentionally deferred, as the current test suite size would provide limited benefit while adding maintenance complexity. The setup can be extended as the test suite grows.
* Native accessibility auditing was chosen over external frameworks to minimise dependencies while providing fast and stable feedback.



## 8. Continuous Integration
Purpose: Automate test execution on every pull request to ensure code quality and prevent regression before merging.

Workflow: swift.yml
* Implemented a dedicated CI workflow using GitHub Actions to align with shift-left testing
* Ensure code quality and prevent regression before merging.
* Runs automatically on every push and pull_request to the main branches.
* Executes the full suite (Unit, UI, and Snapshot tests) via fastlane.
* Uploads test results and HTML reports as build artifacts for easy review.

## Testing Strategy

The implemented approach follows a layered testing strategy:

* **Unit Tests** validate isolated business logic.
* **Snapshot Tests** protect against visual regressions.
* **UI Tests** verify critical end-to-end user flows and accessibility requirements.
