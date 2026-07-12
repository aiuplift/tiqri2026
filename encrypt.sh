#!/bin/bash
# Re-encrypt all protected pages after editing
# Run from repo root: ./encrypt.sh
# Requires: npm install -g staticrypt

OPTS="--short --template-color-primary #48C9B0 --template-color-secondary #0D2137"
DIR="courses/ai-powered-qa"
HIDDEN="courses/ai-powered-qa/6422cc023426"

echo "Encrypting session pages..."
staticrypt $DIR/session1.html -p "Foundation" -d $DIR $OPTS --template-title "Session 1: AI Foundations" --template-instructions "Enter the session passcode shared by your facilitator" --template-button "Access Materials" --template-placeholder "Session passcode" --template-error "Incorrect passcode. Try again."

staticrypt $DIR/session2.html -p "HereYouGo" -d $DIR $OPTS --template-title "Session 2: Practical Integration" --template-instructions "Enter the session passcode shared by your facilitator" --template-button "Access Materials" --template-placeholder "Session passcode" --template-error "Incorrect passcode. Try again."

staticrypt $DIR/session3.html -p "FinalLap" -d $DIR $OPTS --template-title "Session 3: Process & Roadmap" --template-instructions "Enter the session passcode shared by your facilitator" --template-button "Access Materials" --template-placeholder "Session passcode" --template-error "Incorrect passcode. Try again."

echo "Encrypting instructor portal..."
staticrypt $DIR/instructor.html -p "Maname2026" -d $DIR $OPTS --template-title "Instructor Portal" --template-instructions "Enter instructor passcode to access content" --template-button "Unlock" --template-placeholder "Instructor passcode" --template-error "Incorrect passcode. Try again."

echo "Encrypting slide decks..."
staticrypt $HIDDEN/session1_deck.html -p "Maname2026" -d $HIDDEN $OPTS --template-title "Session 1 Deck" --template-instructions "Instructor access required" --template-button "Open Deck" --template-placeholder "Passcode" --template-error "Incorrect."

staticrypt $HIDDEN/session2_deck.html -p "Maname2026" -d $HIDDEN $OPTS --template-title "Session 2 Deck" --template-instructions "Instructor access required" --template-button "Open Deck" --template-placeholder "Passcode" --template-error "Incorrect."

staticrypt $HIDDEN/session3_deck.html -p "Maname2026" -d $HIDDEN $OPTS --template-title "Session 3 Deck" --template-instructions "Instructor access required" --template-button "Open Deck" --template-placeholder "Passcode" --template-error "Incorrect."

echo "Done! All pages encrypted."
