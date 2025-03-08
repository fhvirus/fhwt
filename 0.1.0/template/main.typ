#import "@local/fhwt:0.1.0": *
#show: conf

#show "LaTeX": [L#super("A")T#sub("E")X]
#show "TODO": [🚧 #text(fill: red)[TODO] 🚧]

#outline(indent: auto)

= Basic Advanced Usage

== Enumerate

Enumerate can be done like this:

```typ
+ 一
+ deux
5. fünf
  #set enum(numbering: "i.")
  + and you can
  + nest them.
  + [item6] Custom item label.
+ sex
```

The code will become: 

+ 一
+ deux
5. fünf
  #set enum(numbering: "i.")
  + and you can
  + nest them.
  + There seems to be no custom item label.
+ sex

Note: Typst's default list is tight! No need to `\tightlist` anymore.

== Math Symbols

Typst has its own set of notations (which is far easier than LaTeX IMO).

```typ
$ #let contra = { $arrow.r #h(-0.1em) arrow.l$ }
  #let inner(x) = { $lr(angle.l #x angle.r)$ }
  NN ZZ QQ RR CC contra \
  abs(a), ceil(b), floor(c), inner(x / 2), norm(y), \
  lr({1, 2, 3 / 7}), a dot b = c, x * y = z $
```
 
$ #let contra = { $arrow.r #h(-0.1em) arrow.l$ }
  #let inner(x) = { $lr(angle.l #x angle.r)$ }
  NN ZZ QQ RR CC contra \
  abs(a), ceil(b), floor(c), inner(x / 2), norm(y), \
  {1, 2, 3 / 7}, a dot b = c, x * y = z$

`\left` and `\right` in LaTeX are not needed since its the default in Typst (hooray!)

I placed contra and inner(x) inside math scope to make the code cleaner.
Since they are seldomly used, I do not define them in the template.

= Blocks

== Theorems, Lemmas, ...

```typst
#theorem[ #lorem(30) ]
#lemma[ They have seperate numbers. ]
#claim[ Claim for proof! ]
#observation[
  My observation. You can make `<label>`s...
] <myob>
#lemma("My Lemma")[
  ...give them names, and reference them like this: \
  According to @myob...
]
#proof[ Proofs have cool squares. ]
```

#theorem[ #lorem(30) ]
#lemma[They have seperate numbers.]
#claim[ Claim for proof! ]
#observation[
  My observation. You can make `<label>`s...
] <myob>
#lemma("My Lemma")[
  ...give them names, and reference them like this: \
  According to @myob...
]
#proof[ Proofs have cool squares. ]

More example on the next page...

#pagebreak()

```typst
#definition[
  A natural number is called a #highlight[_prime number_] if it is greater
  than 1 and cannot be written as the product of two smaller natural numbers.
]
#example[
  The numbers $2$, $3$, and $17$ are prime.
  @cor_largest_prime shows that this list is not exhaustive!
]

#theorem("Euclid")[ There are infinitely many primes. ]
#proof[
  Suppose to the contrary that $p_1, p_2, dots, p_n$ is a finite enumeration
  of all primes. Set $P = p_1 p_2 dots p_n$. Since $P + 1$ is not in our list,
  it cannot be prime. Thus, some prime factor $p_j$ divides $P + 1$.  Since
  $p_j$ also divides $P$, it must divide the difference $(P + 1) - P = 1$, a
  contradiction.
]

#corollary[
  There is no largest prime number.
] <cor_largest_prime>
#corollary[
  There are infinitely many composite numbers.
]
```

#definition("Prime Number")[
  A natural number is called a #highlight[_prime number_] if it is greater
  than 1 and cannot be written as the product of two smaller natural numbers.
]
#example[
  The numbers $2$, $3$, and $17$ are prime.
  @cor_largest_prime shows that this list is not exhaustive!
]

#theorem("Euclid")[ There are infinitely many primes. ]
#proof[
  Suppose to the contrary that $p_1, p_2, dots, p_n$ is a finite enumeration
  of all primes. Set $P = p_1 p_2 dots p_n$. Since $P + 1$ is not in our list,
  it cannot be prime. Thus, some prime factor $p_j$ divides $P + 1$.  Since
  $p_j$ also divides $P$, it must divide the difference $(P + 1) - P = 1$, a
  contradiction.
]

#corollary[
  There is no largest prime number.
] <cor_largest_prime>
#corollary[
  There are infinitely many composite numbers.
]

For more examples, visit https://github.com/sahasatvik/typst-theorems .

#pagebreak()

== Problems

```typ
#problem[
  This is a problem.
]
#problem[ This is another problem. ]
#problem(same-page: true)[ If you don't want `#problem` to start on a new page, you can pass `same-page: true`. ]
#problem(same-page: true, number: "0.514")[ You can also number them yourself! ]
#problem(same-page: true)[ Problem numbering is independent, too. ]
```

#problem[
  This is a problem.
]
#problem[ This is another problem. ]
#problem(same-page: true)[ Problems by default start on new page for Gradescope support.
  If you don't want `#problem` to start on a new page, you can pass `same-page: true`. ]
#problem(same-page: true, number: "0.514")[ You can also number them yourself! ]
#problem(same-page: true)[ Problem numbering is independent, too. ]
#problem(same-page: true)[ 
  #theorem[ Theorem numbering does not follow problems. ]
  #theorem(number: "6.1")[ I'm sorry but you have to do the numbering yourself. ]
  Problem numbering is independent, too. ]

== Code

Just use the built-in one!

````typ
```typ
#include <iostream>
int main() {}
```
````

produces:

```typ
#include <iostream>
int main() {}
```

And with `#raw(read("a.cpp"), lang: "cpp", block: true)` we get:

#raw(read("a.cpp"), lang: "cpp", block: true)

== Image

Just use https://typst.app/docs/reference/visualize/image/ .

= Drawing

TODO CetZ seems powerful, yet I'm not sure what can I achieve with the built-in functions and when should I use the package.

= Lorem Ipsums

== Chinese lorem

#strike[顏色]香半，褕海知，舉臥之斯文大…*萬里送*，Lorem ipsum dol'or sit amet, consectetuer adipiscing elit. 幾度九華帳山色之難難，楚能余亦之難難夜日行陽為君。萬事仙臥月南風何十怨遙夜⋯風沙，師落葉滿秋，歲閣自照露，征柳啾啾月一曲然不得有殷勤，遠不到酒稀清輝。腸何時還，行路難獨夜南⋯羅微鳳路雪虛征戰。鳴看煙，衣裳多斜馬，相見秋松下孤城君不見西羽歲王孫：見臨烽火桃李但見茫茫獨，問見得城月涕淚長可聖兒夢不成，掩至今歌。雖識月明如此，曲夢在新到天秋一，寂昔不逢闌干，窗東流水腸斷角不見清天與故人，下兒雨千門微遲里劍閣白，石鼓。

#lorem(100)

== Ipsum

#lorem(100)

沒有好棒，別嗚哈哈哈，都這個實說不然也不，的人的什麼最好。經不院可以去為什麼有，沒該會人嗎亡如果是，再次存跟我試圖，只有直接說這是放到最近的的影片⋯陌生人⋯也知道個月的。其覺得是起來跟不可能也很，畫面待喔好天的簡單很不是聽起來，然已經就聖我的話的聲。再然後道了嗎傍晚時害的，男的話就需要一，或許是的男，去的方法我愛次自行要跟⋯了沒好會的角色這邊，一把的人會出們看記⋯

