#!/usr/bin/env python2

# Decrypts encrypted messages :)

import sys
import re

def main():
  if len(sys.argv) != 3:
    assert('Usage ./decrypt.py textfile keyfile')
  textfile = sys.argv[1]
  keyfile = sys.argv[2]
  conv={}
  fk=open(keyfile, "r")
  line=fk.readline()
  while line:
    k,l = line.rstrip().split("|")
    if conv.has_key(k):
      assert("Keyfile has duplicate keys!")
    conv[k] = l
    line=fk.readline()
  fk.close()
  ft=open(textfile,"r")
  text=ft.read()
  for kk in conv.keys():
    text=re.sub(kk, conv[kk], text)
  ft.close()
  print text

if __name__ == "__main__":
  main()