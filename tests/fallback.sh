#!/usr/bin/env bash
# Test script for keyword-fallback feature

echo "Test 1: multi-term with no match"
./searchsploit no-such-term another-term | grep -q "No exact results for"
echo "  ↳ fallback triggered: $?"

echo "Test 2: single-term, no fallback"
./searchsploit no-such-term | grep -q "No exact results for" && echo "  ↳ ❌ unexpected fallback" || echo "  ↳ correct: no fallback"

echo "Test 3: multi-term with some matches"
./searchsploit Apache Struts | grep -q "Showing related results per keyword" && echo "  ↳ fallback triggered" || echo "  ↳ ❌ fallback missing"
