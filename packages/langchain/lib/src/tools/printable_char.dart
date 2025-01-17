// Copyright 2009 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
// https://github.com/golang/go/blob/master/LICENSE

//This source file has ben taken from https://raw.githubusercontent.com/xxgreg/dart_printable_char/refs/heads/master/lib/printable_char.dart

part 'printable_char_table.dart';

/// isPrintable reports whether the rune is defined as a Graphic by Unicode,
/// except that the only spacing character is ASCII space, U+0020.
/// Such characters include letters, marks, numbers, punctuation, and symbols
/// from categories L, M, N, P, S.
bool isPrintable(int rune) {
  // Fast check for Latin-1
  if (rune <= 0xFF) {
    if (0x20 <= rune && rune <= 0x7E) {
      // All the ASCII is printable from space through DEL-1.
      return true;
    }
    if (0xA1 <= rune && rune <= 0xFF) {
      // Similarly for ¡ through ÿ...
      return rune != 0xAD; // ...except for the bizarre soft hyphen.
    }
    return false;
  }

  // Same algorithm, either on uint16 or uint32 value.
  // First, find first i such that isPrint[i] >= x.
  // This is the index of either the start or end of a pair that might span x.
  // The start is even (isPrint[i&~1]) and the end is odd (isPrint[i|1]).
  // If we find x in a range, make sure x is not in isNotPrint list.

  int i, j;
  if (0 <= rune && rune < 1 << 16) {
    i = _bsearch(_isPrint16, rune);
    if (i >= _isPrint16.length ||
        rune < _isPrint16[i & ~1] ||
        _isPrint16[i | 1] < rune) {
      return false;
    }
    j = _bsearch(_isNotPrint16, rune);
    return j >= _isNotPrint16.length || _isNotPrint16[j] != rune;
  }

  i = _bsearch(_isPrint32, rune);
  if (i >= _isPrint32.length ||
      rune < _isPrint32[i & ~1] ||
      _isPrint32[i | 1] < rune) {
    return false;
  }
  if (rune >= 0x20000) {
    return true;
  }
  rune -= 0x10000;
  j = _bsearch(_isNotPrint32, rune);
  return j >= _isNotPrint32.length || _isNotPrint32[j] != rune;
}

/// IsGraphic reports whether the rune is defined as a Graphic by Unicode.
///
/// Such characters include letters, marks, numbers, punctuation, symbols, and
/// spaces, from categories L, M, N, P, S, Zs.
bool isGraphic(int rune) {
  if (isPrintable(rune)) return true;
  if (rune > 0xFFFF) return false;
  final i = _bsearch(_isGraphic, rune);
  return i < _isGraphic.length && rune == _isGraphic[i];
}

// bsearch returns the smallest i such that a[i] >= x.
// If there is no such i, bsearch returns len(a).
int _bsearch(List<int> a, int x) {
  int i = 0;
  int j = a.length;
  while (i < j) {
    final h = i + (j - i) ~/ 2;
    if (a[h] < x) {
      i = h + 1;
    } else {
      j = h;
    }
  }
  return i;
}
