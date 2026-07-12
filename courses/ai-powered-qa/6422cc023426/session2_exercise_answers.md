# Session 2: Exercise Answer Sheet (Facilitator Reference)

**AI in the Testing Workflow — Practical Integration**  
Model answers for practical exercises. Actual participant work will vary.

---

## Task 1: Spec-to-App Build — Model Answer

### App: QuickExpense (continuing from Session 1)

**Prompt used to generate the app:**
```
Role: You are a senior frontend developer.
Context: Build a simple expense tracker web app called QuickExpense.
Constraints: Vanilla HTML/CSS/JS, single-page app, no frameworks, responsive.
Data persistence: LocalStorage.

Spec:
- User can add expense with amount (0.01-99999.99), category (Food/Transport/Entertainment/Bills/Other), and date
- User can view expenses filtered by category
- User can see monthly total summary
- User can delete expenses with confirmation

Generate the complete app: HTML structure, CSS styling, and JavaScript logic.
```

**RAD Checkpoints achieved:**
- Minute 5: HTML structure + form + list area rendered ✅
- Minute 10: Add expense works, appears in list ✅
- Minute 15: Category filter + monthly total working ✅
- Minute 20: Delete with confirmation + LocalStorage persistence ✅

**Key AI adjustments needed:**
- AI initially used `alert()` for confirmation → replaced with modal dialog
- Category filter didn't update total → fixed logic manually
- Date defaulted to US format → changed to DD/MM/YYYY for team context

---

## Task 2: Spec-to-Test with Playwright — Model Answer

### Playwright Project Setup Prompt:
```
Role: You are a senior test automation engineer.
Context: Testing QuickExpense, a vanilla JS expense tracker web app.
Tech stack: Playwright with TypeScript, Page Object Model pattern.
App URL: file:///path/to/index.html (or localhost:3000)

Generate:
1. playwright.config.ts with Chrome-only, baseURL configured
2. A page object (ExpensePage) with methods: addExpense(), getExpenseList(), filterByCategory(), getMonthlyTotal(), deleteExpense()
3. Test file with 5 tests based on these acceptance criteria:

AC1: Given main screen, When enter amount "45.50" + category "Food" + tap Add, Then expense appears in list with today's date and total updates
AC2: Given main screen, When try to add expense with amount "0", Then error "Amount must be greater than 0" shown
AC3: Given expenses in Food/Transport/Entertainment, When select "Food" filter, Then only Food expenses displayed
AC4: Given monthly expenses totalling $1250, When view summary, Then see "July 2026: $1,250.00"
AC5: Given expense "Coffee $4.50" exists, When swipe + Delete + Confirm, Then expense removed and total updates
```

### Generated Test Code (model):

```typescript
// tests/expense.spec.ts
import { test, expect } from '@playwright/test';
import { ExpensePage } from './pages/ExpensePage';

test.describe('QuickExpense', () => {

  test('[Story-1] should add expense with valid amount and category', async ({ page }) => {
    const expensePage = new ExpensePage(page);
    await expensePage.goto();
    
    await expensePage.addExpense('45.50', 'Food');
    
    const list = await expensePage.getExpenseList();
    expect(list).toContainText('45.50');
    expect(list).toContainText('Food');
    
    const total = await expensePage.getMonthlyTotal();
    expect(total).toContain('45.50');
  });

  test('[Story-1-Negative] should reject zero amount', async ({ page }) => {
    const expensePage = new ExpensePage(page);
    await expensePage.goto();
    
    await expensePage.addExpense('0', 'Food');
    
    const error = page.locator('.error-message');
    await expect(error).toBeVisible();
    await expect(error).toContainText('Amount must be greater than 0');
  });

  test('[Story-2] should filter expenses by category', async ({ page }) => {
    const expensePage = new ExpensePage(page);
    await expensePage.goto();
    
    // Add expenses in different categories
    await expensePage.addExpense('10.00', 'Food');
    await expensePage.addExpense('25.00', 'Transport');
    await expensePage.addExpense('15.00', 'Food');
    
    await expensePage.filterByCategory('Food');
    
    const list = await expensePage.getExpenseList();
    await expect(list).toContainText('Food');
    await expect(list).not.toContainText('Transport');
  });

  test('[Story-3] should show monthly total', async ({ page }) => {
    const expensePage = new ExpensePage(page);
    await expensePage.goto();
    
    await expensePage.addExpense('500.00', 'Bills');
    await expensePage.addExpense('750.00', 'Food');
    
    const total = await expensePage.getMonthlyTotal();
    expect(total).toContain('1,250.00');
  });

  test('[Story-4] should delete expense with confirmation', async ({ page }) => {
    const expensePage = new ExpensePage(page);
    await expensePage.goto();
    
    await expensePage.addExpense('4.50', 'Food');
    await expect(page.locator('.expense-item')).toHaveCount(1);
    
    await expensePage.deleteExpense(0);
    // Confirm dialog
    await page.locator('.confirm-delete').click();
    
    await expect(page.locator('.expense-item')).toHaveCount(0);
  });
});
```

