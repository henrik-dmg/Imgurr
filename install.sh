#!/bin/sh

set -e

INJECTOR_TEXT="struct ClientIDInjector {\n\tstatic let clientID = \"$1\"\n}"
RESTORE_TEXT="struct ClientIDInjector {\n\tstatic let clientID = \"<--- your Client ID goes here --->\"\n}"

echo $INJECTOR_TEXT > Sources/ImgurrCore/ClientIDInjector.swift

swift build -c release

cp .build/release/imgurr /usr/local/bin/imgurr

echo $RESTORE_TEXT > Sources/ImgurrCore/ClientIDInjector.swift
