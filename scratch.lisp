; (ql:quickload :parse)
; (ql:quickload :lexer)
; (ql:quickload :re)
; (ql:quickload :cl-unicode)

(defpackage :lark
  (:use :cl :parse))

(in-package :lark)

(ql:quickload :str)
(ql:quickload :re)

(defun make-node (type content)
  (list (cons :type type) (cons :content content)))

(defun parse-document (document-string)
  "Parses a string as a Lark document"
  (let* ((lines (split-sequence:split-sequence #\NEWLINE document-string)))
  ; What do we need to do here?
  ; Split the doc into lines.
  ; Join lines together into block elements
  ; process each block element
  ))

; block elements

(defun header-1? (line)
  (str:starts-with? "# " line))

(defun header-2? (line)
  (str:starts-with? "## " line))

(defun empty-line? (line)
  (re:match-re "^%s*$" line))

(defun blockquote? (line)
  (str:starts-with? "> " line))

(defun codefence? (line)
  (str:starts-with? "```" line))

(defun thematic-break? (line)
  (equal "---" line))

(defun list-item? (line)
  (str:starts-with? "- " line))

(defun make-block-reader (lines)
  #'(lambda ()
      (let ((x (pop lines)))
        (when x
          (cond 
            ((header-1? x) (values :header1 (make-node :h1 (subseq x 2))))
            ((header-2? x) (values :header2 (make-node :h2 (subseq x 3))))
            ((thematic-break? x) (values :thematic-break (make-node :hr x)))
            ((list-item? x) (values :list-item (make-node :li (subseq x 2))))
            ((blockquote? x) (values :blockquote (subseq x 2)))
            ((codefence? x) (values :codefence x))
            ((empty-line? x) (values :empty-line x))
            (t (values :simple x)))))))

; read in a test doc:
; (defparameter *testfile-lines* (uiop:read-file-lines "test-document.lark"))

; (defparameter *testfile-reader* (make-block-reader *testfile-lines*))

(defun .is-not (p &key (test #'eql))
  (.is p :test (lambda (x y) (not (funcall test x y)))))

(define-parser lark-parser
  (.many-until
   (.either
    (.do 'empty-line-parser 'block-element-parser)
    'block-element-parser)
   (.eof)))

(define-parser block-element-parser
  (.or 
   (.is :header1)
   (.is :header2)
   (.is :thematic-break)
   'list-parser
   'paragraph-parser
   'codefence-parser 
   'empty-line-parser
  ))


(define-parser codefence-parser
  "parse a fenced code block"
  (.let (code (.between (.is :codefence) (.is :codefence) (.many (.is-not :codefence))))
    (.ret (make-node :pre (str:join #\NEWLINE code)))))

(define-parser paragraph-parser
  "parse a paragraph, which is any number of sequential :simple lines"
  (.let (lines (.many1 (.is :simple)))
    (.ret (make-node :p (str:join #\NEWLINE lines)))))

(define-parser list-parser
  "parse a list, which is any number of :list-item"
  (.let (items (.many1 (.is :list-item)))
    (.ret (make-node :ul items))))

(define-parser blockquote-parser
  (.let (lines (.many1 (.is :blockquote)))
    (.ret (make-node :quote (str:join #\NEWLINE lines)))))

(define-parser empty-line-parser
  (.skip-many1 (.is :empty-line)))

;;; a subset of features of markdown:
; # Heading                -> h1
; ## subheading
; [link text](link to)
; [[internal wiki link]]
; - list item
; *...* bold
; _..._ italic
; `...` code 
; ```
;    ...
; ``` fenced multiline code

; Things you can only do at the start of a line:
; ``` open a fence
; ``` close a fence
; these are blocks, in fact
; > open a quote
; - list item
; * list item
; + list item
; # declare a heading

; Things you can do inside of a paragraph:
; *...* bold
; _..._ italic
; `...` inline code
; {(princ "foo")} inline lisp. First-pass read evaluation?

; Paragraphs are separated by double newlines, or by beginning-of-line declarations.


; First step:
; parse doc
