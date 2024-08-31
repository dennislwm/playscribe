# playscribe

<h1 align="center" style="border-bottom: none;">playscribe</h1>
<h3 align="center">An automated process to summarize a YouTube link with ChatGPT.</h3>
<br />
<p align="center">
  <p align="center">
    <a href="https://github.com/dennislwm/playscribe/issues/new?template=bug_report.yml">Bug report</a>
    ·
    <a href="https://github.com/dennislwm/playscribe/issues/new?template=feature_request.yml">Feature request</a>
    ·
    <a href="https://github.com/dennislwm/playscribe/wiki">Read Docs</a>
  </p>
</p>
<br />

---

![GitHub repo size](https://img.shields.io/github/repo-size/dennislwm/playscribe?style=plastic)
![GitHub language count](https://img.shields.io/github/languages/count/dennislwm/playscribe?style=plastic)
![GitHub top language](https://img.shields.io/github/languages/top/dennislwm/playscribe?style=plastic)
![GitHub last commit](https://img.shields.io/github/last-commit/dennislwm/playscribe?color=red&style=plastic)
![Visitors count](https://hits.sh/github.com/dennislwm/playscribe/hits.svg)
![GitHub stars](https://img.shields.io/github/stars/dennislwm/playscribe?style=social)
![GitHub forks](https://img.shields.io/github/forks/dennislwm/playscribe?style=social)
![GitHub watchers](https://img.shields.io/github/watchers/dennislwm/playscribe?style=social)
![GitHub followers](https://img.shields.io/github/followers/dennislwm?style=social)

## Purpose

This document describes the `playscribe` automated process to summarize a YouTube link with ChatGPT.

## Audience

The audience for this document includes:

* User who will send a command with YouTube URL via a Telegram Bot, and receive a text with summarization of its transcript.

* DevSecOps Engineer who will design system workflows, configure and manage any SaaS or selfhosted services, and plan for disaster recovery.

## Why `playscribe`?

1. This summarization-as-a-service leverages on and applies a similar design from the [SudokuCliBot](https://dennislwm.netlify.app/posts/look-mum-no-servers/) automation to its workflow.

2. This service uses resources in both a free tier and a pay-per-usage tier by cloud SaaS providers:

  |   Free    | Pay-per-usage |
  |:---------:|:-------------:|
  | Pipedream |    ChatGPT    |
  |  GitHub   |               |
  | Telegram  |               |

3. This service is inexpensive, easy to implement, and can be duplicated for other services.

4. This service does not require implementing a custom frontend as the User will interact with a Telegram Bot.

5. This service does not require a backend server as the processing will be performed using ephemeral resources.

## Limitation

This project has several limitations:

* The Telegram Bot has a content limit for messages sent to the User.
* The pipeline job may exceed the time of the fixed delayed step in the workflow.
* The message is truncated after `40` lines and will include a link to the file `examples/result.txt`. However, the content of this file may be overridden by another pipeline.
* The workflow system does not allow conditional branches.

## Getting Started 🚀

We have a thorough guide on how to set up and get started with `playscribe` in our [documentation](https://github.com/dennislwm/playscribe/wiki).

## Bugs or Requests 🐛

If you encounter any problems feel free to open an [issue](https://github.com/dennislwm/playscribe/issues/new?template=bug_report.yml). If you feel the project is missing a feature, please raise a [ticket](https://github.com/dennislwm/playscribe/issues/new?template=feature_request.yml) on GitHub and I'll look into it. Pull requests are also welcome.

## 📫 How to reach me
<p>
<a href="https://www.linkedin.com/in/dennislwm"><img src="https://img.shields.io/badge/LinkedIn-blue?style=for-the-badge&logo=linkedin&labelColor=blue" height=25></a>
<a href="https://twitter.com/hypowork"><img src="https://img.shields.io/badge/twitter-%231DA1F2.svg?&style=for-the-badge&logo=twitter&logoColor=white" height=25></a>
<a href="https://leetradetitan.medium.com"><img src="https://img.shields.io/badge/medium-%2312100E.svg?&style=for-the-badge&logo=medium&logoColor=white" height=25></a>
<a href="https://dev.to/dennislwm"><img src="https://img.shields.io/badge/DEV.TO-%230A0A0A.svg?&style=for-the-badge&logo=dev-dot-to&logoColor=white" height=25></a>
<a href="https://www.youtube.com/user/dennisleewm"><img src="https://img.shields.io/badge/-YouTube-red?&style=for-the-badge&logo=youtube&logoColor=white" height=25></a>
</p>
<p>
<span class="badge-buymeacoffee"><a href="https://ko-fi.com/dennislwm" title="Donate to this project using Buy Me A Coffee"><img src="https://img.shields.io/badge/buy%20me%20a%20coffee-donate-yellow.svg" alt="Buy Me A Coffee donate button" /></a></span>
<span class="badge-patreon"><a href="https://patreon.com/dennislwm" title="Donate to this project using Patreon"><img src="https://img.shields.io/badge/patreon-donate-yellow.svg" alt="Patreon donate button" /></a></span>
<span class="badge-newsletter"><a href="https://buttondown.email/dennislwm" title="Subscribe to Newsletter"><img src="https://img.shields.io/badge/newsletter-subscribe-blue.svg" alt="Subscribe Dennis Lee's Newsletter" /></a></span>
