rm -fR ./docs
# Fetch the latest release information and extract the download URL
url=$(wget -qO- https://api.github.com/repos/winglang/wing/releases/latest | grep "browser_download_url" | cut -d '"' -f 4 | grep docs.tgz)
wget $url
tar -xzf docs.tgz --wildcards 'docs/api/*' -C docs/
rm docs.tgz





