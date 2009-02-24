/*
 *  The contents of this file are subject to the Mozilla Public License
 *  Version 1.0 (the "License"); you may not use this file except in
 *  compliance with the License. You may obtain a copy of the License at
 *  http://www.mozilla.org/MPL/
 *
 *  Software distributed under the License is distributed on an "AS IS"
 *  basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
 *  License for the specific language governing rights and limitations
 *  under the License.
 *
 *  The Original Code is XS code, released February 4, 2004.
 *
 *  The Initial Developer of the Original Code is Taiichi Yuasa.
 *  Portions created by Taiichi Yuasa are Copyright (C) 2004
 *  Taiichi Yuasa. All Rights Reserved.
 *
 *  Contributor(s): Taiichi Yuasa <yuasa@kuis.kyoto-u.ac.jp>
 */

#include <conio.h>
#include <dsound.h>
#include <unistd.h>
#include <stdlib.h>

static const note_t ok[] = { 
  { PITCH_C5, 3 },
  { PITCH_END, 0}
};
static const note_t ng[] = { 
  { PITCH_C1, 1 },
  { PITCH_END, 0}
};
void *ps[10];

int main(int argc, char **argv) {
  int i, pp=0;

  for (i=24; i>0; ) {
    void *p = malloc(i*1024);
    cputc_4(i/10+'0');
    cputc_3(i%10+'0');
    if (p) {
      ps[pp++] = p;
      cputc_2('-');
      dsound_play(ok);
    } else {
      cputc_2(' ');
      dsound_play(ng);
      i--;
    }
    wait_event(dsound_finished,0);
  }
  while (pp>0)
    free(ps[--pp]);
  return 0;
}
