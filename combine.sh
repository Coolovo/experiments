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

# Start.
BIG_FILE="/home/coolovo/big.cache"
FILE_COUNT=`ls -1 /home/coolovo/index/ | wc -l`
CURRENT_FILE=1

echo "Removing old big.cache..."
rm BIG_FILE

echo "Combining cache files to one big file."

for file in /home/coolovo/index/*.txt; do
  echo "File $CURRENT_FILE / $FILE_COUNT"

  # Fix the name.
  FILE_NAME=`echo $file | sed 's/.txt//g' | sed 's/\/home\/coolovo\/index\///g'`
  # Create content.
  CONTENT=`cat $file | tr '\r' ' ' | tr '\n' ' '`
  # Fix lines one more time.
  WRITTEN_CONTENT=`echo "$FILE_NAME|$CONTENT" | tr '\r' ' ' | tr '\n' ' '`
  # Write the key (image id).
  echo $WRITTEN_CONTENT >> $BIG_FILE
  # Increment current file.
  ((CURRENT_FILE++))
done