#!/bin/sh

zip -r temp.zip haxelib.json src README.md LICENSE
haxelib submit temp.zip
rm temp.zip