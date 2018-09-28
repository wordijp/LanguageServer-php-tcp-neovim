# LanguageServer-php-tcp-neovim

Tcp connection with [php-language-server](https://github.com/felixfbecker/php-language-server) plugin for
[LanguageClient-neovim](https://github.com/autozimu/LanguageClient-neovim).

this plugin is simply, Bridge between both for Tcp connection.

## Why Tcp?

php-language-server plugin is [blocking STDIO on Windows](https://github.com/felixfbecker/php-language-server#command-line-arguments). 
So, mainly use this plugin in Windows.


## Installation

Using [`vim-plug`](https://github.com/junegunn/vim-plug):

```vim
Plug 'wordijp/LanguageServer-php-tcp-neovim', {
    \ 'do': './install.sh && composer install && composer run-script parse-stubs',
    \ }
```

## License

The MIT License.
