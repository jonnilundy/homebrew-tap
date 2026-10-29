# homebrew-tap

Homebrew casks for Jonni Lundy's apps.

```bash
brew install jonnilundy/tap/sidekick
```

| Cask | App |
| --- | --- |
| `sidekick` | [Sidekick](https://github.com/jonnilundy/sidekick), a quick-answer panel for the Claude Code CLI |

Sidekick updates itself with Sparkle, so `brew upgrade` skips it unless you pass `--greedy`.

`scripts/release.sh --publish` in the Sidekick repo bumps `Casks/sidekick.rb` here after each release.
