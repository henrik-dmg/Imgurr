# Imgurr - a simple CLI tool to upload and delete images from Imgur
## Installation
### Manual
- Clone the repo with `git clone https://github.com/henrik-dmg/Imgurr.git`
- Call the `install.sh` script (e.g. `sh Imgurr/install.sh`). This will install `imgurr` into `/usr/local/bin`

### [Mint](https://github.com/yonaskolb/mint)
```
$ mint install henrik-dmg/Imgurr
```

## Usage
### Set Client ID
First, get a client ID from the Imgur [developer portal](https://api.imgur.com/oauth2/addclient). Then call `imgurr set-client "{yourClientID}"`

### Upload Images
To upload images, simply call `imgurr upload [<images> ...]`. The output will be each Imgur URL on a new line.

### Delete images
To delete images, call `imgurr delete imgurURL`. Please note that you can only delete images through `imgurr delete` that you have also upload through it for now (it stores the delete hashes in `UserDefaults`)

### Get info
You can take a look at each uploaded image by calling `imgurr info` which will give you URLs, upload dates, etc.

## TODO
- [ ] Write tests
- [ ] Support deletion by plain delete hashes
