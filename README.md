# Lark

Lark is (L)isp m(ark)up

This is my seriously non-serious attempt at my own markup language. Right now it's in tension between being:
- an extended subset of markdown, parsed in common lisp (Nark -- (N)ot m(ark)down)
- an html DSL for common lisp (Lark -- (L)isp m(ark)up)

Let's just call it Lark for now, it's pretty.

> "Every lisper writes their own html DSL, it's practically a rite of passage"_
> - somebody on some webforum once
    
It looks like markdown but it's not full markdown, and soon it might have some decidedly not-markdown stuff
    
# Goals of Lark

- Create some HTML templating tooling suitable for [disast.rs](https://disast.rs)
- Explore text parsing and transformation
- Learn some stuff
- Have some fun
    
# Non-goals of Lark

- Be "fully featured", "suitable for use in production", "polished", etc
- Be a CommonMark library for common lisp
    
# Inspirations and resources:
- [CommonDoc](http://commondoc.github.io/docs/overview.html)
- [CommonMark Spec](https://spec.commonmark.org/0.31.2/)
- [Parse Library](https://github.com/massung/parse)
    
# Other

No relation to the [Lark](https://github.com/lark-parser/lark) parsing toolkit for Python. Looks cool though.
    
## Neat:
    
Here's what the readme looks like if you parse it like this:
    
`(parse 'lark-parser (make-block-reader (uiop:read-file-lines "README.md")))`
    
```lisp

(((:TYPE . :H1) (:CONTENT . "Lark")) ((:TYPE . :P) (:CONTENT . "Lark is (L)isp m(ark)up"))
 ((:TYPE . :P)
  (:CONTENT
   . "This is my seriously non-serious attempt at my own markup language. Right now it's in tension between being:"))
 ((:TYPE . :UL)
  (:CONTENT
   ((:TYPE . :LI) (:CONTENT . "an extended subset of markdown, parsed in common lisp (Nark -- (N)ot m(ark)down)"))
   ((:TYPE . :LI) (:CONTENT . "an html DSL for common lisp (Lark -- (L)isp m(ark)up)"))))
 ((:TYPE . :P) (:CONTENT . "Let's just call it Lark for now, it's pretty."))
 ((:TYPE . :QUOTE)
  (:CONTENT . "\"Every lisper writes their own html DSL, it's practically a rite of passage\"_
- somebody on some webforum once"))
 ((:TYPE . :P)
  (:CONTENT . "I guess this is a little more than that as it will include some kind of   
It looks like markdown but it's not full markdown, and soon it might have some decidedly not-markdown stuff"))
 ((:TYPE . :H1) (:CONTENT . "Goals of Lark"))
 ((:TYPE . :UL)
  (:CONTENT
   ((:TYPE . :LI) (:CONTENT . "Create some HTML templating tooling suitable for [disast.rs](https://disast.rs)"))
   ((:TYPE . :LI) (:CONTENT . "Explore text parsing and transformation"))
   ((:TYPE . :LI) (:CONTENT . "Learn some stuff")) ((:TYPE . :LI) (:CONTENT . "Have some fun"))))
 ((:TYPE . :H1) (:CONTENT . "Non-goals of Lark"))
 ((:TYPE . :UL)
  (:CONTENT
   ((:TYPE . :LI) (:CONTENT . "Be \"fully featured\", \"suitable for use in production\", \"polished\", etc"))
   ((:TYPE . :LI) (:CONTENT . "Be a CommonMark library for common lisp"))))
 ((:TYPE . :H1) (:CONTENT . "Inspirations and resources:"))
 ((:TYPE . :UL)
  (:CONTENT ((:TYPE . :LI) (:CONTENT . "[CommonDoc](http://commondoc.github.io/docs/overview.html)"))
   ((:TYPE . :LI) (:CONTENT . "[CommonMark Spec](https://spec.commonmark.org/0.31.2/)"))
   ((:TYPE . :LI) (:CONTENT . "[Parse Library](https://github.com/massung/parse)"))))
 ((:TYPE . :H1) (:CONTENT . "Other"))
 ((:TYPE . :P)
  (:CONTENT
   . "No relation to the [Lark](https://github.com/lark-parser/lark) parsing toolkit for Python. Looks cool though.")))
```
