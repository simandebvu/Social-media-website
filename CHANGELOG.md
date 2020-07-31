# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.1.0] - 2020-07-30
### Added
- Document with ERD Diagram to plan friendship implementation.
- User can invite friends.
- User can see friendship requests.
- User can now accept and reject friendship requests.
- A button to invite user to friendship on users list page and on single user page.
- Posts to be seen by friends only.
- Friendship has many through relationship (Symmetric and Irreflexive)

### Fixed
- Posts Controller#timeline_posts to also get posts from users friends and not just the user
- Removed Code Comments (Cleaner Code)
- Moved the accept friendship action to the friendship controller
- DRY Principle in Posts Controller#**timeline_posts**
