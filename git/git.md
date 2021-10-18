# Using Personal Access Tokens
As of August 2021, Git now uses personal access tokens for a variety of security benefits. If you are having trouble
using git for a repo you may need to autorize a personal access token (PAT). To do so navigate to your github profile
then:
1. Settings > Developer Settings > Personal access tokens > Generate new toekn
2. Add a note to remind yourself what this token is for, set the expiration and select the 'repo' scope for most uses.
3. Copy the token, this is basically your password now.
4. If you are trying to push a commit from a repo you already have configured, use this token as your password when
   prompted. (Passwords won't appear when pasted into terminal).
5. To avoid having to copy this token in each time, run:
```
git config --global credential.helper cache
```
you'll be prompted once more for your token.
