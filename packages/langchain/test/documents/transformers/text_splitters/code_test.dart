import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  group('CodeTextSplitter tests', () {
    const chunkSize = 16;

    test('Test C++ code', () {
      final splitter = CodeTextSplitter(
        language: CodeLanguage.cpp,
        chunkSize: chunkSize,
        chunkOverlap: 0,
      );
      const code = '''
#include <iostream>

int main() {
    std::cout << "Hello, World!" << std::endl;
    return 0;
}
''';
      final chunks = splitter.splitText(code);

      expect(chunks, [
        '#include',
        '<iostream>',
        'int main() {',
        'std::cout',
        '<< "Hello,',
        'World!" <<',
        'std::endl;',
        'return 0;\n}',
      ]);
    });

    test('Test Dart code splitter', () {
      final splitter = CodeTextSplitter(
        language: CodeLanguage.dart,
        chunkSize: chunkSize,
        chunkOverlap: 0,
      );
      const code = '''
void main() {
  print("Hello, World!");
}
''';
      final chunks = splitter.splitText(code);

      expect(chunks, [
        'void main() {',
        'print("Hello,',
        'World!");',
        '}',
      ]);
    });

    test('Test Golang code', () {
      final splitter = CodeTextSplitter(
        language: CodeLanguage.go,
        chunkSize: chunkSize,
        chunkOverlap: 0,
      );
      const code = '''
package main

import "fmt"

func helloWorld() {
    fmt.Println("Hello, World!")
}

func main() {
    helloWorld()
}''';
      final chunks = splitter.splitText(code);

      expect(chunks, [
        'package main',
        'import "fmt"',
        'func',
        'helloWorld() {',
        'fmt.Println("He',
        'llo,',
        'World!")',
        '}',
        'func main() {',
        'helloWorld()',
        '}',
      ]);
    });

    test('Test HTML code splitter', () {
      final splitter = CodeTextSplitter(
        language: CodeLanguage.html,
        chunkSize: 60,
        chunkOverlap: 0,
      );
      const code = '''
<h1>Sample Document</h1>
    <h2>Section</h2>
        <p id="1234">Reference content.</p>

    <h2>Lists</h2>
        <ul>
            <li>Item 1</li>
            <li>Item 2</li>
            <li>Item 3</li>
        </ul>

        <h3>A block</h3>
            <div class="amazing">
                <p>Some text</p>
                <p>Some more text</p>
            </div>''';
      final chunks = splitter.splitText(code);

      expect(chunks, [
        '<h1>Sample Document</h1>\n    <h2>Section</h2>',
        '<p id="1234">Reference content.</p>',
        '<h2>Lists</h2>\n        <ul>',
        '<li>Item 1</li>\n            <li>Item 2</li>',
        '<li>Item 3</li>\n        </ul>',
        '<h3>A block</h3>',
        '<div class="amazing">',
        '<p>Some text</p>',
        '<p>Some more text</p>\n            </div>',
      ]);
    });

    test('Test Java code', () {
      final splitter = CodeTextSplitter(
        language: CodeLanguage.java,
        chunkSize: chunkSize,
        chunkOverlap: 0,
      );
      const code = '''
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
''';
      final chunks = splitter.splitText(code);

      expect(chunks, [
        'public class',
        'HelloWorld {',
        'public',
        'static void',
        'main(String[]',
        'args) {',
        'System.out.prin',
        'tln("Hello,',
        'World!");',
        '}\n}',
      ]);
    });

    test('Test JavaScript code', () {
      final splitter = CodeTextSplitter(
        language: CodeLanguage.js,
        chunkSize: chunkSize,
        chunkOverlap: 0,
      );
      const code = '''
function helloWorld() {
  console.log("Hello, World!");
}

// Call the function
helloWorld();
''';
      final chunks = splitter.splitText(code);

      expect(chunks, [
        'function',
        'helloWorld() {',
        'console.log("He',
        'llo,',
        'World!");',
        '}',
        '// Call the',
        'function',
        'helloWorld();',
      ]);
    });

    test('Test LaTeX code splitter', () {
      final splitter = CodeTextSplitter(
        language: CodeLanguage.latex,
        chunkSize: chunkSize,
        chunkOverlap: 0,
      );
      const code = r'''
\documentclass{article}

\title{Sections and Chapters}
\author{Overleaf}
\date{\today}

\begin{document}
\maketitle
\section{Introduction}

This is a section.
\end{document}
''';
      final chunks = splitter.splitText(code);

      expect(chunks, [
        r'\documentclass{a',
        r'rticle}',
        r'\title{Sections',
        r'and Chapters}',
        r'\author{Overlea',
        r'f}',
        r'\date{\today}',
        r'\begin{document',
        r'}',
        r'\maketitle',
        r'\section{Introd',
        r'uction}',
        r'This is a',
        r'section.',
        r'\end{document}',
      ]);
    });

    test('Test Markdown code splitter', () {
      final splitter = CodeTextSplitter(
        language: CodeLanguage.markdown,
        chunkSize: chunkSize,
        chunkOverlap: 0,
      );
      const code = '''
# Sample Document

## Section

This is the content of the section.

## Lists

- Item 1
- Item 2
- Item 3

### Horizontal lines

***********
____________
-------------------

#### Code blocks
```
This is a code block
```
''';
      final chunks = splitter.splitText(code);

      expect(chunks, [
        '# Sample',
        'Document',
        '## Section',
        'This is the',
        'content of the',
        'section.',
        '## Lists',
        '- Item 1',
        '- Item 2',
        '- Item 3',
        '### Horizontal',
        'lines',
        '***********',
        '____________',
        '---------------',
        '----',
        '#### Code',
        'blocks',
        '```',
        'This is a code',
        'block',
        '```',
      ]);
    });

    test('Test PHP code splitter', () {
      final splitter = CodeTextSplitter(
        language: CodeLanguage.php,
        chunkSize: chunkSize,
        chunkOverlap: 0,
      );
      const code = '''
<?php
function hello_world() {
    echo "Hello, World!";
}

hello_world();
?>''';
      final chunks = splitter.splitText(code);

      expect(chunks, [
        '<?php',
        'function',
        'hello_world() {',
        'echo',
        '"Hello,',
        'World!";',
        '}',
        'hello_world();',
        '?>',
      ]);
    });

    test('Test proto file', () {
      final splitter = CodeTextSplitter(
        language: CodeLanguage.proto,
        chunkSize: chunkSize,
        chunkOverlap: 0,
      );
      const code = '''
syntax = "proto3";

package example;

message Person {
    string name = 1;
    int32 age = 2;
    repeated string hobbies = 3;
}
''';
      final chunks = splitter.splitText(code);

      expect(chunks, [
        'syntax =',
        '"proto3";',
        'package',
        'example;',
        'message Person',
        '{',
        'string name',
        '= 1;',
        'int32 age =',
        '2;',
        'repeated',
        'string hobbies',
        '= 3;',
        '}',
      ]);
    });

    test('Test Python code', () {
      final splitter = CodeTextSplitter(
        language: CodeLanguage.python,
        chunkSize: chunkSize,
        chunkOverlap: 0,
      );
      const code = '''
def hello_world():
    print("Hello, World!")

# Call the function
hello_world()''';
      final chunks = splitter.splitText(code);

      expect(chunks, [
        'def',
        'hello_world():',
        'print("Hello,',
        'World!")',
        '# Call the',
        'function',
        'hello_world()',
      ]);
    });

    test('Test RST code', () {
      final splitter = CodeTextSplitter(
        language: CodeLanguage.rst,
        chunkSize: chunkSize,
        chunkOverlap: 0,
      );
      const code = '''
Sample Document
===============

Section
-------

This is the content of the section.

Lists
-----

- Item 1
- Item 2
- Item 3

Comment
*******
Not a comment

.. This is a comment
''';
      final chunks = splitter.splitText(code);

      expect(chunks, [
        'Sample Document',
        '===============',
        'Section',
        '-------',
        'This is the',
        'content of the',
        'section.',
        'Lists',
        '-----',
        '- Item 1',
        '- Item 2',
        '- Item 3',
        'Comment',
        '*******',
        'Not a comment',
        '.. This is a',
        'comment',
      ]);
    });

    test('Test Ruby code splitter', () {
      final splitter = CodeTextSplitter(
        language: CodeLanguage.ruby,
        chunkSize: chunkSize,
        chunkOverlap: 0,
      );
      const code = '''
def hello_world
  puts "Hello, World!"
end

hello_world''';
      final chunks = splitter.splitText(code);

      expect(chunks, [
        'def hello_world',
        'puts "Hello,',
        'World!"',
        'end',
        'hello_world',
      ]);
    });

    test('Test Rust code splitter', () {
      final splitter = CodeTextSplitter(
        language: CodeLanguage.rust,
        chunkSize: chunkSize,
        chunkOverlap: 0,
      );
      const code = '''
fn main() {
    println!("Hello, World!");
}''';
      final chunks = splitter.splitText(code);

      expect(chunks, [
        'fn main() {',
        'println!("Hello',
        ',',
        'World!");',
        '}',
      ]);
    });

    test('Test Scala code splitter', () {
      final splitter = CodeTextSplitter(
        language: CodeLanguage.scala,
        chunkSize: chunkSize,
        chunkOverlap: 0,
      );
      const code = '''
object HelloWorld {
  def main(args: Array[String]): Unit = {
    println("Hello, World!")
  }
}''';
      final chunks = splitter.splitText(code);

      expect(chunks, [
        'object',
        'HelloWorld {',
        'def',
        'main(args:',
        'Array[String]):',
        'Unit = {',
        'println("Hello,',
        'World!")',
        '}\n}',
      ]);
    });

    test('Test Swift code splitter', () {
      final splitter = CodeTextSplitter(
        language: CodeLanguage.swift,
        chunkSize: chunkSize,
        chunkOverlap: 0,
      );
      const code = '''
func helloWorld() {
    print("Hello, World!")
}

helloWorld()''';
      final chunks = splitter.splitText(code);

      expect(chunks, [
        'func',
        'helloWorld() {',
        'print("Hello,',
        'World!")',
        '}',
        'helloWorld()',
      ]);
    });

    test('Test Solidity code splitter', () {
      final splitter = CodeTextSplitter(
        language: CodeLanguage.solidity,
        chunkSize: chunkSize,
        chunkOverlap: 0,
      );
      const code = '''
pragma solidity ^0.8.20;
contract HelloWorld {
    function add(uint a, uint b) pure public returns(uint) {
      return  a + b;
    }
}
''';
      final chunks = splitter.splitText(code);

      expect(chunks, [
        'pragma solidity',
        '^0.8.20;',
        'contract',
        'HelloWorld {',
        'function',
        'add(uint a,',
        'uint b) pure',
        'public',
        'returns(uint) {',
        'return  a',
        '+ b;',
        '}\n}',
      ]);
    });
  });
}
