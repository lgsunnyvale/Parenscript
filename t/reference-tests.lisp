(in-package :js-test)
;; Tests of everything in the reference.
;; File is generated automatically from the text in reference.lisp by
;; the function make-reference-tests-dot-lisp in ref2test.lisp
;; so do not edit this file.
(def-suite ref-tests)
(in-suite ref-tests)

(test-ps-js statements-and-expressions-1
  (+ i (if 1 2 3))
  "i + (1 ? 2 : 3)")

(test-ps-js statements-and-expressions-2
  (if 1 2 3)
  "if (1) {
  2;
} else {
  3;
}")

(test-ps-js symbol-conversion-1
  !?#@%
  "bangwhathashatpercent")

(test-ps-js symbol-conversion-2
  bla-foo-bar
  "blaFooBar")

(test-ps-js symbol-conversion-3
  *array
  "Array")

(test-ps-js symbol-conversion-6
  *global-array*
  "GLOBALARRAY")

(test-ps-js symbol-conversion-7
  *global-array*.length
  "GLOBALARRAY.length")

(test-ps-js number-literals-1
  1
  "1")

(test-ps-js number-literals-2
  123.123
  "123.123")

(test-ps-js number-literals-3
  #x10
  "16")

(test-ps-js string-literals-1
  "foobar"
  "'foobar'")

(test-ps-js string-literals-2
  "bratzel bub"
  "'bratzel bub'")

(test-ps-js array-literals-1
  (array)
  "[  ]")

(test-ps-js array-literals-2
  (array 1 2 3)
  "[ 1, 2, 3 ]")

(test-ps-js array-literals-3
  (array (array 2 3)
       (array "foobar" "bratzel bub"))
  "[ [ 2, 3 ], [ 'foobar', 'bratzel bub' ] ]")

(test-ps-js array-literals-4
  (make-array)
  "new Array()")

(test-ps-js array-literals-5
  (make-array 1 2 3)
  "new Array(1, 2, 3)")

(test-ps-js array-literals-6
  (make-array
 (make-array 2 3)
 (make-array "foobar" "bratzel bub"))
  "new Array(new Array(2, 3), new Array('foobar', 'bratzel bub'))")

(test-ps-js object-literals-1
  (create :foo "bar" :blorg 1)
  "{ foo : 'bar',
  blorg : 1 }")

(test-ps-js object-literals-2
  (create :foo "hihi"
        :blorg (array 1 2 3)
        :another-object (create :schtrunz 1))
  "{ foo : 'hihi',
  blorg : [ 1, 2, 3 ],
  anotherObject : { schtrunz : 1 } }")

