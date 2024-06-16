# Lark

Lark is (L)isp m(ark)up

This is my seriously non-serious attempt at my own lispy markup language.

_"Every lisper writes their own html DSL, it's practically a rite of passage"_
    
It looks like markdown but it's not full markdown
    
# Goals of Lark

- Create an HTML templating tool suitable for [disast.rs](https://disast.rs)
- Learn some stuff
- Have some fun
    
# Non-goals of Lark

Be "fully featured", "suitable for use in production", "polished", etc
    
# Other

No relation to the [Lark](https://github.com/lark-parser/lark) parsing toolkit for Python. Looks cool though.
    
# Test document contents:

This is a paragraph.
It's a single block element, because 
it is not divided by consequetive newlines.

This is a second paragraph.

This paragraph has: 
*bold text*, 
_italicized text_, 
`inline-code`, 
[[a wikilink]], 
and an [outlink](https://example.com)
    
# This is a heading
## This is a subheading

```
this is a fenced multiline code block

The contents thereof should be fixed-width text.
It's verbatim, so:
*this is not bold*
_this is not italicized_
`this is not inline-code`
> this is not a quote


this is not a separate paragraph
``` The text after the closed fence is ignored.