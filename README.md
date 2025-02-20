# Unhandled Exceptions and Improved Error Reporting in Dart

This repository demonstrates a common issue in Dart applications: inadequate error handling. The original `bug.dart` file shows a basic implementation with a `try-catch` block, but it lacks specific error handling and clear error messages.  The improved version (`bugSolution.dart`) provides more robust error handling and informative error messages.

## Problem

The original code handles exceptions generically.  It doesn't distinguish between different types of errors (network issues, JSON parsing errors, etc.), making debugging difficult.

## Solution

The improved code uses more specific exception handling and provides more context in the error messages. It also leverages custom exceptions to provide better error information to the calling functions.