(test-ps-js object-literals-3
  (slot-value an-object 'foo)
  "anObject.foo")

(test-ps-js object-literals-4
  an-object.foo
  "anObject.foo")

(test-ps-js object-literals-5
  (with-slots (a b c) this
  (+ a b c))
  "this.a + this.b + this.c;")

(test-ps-js regular-expression-literals-1
  (regex "foobar")
  "/foobar/")

(test-ps-js regular-expression-literals-2
  (regex "/foobar/i")
  "/foobar/i")

(test-ps-js literal-symbols-1
  T
  "true")

(test-ps-js literal-symbols-2
  FALSE
  "false")

(test-ps-js literal-symbols-3
  NIL
  "null")

(test-ps-js literal-symbols-4
  UNDEFINED
  "undefined")

(test-ps-js literal-symbols-5
  THIS
  "this")

(test-ps-js variables-1
  variable
  "variable")

(test-ps-js variables-2
  a-variable
  "aVariable")

(test-ps-js variables-3
  *math
  "Math")

(test-ps-js variables-4
  *math.floor
  "Math.floor")

(test-ps-js function-calls-and-method-calls-1
  (blorg 1 2)
  "blorg(1, 2)")

(test-ps-js function-calls-and-method-calls-2
  (foobar (blorg 1 2) (blabla 3 4) (array 2 3 4))
  "foobar(blorg(1, 2), blabla(3, 4), [ 2, 3, 4 ])")

(test-ps-js function-calls-and-method-calls-3
  ((aref foo i) 1 2)
  "foo[i](1, 2)")

(test-ps-js function-calls-and-method-calls-4
  (.blorg this 1 2)
  "this.blorg(1, 2)")

(test-ps-js function-calls-and-method-calls-5
  (this.blorg 1 2)
  "this.blorg(1, 2)")

(test-ps-js function-calls-and-method-calls-6
  (.blorg (aref foobar 1) NIL T)
  "foobar[1].blorg(null, true)")

(test-ps-js operator-expressions-1
  (* 1 2)
  "1 * 2")

(test-ps-js operator-expressions-2
  (= 1 2)
  "1 == 2")

(test-ps-js operator-expressions-3
  (eql 1 2)
  "1 == 2")

(test-ps-js operator-expressions-5
  (* 1 (+ 2 3 4) 4 (/ 6 7))
  "1 * (2 + 3 + 4) * 4 * (6 / 7)")

(test-ps-js operator-expressions-6
  (++ i)
  "i++")

(test-ps-js operator-expressions-7
  (-- i)
  "i--")

(test-ps-js operator-expressions-8
  (incf i)
  "++i")

(test-ps-js operator-expressions-9
  (decf i)
  "--i")

(test-ps-js operator-expressions-10
  (1- i)
  "i - 1")

(test-ps-js operator-expressions-11
  (1+ i)
  "i + 1")

(test-ps-js operator-expressions-12
  (not (< i 2))
  "i >= 2")

(test-ps-js operator-expressions-13
  (not (eql i 2))
  "i != 2")

(test-ps-js body-forms-1
  (progn (blorg i) (blafoo i))
  "blorg(i);
blafoo(i);")

(test-ps-js body-forms-2
  (+ i (progn (blorg i) (blafoo i)))
  "i + (blorg(i), blafoo(i))")

(test-ps-js function-definition-1
  (defun a-function (a b)
  (return (+ a b)))
  "function aFunction(a, b) {
  return a + b;
}")

(test-ps-js function-definition-2
  (lambda (a b) (return (+ a b)))
  "function (a, b) {
  return a + b;
}")

(test-ps-js assignment-1
  (setf a 1)
  "a = 1")

(test-ps-js assignment-2
  (setf a 2 b 3 c 4 x (+ a b c))
  "a = 2;
b = 3;
c = 4;
x = a + b + c;")

(test-ps-js assignment-3
  (setf a (1+ a))
  "a++")

(test-ps-js assignment-4
  (setf a (+ a 2 3 4 a))
  "a += 2 + 3 + 4 + a")

(test-ps-js assignment-5
  (setf a (- 1 a))
  "a = 1 - a")

(test-ps-js single-argument-statements-1
  (return 1)
  "return 1")

(test-ps-js single-argument-statements-2
  (throw "foobar")
  "throw 'foobar'")

(test-ps-js single-argument-expression-1
  (delete (new (*foobar 2 3 4)))
  "delete new Foobar(2, 3, 4)")

(test-ps-js single-argument-expression-2
  (if (= (typeof blorg) *string)
    (alert (+ "blorg is a string: " blorg))
    (alert "blorg is not a string"))
  "if (typeof blorg == String) {
  alert('blorg is a string: ' + blorg);
} else {
  alert('blorg is not a string');
}")

(test-ps-js conditional-statements-1
  (if (blorg.is-correct)
    (progn (carry-on) (return i))
    (alert "blorg is not correct!"))
  "if (blorg.isCorrect()) {
  carryOn();
  return i;
} else {
  alert('blorg is not correct!');
}")

(test-ps-js conditional-statements-2
  (+ i (if (blorg.add-one) 1 2))
  "i + (blorg.addOne() ? 1 : 2)")

(test-ps-js conditional-statements-3
  (when (blorg.is-correct)
  (carry-on)
  (return i))
  "if (blorg.isCorrect()) {
  carryOn();
  return i;
}")

(test-ps-js conditional-statements-4
  (unless (blorg.is-correct)
  (alert "blorg is not correct!"))
  "if (!blorg.isCorrect()) {
  alert('blorg is not correct!');
}")

(test-ps-js variable-declaration-1
  (defvar *a* (array 1 2 3))
  "var A = [ 1, 2, 3 ];")

(test-ps-js variable-declaration-2
  (if (= i 1)
    (progn (defvar blorg "hallo")
           (alert blorg))
    (progn (defvar blorg "blitzel")
           (alert blorg)))
  "if (i == 1) {
  var blorg = 'hallo';
  alert(blorg);
} else {
  var blorg = 'blitzel';
  alert(blorg);
}")

(test-ps-js variable-declaration-3
  (if (= i 1)
    (let ((blorg "hallo"))
      (alert blorg))
    (let ((blorg "blitzel"))
      (alert blorg)))
  "if (i == 1) {
  var blorg = 'hallo';
  alert(blorg);
} else {
  var blorg = 'blitzel';
  alert(blorg);
}")

(test-ps-js iteration-constructs-1
  (do ((i 0 (1+ i))
     (l (aref blorg i) (aref blorg i)))
    ((or (= i blorg.length)
         (eql l "Fumitastic")))
  (document.write (+ "L is " l)))
  "for (var i = 0, l = blorg[i];
     !(i == blorg.length || l == 'Fumitastic');
     i = i + 1, l = blorg[i]) {
  document.write('L is ' + l);
}")

(test-ps-js iteration-constructs-2
  (dotimes (i blorg.length)
  (document.write (+ "L is " (aref blorg i))))
  "for (var i = 0; i < blorg.length; i = i + 1) {
  document.write('L is ' + blorg[i]);
}")

(test-ps-js iteration-constructs-3
  (dolist (l blorg)
  (document.write (+ "L is " l)))
  "{
  var tmpArr1 = blorg;
  for (var tmpI2 = 0; tmpI2 < tmpArr1.length;
    tmpI2 = tmpI2 + 1) {
    var l = tmpArr1[tmpI2];
    document.write('L is ' + l);
  };
}")

(test-ps-js iteration-constructs-4
  (doeach (i object)
   (document.write (+ i " is " (aref object i))))
  "for (var i in object) {
  document.write(i + ' is ' + object[i]);
}")

(test-ps-js iteration-constructs-5
  (while (film.is-not-finished)
  (this.eat (new *popcorn)))
  "while (film.isNotFinished()) {
  this.eat(new Popcorn);
}")

(test-ps-js the-case-statement-1
  (case (aref blorg i)
  ((1 "one") (alert "one"))
  (2 (alert "two"))
  (t (alert "default clause")))
  "switch (blorg[i]) {
  case 1:   ;
  case 'one':
            alert('one');
            break;
  case 2:
            alert('two');
            break;
  default:   alert('default clause');
}")

(test-ps-js the-case-statement-2
  (switch (aref blorg i)
  (1 (alert "If I get here"))
  (2 (alert "I also get here"))
  (default (alert "I always get here")))
  "switch (blorg[i]) {
  case 1:   alert('If I get here');
  case 2:   alert('I also get here');
  default:   alert('I always get here');
}")

(test-ps-js the-with-statement-1
  (with (create :foo "foo" :i "i")
  (alert (+ "i is now intermediary scoped: " i)))
  "with ({ foo : 'foo',
        i : 'i' }) {
  alert('i is now intermediary scoped: ' + i);
}")

(test-ps-js the-try-statement-1
  (try (throw "i")
 (:catch (error)
   (alert (+ "an error happened: " error)))
 (:finally
   (alert "Leaving the try form")))
  "try {
  throw 'i';
} catch (error) {
  alert('an error happened: ' + error);
} finally {
  alert('Leaving the try form');
}")

(test-ps-js the-html-generator-1
  (html ((:a :href "foobar") "blorg"))
  "'<a href=\"foobar\">blorg</a>'")

(test-ps-js the-html-generator-2
  (html ((:a :href (generate-a-link)) "blorg"))
  "'<a href=\"' + generateALink() + '\">blorg</a>'")

(test-ps-js the-html-generator-3
  (document.write
  (html ((:a :href "#"
            :onclick (js-inline (transport))) "link")))
  "document.write
('<a href=\"#\" onclick=\"' + 'javascript:transport();' + '\">link</a>')")

(test-ps-js the-html-generator-4
  (css-inline :color "red"
            :font-size "x-small")
  "'color:red;font-size:x-small'")

(test-ps-js the-html-generator-5
  (defun make-color-div(color-name)
    (return (html ((:div :style (css-inline :color color-name))
                   color-name " looks like this."))))
  "function makeColorDiv(colorName) {
  return '<div style=\"' + ('color:' + colorName) + '\">' + colorName
    + ' looks like this.</div>';
}")

