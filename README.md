# Imgurr - a simple CLI tool to upload and delete images from Imgur
## Installation
- First, get a client ID from the Imgur [developer portal](https://api.imgur.com/oauth2/addclient)
- Call the `install.sh` script with the client ID as a parameter (e.g. `sh install.sh clientID`). This will install `imgurr` into `/usr/local/bin`

## Usage
### Upload Images
To upload images, simply call `imgurr upload [<images> ...]`. The output will be each Imgur URL on a new line.

### Delete images
To delete images, call `imgurr delete imgurURL`. Please note that you can only delete images through `imgurr delete` that you have also upload through it for now (it stores the delete hashes in `UserDefaults`)

### Get info
You can take a look at each uploaded image by calling `imgurr info` which will give you URLs, upload dates, etc.

## TODO
- [ ] Write tests
- [ ] Support deletion by plain delete hashes
