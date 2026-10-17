# Timekeeper

![No AI-generated code](https://img.shields.io/badge/code-no_AI_generated-2E6D5A)

A small Flutter timekeeping app and personal project. The goal is to keep it
simple and local-first.

## Current Features

- Start and pause a stopwatch
- Reset the elapsed time
- Display elapsed time as hours, minutes, and seconds

The stopwatch currently runs in memory; elapsed time is not saved between app
sessions yet.

## Planned

- Store time entries locally with SQLite and Drift
- Add descriptions and link images to entries
- Support backing up and restoring app data

## Run Locally

You'll need the [Flutter SDK](https://docs.flutter.dev/get-started/install).

```sh
flutter pub get
flutter run
```
