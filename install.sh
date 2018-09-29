#!/usr/bin/env sh
# Try install by
#   - download binary
#   - build with go

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

version=v0.1
name=availableport

try_curl() {
    command -v curl > /dev/null && \
        curl --fail --location "$1" --output download/"$2"
}

try_wget() {
    command -v wget > /dev/null && \
        wget --output-document=download/"$2" "$1"
}

release() {
    ok=0
    [ $ok = 0 ] && [ "${1##*.}" = "gz"  ] && tar -zxvf download/$1 -C download && ok=1
    [ $ok = 0 ] && [ "${1##*.}" = "zip" ] && unzip -o download/$1 -d download && ok=1
    [ $ok = 0 ] && echo "decompress failed" && return 1

    # successed

    cp -f download/$name bin/$name
    chmod a+x bin/$name
}

download() {
    echo "Downloading bin/${name}..."
    url=https://github.com/wordijp/LanguageServer-php-tcp-neovim/releases/download/$version/$1
    mkdir -p download
    if (try_curl "$url" "$1" || try_wget "$url" "$1"); then
        release $1
        return
    else
        try_build || echo "Prebuilt binary might not be ready yet. Please check minutes later."
    fi
}

try_build() {
    if command -v go > /dev/null; then
        echo "Trying build locally ..."
        make && make release
    else
        return 1
    fi
}

rm -f bin/$name

arch=$(uname -sm)
case "${arch}" in
    "Linux x86_64")  download ${name}_linux_amd64.tar.gz ;;
    "Linux i686")    download ${name}_linux_386.tar.gz ;;
    "Darwin x86_64") download ${name}_darwin_amd64.zip ;;
    *) echo "No pre-built binary available for ${arch}."; try_build ;;
esac
