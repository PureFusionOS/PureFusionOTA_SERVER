#!/bin/bash
export FILESIZE=999999 
sed -i -- 's/'"<FileSize"'.\+<\/\FileSize>/'"\<FileSize type=\"\integer\"\>$FILESIZE<\/\FileSize>"'/g' pme.xml
