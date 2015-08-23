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

SKIPPED_COUNT=0

for file in /home/coolovo/*.jpg; do
  # Fix the name.
  FILE_NAME=`echo $file | sed 's/.jpg//g' | sed 's/\/home\/coolovo\///g'`

  if [ ! -f /home/coolovo/index/$FILE_NAME.txt ]; then
      if [ SKIPPED_COUNT > 0 ]; then 
        echo "Skipped $SKIPPED_COUNT files!"
		SKIPPED_COUNT=0
      fi

      echo "Processing image $FILE_NAME..."
      echo "Processing image $FILE_NAME..." >> recognition_all.log
      ./recognition $FILE_NAME >> recognition_all.log
  else 
      ((SKIPPED_COUNT++))
  fi
done