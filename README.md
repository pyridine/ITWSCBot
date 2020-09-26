# ITWSCBot

This is the Twitter bot for [isthatwordspelledcorrectly.com](http://isthatwordspelledcorrectly.com/). It tweets one correctly spelled word every 7 hours. Check it out at [@ITWSCBot](https://twitter.com/ITWSCBot).

## Deploying

First, create a file `/env.config` with your Twitter API keys, following [/env.config.example](/env.config.example).

Build the image:
```
./build.sh
```

Tag the image as `itwscbot_latest` and push it to your docker repo:
```
./tag.sh YOUR_DOCKER/REPO
```

Create a file `/docker-production.yml` with the following contents:
```
services:
  itwscbot:
    image: YOUR_DOCKER_HUB/REPO:itwscbot_latest
```

Deploy it to your docker context:
```
./deploy.sh YOUR_DOCKER_CONTEXT
```

## Etc
The words list [/safe_words](/safe_words) was obtained the following way:

Take this [english words list](https://github.com/dwyl/english-words) and this [list of obscene words](https://github.com/LDNOOBW/List-of-Dirty-Naughty-Obscene-and-Otherwise-Bad-Words) and run

```
rg -v -f obscene_words english_words > safe_words
```

to remove all instances of obscene words from the english words, and pipe that to a new file.

Note that  I am removing all occurrences of the obscene words, even if they occur as substrings or not. I am falling prey to the [Scunthorpe Problem](https://en.wikipedia.org/wiki/Scunthorpe_problem). But I think the resulting list is more interesting with so many common words removed.
