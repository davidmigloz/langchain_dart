# Contributing to LangChain.dart

👋 Hi there! Thank you for even being interested in contributing to LangChain.dart.
We welcome contributions of any size and skill level, whether it be in the form of a new 
feature, improved infra, or better documentation.

To contribute to this project, please follow a 
["fork and pull request"](https://github.com/firstcontributions/first-contributions) workflow.

## 🔗 Quick links

### Not sure what to work on?

If you are not sure what to work on, we have a few suggestions:

- Look at the issues with the "[good first issue](https://github.com/davidmigloz/langchain_dart/issues?q=is%3Aissue+is%3Aopen+label%3A%22f%3Agood+first+issue%22)"
  label. These are issues that we think are good targets for new contributors. If you are 
  interested in working on one of these, please comment on the issue so that we can assign it to 
  you. And any questions let us know, we're happy to guide you!
- At the moment our main focus is reaching parity with the Python version across both 
  [integrations](https://langchain.com/integrations.html) and [features](https://langchain.com/features.html). 
  If you are interested in working on a specific integration or feature, just pick anything from 
  those lists not done yet, please let us know and we can help you get started.

## 🗺️ Contributing guidelines

### 🚩 GitHub issues

Our [issues](https://github.com/davidmigloz/langchain_dart/issues) page is kept up to date
with bugs, improvements, and feature requests. There is a 
[taxonomy of labels](https://github.com/davidmigloz/langchain_dart/labels) to help with sorting and 
discovery of issues of interest. These include:

- [doc-loaders](https://github.com/davidmigloz/langchain_dart/labels/c%3Adoc-loaders)
- [doc-transformers](https://github.com/davidmigloz/langchain_dart/labels/c%3Adoc-transformers)
- [prompts](https://github.com/davidmigloz/langchain_dart/labels/c%3Aprompts)
- [llms](https://github.com/davidmigloz/langchain_dart/labels/c%3Allms)
- [chat-models](https://github.com/davidmigloz/langchain_dart/labels/c%3Achat-models)
- [output-parsers](https://github.com/davidmigloz/langchain_dart/labels/c%3Aoutput-parsers)
- [chains](https://github.com/davidmigloz/langchain_dart/labels/c%3Achains)
- [memory](https://github.com/davidmigloz/langchain_dart/labels/c%3Amemory)
- [stores](https://github.com/davidmigloz/langchain_dart/labels/c%3Astores)
- [embeddings](https://github.com/davidmigloz/langchain_dart/labels/c%3Aembeddings)
- [retrievers](https://github.com/davidmigloz/langchain_dart/labels/c%3Aretrievers)
- [agents](https://github.com/davidmigloz/langchain_dart/labels/c%3Aagents)
- [tools](https://github.com/davidmigloz/langchain_dart/labels/c%3Atools)

We also have a [kanban board](https://github.com/users/davidmigloz/projects/2) for tracking the 
progress of issues through the development process.

If you start working on an issue, please comment on it and we will assign it to yourself.

If you are adding an issue, please try to keep it focused on a single modular 
bug/improvement/feature. If the two issues are related, or blocking, please link them rather than 
keep them as one single one.

We will try to keep these issues as up to date as possible, though with the rapid rate of develop 
in this field some may get out of date. If you notice this happening, please just let us know.

### 🙋 Getting help

Although we try to have a developer setup to make it as easy as possible for others to contribute 
(see below) it is possible that some pain point may arise around environment setup, linting, 
documentation, or other. Should that occur, please contact a maintainer on our 
[Discord](https://discord.gg/x4qbhqecVR)! Not only do we want to help get you unblocked, but we 
also want to make sure that the process is smooth for future contributors.

In a similar vein, we do enforce certain linting, formatting, and documentation standards in the 
codebase. If you are finding these difficult (or even just annoying) to work with, feel free to 
contact a maintainer for help - we do not want these to get in the way of getting good code into 
the codebase.

### 🏭 Release process

As of now, LangChain has an ad hoc release process: releases are cut with high frequency via by
a developer and published to [pub.dev](https://pub.dev/packages/langchain).

LangChain follows the [semver](https://semver.org/) versioning standard. However, as pre-1.0 
software, even patch releases may contain 
[non-backwards-compatible changes](https://semver.org/#spec-item-4).

## 🚀 Quick start

### Tooling

This project uses the following tools, which are worth getting familiar with if you plan to 
contribute:

- **[melos](https://melos.invertase.dev)** - a tool for managing Dart monorepos.
- **[linter](https://dart-lang.github.io/linter)** - official Dart linter.
- **[analyzer](https://pub.dev/packages/analyzer)** - official Dart static analyzer.
- **[GitHub Actions](https://github.com/features/actions)** - a CI/CD tool for GitHub repositories.
- **[docsify](https://docsify.js.org)** - static site generation for documentation.

Now, you should be able to run the common tasks in the following section.

## ✅ Common tasks

Our primary goal is to make it as easy as possible for you to contribute to this project.

### Setup

To get started, you will need to install the dependencies for the project. To do so, run:

```bash
melos bootstrap
```

### Formatting

We use [dart format](https://dart.dev/tools/dart-format) to enforce 
[code formatting style](https://github.com/davidmigloz/langchain_dart/blob/main/analysis_options.yaml).

To run the formatter, run:

```bash
melos format
```

It will automatically fix (most) format errors.

### Linting

We use the official [linter](https://dart-lang.github.io/linter) and 
[analyzer](https://pub.dev/packages/analyzer) to enforce 
[standard rules](https://github.com/davidmigloz/langchain_dart/blob/main/analysis_options.yaml).

To run the linter, run:

```bash
melos lint
```

### Testing

To run all tests, run:

```bash
melos test
```

If you only want to run the tests for the packages that have changed compared to `main`, run:

```bash
melos test:diff
```

### Examples

If you add a new major piece of functionality, it is helpful to add an example to showcase how to 
use it. Most of our users find examples to be the most helpful kind of documentation.

Examples can be added in the `examples` directory of the repository. Each example should contain
a README that explains what the example does, and how to run it.

## 📄 Documentation

The [API reference](https://pub.dev/documentation/langchain/latest/) docs are automatically 
generated from the code. For that reason, we ask that you add good documentation to all classes 
and methods.

The general [langchaindart.com](http://langchaindart.com) docs are written in Markdown and live in
the `docs` directory. The static site is generated using [docsify](https://docsify.js.org). If you 
add a new major piece of functionality, please add a page to the docs that explains how to use it.

You can run a hot-reloading version of the docs static site by running:

```bash
docsify serve docs
```
