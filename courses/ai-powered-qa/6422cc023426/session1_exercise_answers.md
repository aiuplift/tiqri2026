# Session 1: Exercise Answer Sheet (Facilitator Reference)

**AI-Powered QA — Rethinking Strategy & Process**  
This is a sample/model answer for the facilitator. Actual participant answers will vary.

---

## Task 1: Tool Map — Model Answer

### Tool Map (Example for a QA team using Playwright + Azure DevOps)

| Category | Tool | Value | Complexity | Agent? |
|----------|------|-------|-----------|--------|
| **Test Generation** | GitHub Copilot | High | Low | No (Tool) |
| | Claude / ChatGPT | High | Low | No (Tool) |
| | Amazon Q Developer | Medium | Medium | Yes (Agent) |
| | Codium AI | Medium | Low | No (Tool) |
| **Execution & Orchestration** | Playwright | High | Medium | No (Tool) |
| | Mabl | Medium | Medium | Yes (Agent) |
| | TestRigor | Medium | Low | Yes (Agent) |
| **Defect Intelligence** | Jira AI features | Medium | Low | No (Tool) |
| | Sentry (error tracking) | High | Medium | No (Tool) |
| | Linear AI triage | Medium | Low | No (Tool) |
| **Test Data** | Faker.js + LLM prompts | High | Low | No (Tool) |
| | Mostly AI | Medium | High | No (Tool) |
| **Visual Testing** | Applitools Eyes | High | Medium | Yes (Agent) |
| | Percy (BrowserStack) | Medium | Medium | No (Tool) |
| **Monitoring & Observability** | Datadog AI | Medium | High | Yes (Agent) |
| | Azure Monitor | Medium | Medium | No (Tool) |
| **CI/CD Integration** | GitHub Actions + Copilot | Medium | Low | No (Tool) |

### Top 3 to Explore Further
1. **Copilot** — lowest barrier, highest immediate value for test writing
2. **Applitools Eyes** — AI visual regression would eliminate false positives from current Percy setup
3. **Amazon Q Developer Agent** — could automate entire test generation workflow

### Biggest Gap
**Test Data** — currently using manual fixtures, no synthetic data generation. GDPR makes this critical since we can't use production data.

---

## Task 2: Spec First — Model Answer

### Chosen App: Simple Expense Tracker

```
APP NAME: QuickExpense
PURPOSE: Track daily expenses with categories and monthly totals.
TARGET USER: Individual who wants to monitor spending without a complex app.

USER STORIES:

1. As a user, I want to add an expense with amount, category, and date,
   so that I can record my spending as it happens.

2. As a user, I want to view my expenses filtered by category,
   so that I can see where my money goes.

3. As a user, I want to see a monthly total summary,
   so that I can track if I'm within budget.

4. As a user, I want to delete an expense I entered by mistake,
   so that my records stay accurate.

ACCEPTANCE CRITERIA:

Story 1: Add Expense
  Given I am on the main screen
  When I enter amount "45.50", select category "Food", and tap "Add"
  Then the expense appears in the list with today's date
  And the monthly total updates to include this amount

  Given I am on the main screen
  When I try to add an expense with amount "0" or negative
  Then an error message "Amount must be greater than 0" is shown
  And no expense is added

  Given I am on the main screen  
  When I try to add an expense without selecting a category
  Then an error message "Please select a category" is shown

Story 2: Filter by Category
  Given I have expenses in "Food", "Transport", and "Entertainment"
  When I select the "Food" filter
  Then only Food expenses are displayed
  And the subtotal shows only Food expenses

  Given I select "All" filter
  When the list loads
  Then all expenses across all categories are displayed

Story 3: Monthly Summary
  Given I have expenses totalling $1,250.00 in July
  When I view the monthly summary
  Then I see "July 2026: $1,250.00" with breakdown by category

Story 4: Delete Expense
  Given I have an expense "Coffee $4.50" in the list
  When I swipe left and tap "Delete"
  Then a confirmation dialog appears: "Delete Coffee $4.50?"
  
  Given the confirmation dialog is showing
  When I tap "Confirm"
  Then the expense is removed and the total updates

EDGE CASES:
- What happens when amount exceeds 99,999.99? → Show "Maximum amount is $99,999.99"
- What happens with no expenses in a month? → Show "No expenses recorded" with $0.00 total
- What happens with very long category names? → Truncate at 20 characters with "..."
- What if user enters amount with 3+ decimal places? → Round to 2 decimal places

NON-FUNCTIONAL:
- Performance: List should load within 500ms with 1000+ expenses
- Browser support: Chrome, Firefox, Safari (latest 2 versions)
- Responsive: Works on mobile (320px+) and desktop
- Data persistence: LocalStorage (no backend required)
```

---

## Task 3: AI Story Expansion — Model Answer

### Input to AI (Story 1 + Acceptance Criteria fed to Claude/Copilot):

