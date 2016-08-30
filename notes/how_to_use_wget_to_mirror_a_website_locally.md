# How to use wget to mirror a website locally

Tags: wget snippet mirror

Created: 2016-08-24 10:57:01

[Make Offline Mirror of a Site using `wget` | Guy Rutenberg](https://www.guyrutenberg.com/2014/05/02/make-offline-mirror-of-a-site-using-wget/)

I modified this slightly to get:

```bash
local wget_opts
wget_opts=()
wget_opts+=( --convert-links ) # Convert links to be relative
wget_opts+=( --adjust-extension ) # Make extension match content-type
wget_opts+=( --page-requisites ) # Download CSS and anything else to mirror page correctly
wget_opts+=( --no-parent ) # Do not ascend to parent directory
wget_opts+=( --no-clobber ) # Don't overwrite files

if [ -n "$opt_quiet" ]; then
    wget_opts+=( --no-verbose ) # turn off verboseness, without being quiet
fi

wget "${wget_opts[@]}" "$opt_url"
```
