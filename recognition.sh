# Coolovo.eu - Funny images and stuff.
# Copyright (c) 2015, Matej Kormuth <http://matejkormuth.eu>
# All rights reserved.
# 
# Redistribution and use in source and binary forms, with or without modification,
# are permitted provided that the following conditions are met:
# 
# 1. Redistributions of source code must retain the above copyright notice, this
# list of conditions and the following disclaimer.
# 
# 2. Redistributions in binary form must reproduce the above copyright notice,
# this list of conditions and the following disclaimer in the documentation and/or
# other materials provided with the distribution.
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
# ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
# ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

OUTPUT_NAME="test"
# Accept all spelling fixes.
ACCEPT_STRING="11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111";

# Perform OCR.
tesseract $1.jpg $OUTPUT_NAME -psm 1 -l slk > /dev/null 2>&1
# Clean up lines.
sed '/^\s*$/d' $OUTPUT_NAME.txt > $OUTPUT_NAME.processed.txt
# Lowercase all characters.
tr '[:upper:]' '[:lower:]' < $OUTPUT_NAME.processed.txt > $OUTPUT_NAME.txt
cp $OUTPUT_NAME.txt $OUTPUT_NAME.processed.txt
# Fix spelling.
echo -e "$ACCEPT_STRING" > aspell check --sug-mode=bad-spellers -l sk --ignore-case $OUTPUT_NAME.processed.txt
# Output to right file.
cp $OUTPUT_NAME.processed.txt /home/coolovo/index/$1.txt