**Prompt:** "Given this user story and acceptance criteria, generate comprehensive test scenarios including positive, negative, boundary, and edge cases:

User Story: As a user, I want to add an expense with amount, category, and date, so that I can record my spending as it happens.

Acceptance Criteria:
- Given I am on the main screen, When I enter amount '45.50', select category 'Food', and tap 'Add', Then the expense appears in the list with today's date and the monthly total updates.
- Amount must be greater than 0, max $99,999.99
- Category must be selected"

---

### AI-Generated Output (simulated Claude response):

```
TEST SCENARIOS:

POSITIVE CASES:
1. Add expense with valid amount (45.50) and category (Food) → appears in list ✅
2. Add expense with minimum valid amount (0.01) → accepted ✅
3. Add expense with maximum valid amount (99999.99) → accepted ✅
4. Add expense with whole number (100) → stored as 100.00 ✅
5. Add multiple expenses sequentially → all appear, total updates each time ✅

NEGATIVE CASES:
6. Add expense with amount = 0 → error "Amount must be greater than 0" ✅
7. Add expense with negative amount (-5.00) → error shown ✅
8. Add expense without selecting category → error "Please select a category" ✅
9. Add expense with empty amount field → error shown ✅
10. Add expense with non-numeric input ("abc") → error shown ✅

BOUNDARY CASES:
11. Amount = 0.01 (minimum boundary) → accepted ✅
12. Amount = 99999.99 (maximum boundary) → accepted ✅
13. Amount = 100000.00 (exceeds max) → error shown ✅
14. Amount with 3 decimal places (45.555) → rounds to 45.56 ✅
15. Amount = 0.001 (below minimum precision) → rounds to 0.00 → rejected? ⚠️

EDGE CASES:
16. Add expense on Feb 29 (leap year) → date stored correctly ✅
17. Add expense at midnight (timezone boundary) → correct date assigned ✅
18. Very long decimal (0.123456789) → handled gracefully ✅
19. Large number of expenses (1000+) → list performance acceptable ✅
20. Rapid consecutive adds (double-tap prevention) → only one added ✅
21. Special characters in amount field (e.g., "$45.50") → stripped or error ⚠️
22. Paste a copied amount from clipboard → handled correctly ✅
23. Network disconnection during add → graceful error (if applicable) ❌
```

---

### Team Evaluation:

| # | Verdict | Reasoning |
|---|---------|-----------|
| 1-5 | ✅ Keep | Standard positive cases, well-formed |
| 6-10 | ✅ Keep | Good negative coverage |
| 11-14 | ✅ Keep | Boundary values we specified |
| 15 | ⚠️ Modify | Edge case — need to clarify: should 0.001 round to 0.00 and be rejected? Yes → add to spec |
| 16-17 | ✅ Keep | Good timezone/date awareness |
| 18-19 | ✅ Keep | Performance + precision edge cases |
| 20 | ⚠️ Modify | Good catch but need to define: is double-tap prevention in scope? Add to spec |
| 21 | ⚠️ Modify | Good — need to clarify: do we strip "$" prefix or show error? Decision needed |
| 22 | ✅ Keep | Clipboard paste is a valid user action |
| 23 | ❌ Reject | We specified LocalStorage, no network required. Hallucinated a non-existent concern |

### Key Insight
> The AI generated 23 scenarios from a single user story. 18 were directly useful, 4 needed clarification (which actually improved our spec), and 1 was irrelevant. The spec quality gave AI enough to generate boundary cases we hadn't considered (timezone, double-tap, clipboard paste). Without the spec boundaries (0, max, category required), the AI would have generated only the first 5 generic positive cases.

---

## Debrief Talking Points (per group, ~1 minute each)

Groups should share:

1. **Tool map highlight:** "Our biggest discovery was [tool X] — we didn't know it existed" or "Our biggest gap is in [category Y]"

2. **App concept:** One sentence — "We're building a [what] that does [core feature]"

3. **Spec → AI insight:** "When we gave AI our vague first draft, we got generic output. After applying the 5 principles, the AI generated [specific improvement]"

### Expected patterns across groups:
- Most will find their biggest gap in Test Data or Monitoring
- Common app choices: to-do list, quiz app, expense tracker
- Universal insight: spec quality directly correlates with AI output quality
- Some groups will note AI found edge cases humans missed
- Some will note AI hallucinated non-existent requirements

---

## Quiz Answer Key

| Quiz | Question | Correct Answer | Explanation |
|------|----------|---------------|-------------|
| Quiz 1 | Which level = "AI generates full test suites, human reviews"? | B) AI-Augmented | Human review step distinguishes from Autonomous |
| Quiz 2 | Key difference between Tool and Agent? | Agents have goals, memory, and multi-step planning | Tools are single transactions |
| Quiz 3 | Most useful spec for AI test generation? | B) "Given logged-in user, When search..." | Clear boundaries, specific context, measurable outcomes |