### Traceability Matrix:

| Test | Spec Item | Type |
|------|-----------|------|
| should add expense with valid amount | Story 1, AC1 | Positive |
| should reject zero amount | Story 1, AC2 | Negative |
| should filter by category | Story 2, AC1 | Positive |
| should show monthly total | Story 3, AC1 | Positive |
| should delete with confirmation | Story 4, AC1 | Positive |

---

## Task 3: Validate & Iterate — Model Answer

### Coverage Audit:

| Spec Item | Tested? | Gap |
|-----------|---------|-----|
| Add expense (positive) | ✅ | — |
| Add expense (negative - zero) | ✅ | — |
| Add expense (negative - no category) | ❌ | Missing |
| Add expense (boundary - max 99999.99) | ❌ | Missing |
| Filter by category | ✅ | — |
| Filter "All" shows everything | ❌ | Missing |
| Monthly total | ✅ | — |
| Delete with confirmation | ✅ | — |
| Delete - cancel dialog | ❌ | Missing |

### Assertion Quality Check:

| Test | Meaningful? | Issue |
|------|-------------|-------|
| Add expense | ✅ Yes | Checks list content + total update |
| Reject zero | ✅ Yes | Checks error message text |
| Filter | ✅ Yes | Checks inclusion AND exclusion |
| Monthly total | ⚠️ Partial | Only checks amount, not breakdown by category |
| Delete | ✅ Yes | Checks count before/after |

### Hallucination Check:
- No tautologies found ✅
- All assertions check behavior not just visibility ✅
- One potential issue: monthly total test doesn't verify the month label — only the amount

### Gaps to Add Next:
1. `test('[Story-1-Boundary] should reject amount over 99999.99')`
2. `test('[Story-1-Negative] should require category selection')`
3. `test('[Story-4-Negative] should cancel delete when dialog dismissed')`

### Best Prompt Patterns Documented:

| Pattern | Why It Worked |
|---------|---------------|
| Including full spec with Given/When/Then | AI mapped directly to test structure |
| Specifying Page Object Model | Got reusable methods instead of raw selectors |
| "Include negative and boundary tests" | Without this, only got happy paths |
| Providing the app's HTML structure as context | Selectors matched actual DOM |

---

## Quiz Answer Key

| Quiz | Question | Correct Answer | Explanation |
|------|----------|---------------|-------------|
| Recap Q1 | Three Levels — which is the target? | AI-Augmented | Human reviews + validates AI work |
| Recap Q2 | Spec quality determines...? | AI output quality | Garbage in = garbage out |
| Recap Q3 | Tool vs Agent key difference? | Agents have goals + memory | Multi-step autonomous planning |
| Quiz 1 | AI scanning stories for vague language fits...? | Requirements phase | Ambiguity detection before coding |
| Quiz 2 | Best technique when AI only gives happy path? | Negative prompting | "Do NOT only include happy path" |
| Quiz 3 | Example of hallucinated coverage? | Test asserts button exists but never clicks it | Passes whether feature works or not |

---

## Debrief Expected Patterns

- Most groups achieve 3-5 passing tests within the timeframe
- Common struggle: getting selectors right (AI guesses, real DOM differs)
- Common win: AI generates test structure faster than writing from scratch
- Universal insight: spec quality from Session 1 directly determined test quality today
- Groups with better specs got better AI output — clear correlation
- Most underestimate how much validation AI output needs (the "it looks right" trap)
