#PATH="/root/.gem/ruby/2.2.0/bin:$PATH"
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

PATH=$PATH:~/.node_modules/bin
export npm_config_prefix=~/.node_modules
