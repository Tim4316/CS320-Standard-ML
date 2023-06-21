####################################################
#!/usr/bin/env python3
####################################################
import sys
sys.path.append('./../../../../mypylib')
from mypylib_cls import *
####################################################
#
# HX-2023-06-12: 10 points
# Please *translate* into Python the SML solution
# to word_neighbors (which is the one for Assign03-02)
#
def word_neighbors(word):
    """
    Note that this function should returns a fnlist
    (not a pylist)
    Your implementation should be combinator-based very
    much like the posted solution.
    """
    raise NotImplementedError
#
####################################################
"""val word_neighbors = fn (word: string) =>
  let
    val len = string_length word
    fun char_variant (i, ch) j = 
      if ch = strsub(AB, j)
      then NONE
      else 
        SOME (string_tabulate (len, fn k => 
            if k = i 
            then strsub(AB, j) 
            else strsub(word, k)))
    fun char_variants (i, ch) = 
        list_map (list_filter (list_tabulate (26, char_variant (i, ch)), optn_is_some), optn_unsome)
  in
    list_concat (string_imap_list(word, char_variants))
  end"""
def word_neighbors(word):
    result = fnlist_nil()
    for i in range(len(word)):
        for letter in 'abcdefghijklmnopqrstuvwxyz':
            if word[i] != letter:
                neighbor = word[:i] + letter + word[i+1:]
                result = fnlist_cons(neighbor, result)

    return result