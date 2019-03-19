# Dependency Injection Walkthrough

This repository showcases how to gradually convert an app without any dependency injection and with global access to objects to a fully modularized app with scope-bound dependencies.

## Tags

The tags mark the major permutations of the app.

1. `feature-complete` `no-di` - a feature complete app without any dependency injection - a starting point for restructuring
2. `basic-di` - all dependencies are injected and can be replaced with tests doubles
3. `scope-di` - dependencies are bound on certain scopes and scope tree traversal is used to resolve dependencies
4. `modularized` - the app is a shell that composes itself out of separate modules
