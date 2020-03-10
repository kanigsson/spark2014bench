(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: CVC4
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes ((tuple0 0))
(((Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ((us_type_of_heap__ref 0))
(((us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes ((int__ref 0))
(((int__refqtmk (int__content Int)))))
(declare-datatypes ((bool__ref 0))
(((bool__refqtmk (bool__content Bool)))))
(declare-datatypes ((us_fixed__ref 0))
(((us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes ((real__ref 0))
(((real__refqtmk (real__content Real)))))
(declare-datatypes ((us_private__ref 0))
(((us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(define-fun length ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant1 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(declare-sort index 0)

(declare-fun indexqtint (index) Int)

;; index'axiom
  (assert
  (forall ((i index)) (and (<= 1 (indexqtint i)) (<= (indexqtint i) 10))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (index index) Bool)

(declare-const dummy2 index)

(declare-datatypes ((index__ref 0))
(((index__refqtmk (index__content index)))))
(define-fun index__ref_index__content__projection ((a index__ref)) index 
  (index__content a))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int integer))))))
(declare-fun slide ((Array Int integer) Int Int) (Array Int integer))

;; slide_eq
  (assert
  (forall ((a (Array Int integer)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int integer)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int integer)) (a__first Int) (a__last Int)
  (b (Array Int integer)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep (select a temp___idx_154)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int integer)) (b (Array Int integer)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep (select a temp___idx_154)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep (first (mk f l))) f) (= (to_rep (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range3 low) (in_range3 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int integer))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int integer) (elts a))

(define-fun of_array ((a (Array Int integer)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep (last (rt a))))

(define-fun length1 ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                   (+ (- (last1 a) (first1 a)) 1) 0))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const component__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(define-fun bool_eq1 ((x us_t)
  (y us_t)) Bool (bool_eq (elts x) (to_rep (first (rt x)))
                 (to_rep (last (rt x))) (elts y) (to_rep (first (rt y)))
                 (to_rep (last (rt y)))))

(declare-fun user_eq3 (us_t us_t) Bool)

(declare-const dummy3 us_t)

(declare-datatypes ((text__ref 0))
(((text__refqtmk (text__content us_t)))))
(define-fun text__ref_text__content__projection ((a text__ref)) us_t 
  (text__content a))

(declare-const a us_t)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const x Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const y Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(define-fun dynamic_invariant2 ((temp___expr_167 us_t)
  (temp___is_init_163 Bool) (temp___skip_constant_164 Bool)
  (temp___do_toplevel_165 Bool)
  (temp___do_typ_inv_166 Bool)) Bool (=>
                                     (not (= temp___skip_constant_164 true))
                                     (dynamic_property 1 10
                                     (first1 temp___expr_167)
                                     (last1 temp___expr_167))))

(define-fun dynamic_invariant3 ((temp___expr_160 Int)
  (temp___is_init_156 Bool) (temp___skip_constant_157 Bool)
  (temp___do_toplevel_158 Bool)
  (temp___do_typ_inv_159 Bool)) Bool (=>
                                     (or (= temp___is_init_156 true)
                                     (<= 1 10)) (in_range3 temp___expr_160)))

(assert
;; defqtvc
 ;; File "lcp.ads", line 10, characters 0-0
  (not
  (forall ((l Int))
  (=> (dynamic_invariant2 a true false true true)
  (=> (dynamic_invariant x true false true true)
  (=> (dynamic_invariant y true false true true)
  (=> (<= (first1 a) x)
  (=> (<= x (last1 a))
  (=> (<= (first1 a) y)
  (=> (<= y (last1 a))
  (let ((usf (not (= (to_rep (select (to_array a) x)) (to_rep
                                                      (select (to_array a) 
                                                      y))))))
  (let ((usf1 (= x y)))
  (=> (dynamic_invariant1 l false false true true)
  (forall ((l1 Int))
  (=> (= l1 0)
  (forall ((l2 Int))
  (=>
  (or
  (exists ((o Bool))
  (and
  (exists ((o1 Bool))
  (and
  (let ((o2 (+ x l1)))
  (and (in_range1 o2)
  (ite (<= o2 (last1 a))
  (let ((o3 (+ y l1)))
  (and (in_range1 o3) (= o1 (ite (<= o3 (last1 a)) true false))))
  (= o1 false))))
  (ite (= o1 true)
  (let ((o2 (+ y l1)))
  (and (in_range1 o2)
  (and (and (<= (first1 a) o2) (<= o2 (last1 a)))
  (exists ((o3 Int))
  (and (= (to_rep (select (to_array a) o2)) o3)
  (let ((o4 (+ x l1)))
  (and (in_range1 o4)
  (and (and (<= (first1 a) o4) (<= o4 (last1 a)))
  (exists ((o5 Int))
  (and (= (to_rep (select (to_array a) o4)) o5)
  (= o (ite (= o5 o3) true false)))))))))))) (= o false))))
  (and (= o true)
  (let ((o1 (+ l1 1)))
  (and (in_range1 o1)
  (exists ((l3 Int))
  (and (= l3 o1)
  (exists ((o2 Bool))
  (and
  (exists ((o3 Bool))
  (and
  (let ((o4 (+ x l3)))
  (and (in_range1 o4)
  (ite (<= o4 (last1 a))
  (let ((o5 (+ y l3)))
  (and (in_range1 o5) (= o3 (ite (<= o5 (last1 a)) true false))))
  (= o3 false))))
  (ite (= o3 true)
  (let ((o4 (+ y l3)))
  (and (in_range1 o4)
  (and (and (<= (first1 a) o4) (<= o4 (last1 a)))
  (exists ((o5 Int))
  (and (= (to_rep (select (to_array a) o4)) o5)
  (let ((o6 (+ x l3)))
  (and (in_range1 o6)
  (and (and (<= (first1 a) o6) (<= o6 (last1 a)))
  (exists ((o7 Int))
  (and (= (to_rep (select (to_array a) o6)) o7)
  (= o2 (ite (= o7 o5) true false)))))))))))) (= o2 false))))
  (and (= o2 true)
  (let ((o3 (+ l3 1)))
  (and (in_range1 o3)
  (exists ((l4 Int))
  (and (= l4 o3)
  (exists ((o4 Bool))
  (and
  (exists ((o5 Bool))
  (and
  (let ((o6 (+ x l4)))
  (and (in_range1 o6)
  (ite (<= o6 (last1 a))
  (let ((o7 (+ y l4)))
  (and (in_range1 o7) (= o5 (ite (<= o7 (last1 a)) true false))))
  (= o5 false))))
  (ite (= o5 true)
  (let ((o6 (+ y l4)))
  (and (in_range1 o6)
  (and (and (<= (first1 a) o6) (<= o6 (last1 a)))
  (exists ((o7 Int))
  (and (= (to_rep (select (to_array a) o6)) o7)
  (let ((o8 (+ x l4)))
  (and (in_range1 o8)
  (and (and (<= (first1 a) o8) (<= o8 (last1 a)))
  (exists ((o9 Int))
  (and (= (to_rep (select (to_array a) o8)) o9)
  (= o4 (ite (= o9 o7) true false)))))))))))) (= o4 false))))
  (and (= o4 true)
  (let ((o5 (+ l4 1)))
  (and (in_range1 o5)
  (exists ((l5 Int))
  (and (= l5 o5)
  (exists ((o6 Bool))
  (and
  (exists ((o7 Bool))
  (and
  (let ((o8 (+ x l5)))
  (and (in_range1 o8)
  (ite (<= o8 (last1 a))
  (let ((o9 (+ y l5)))
  (and (in_range1 o9) (= o7 (ite (<= o9 (last1 a)) true false))))
  (= o7 false))))
  (ite (= o7 true)
  (let ((o8 (+ y l5)))
  (and (in_range1 o8)
  (and (and (<= (first1 a) o8) (<= o8 (last1 a)))
  (exists ((o9 Int))
  (and (= (to_rep (select (to_array a) o8)) o9)
  (let ((o10 (+ x l5)))
  (and (in_range1 o10)
  (and (and (<= (first1 a) o10) (<= o10 (last1 a)))
  (exists ((o11 Int))
  (and (= (to_rep (select (to_array a) o10)) o11)
  (= o6 (ite (= o11 o9) true false)))))))))))) (= o6 false))))
  (and (= o6 true)
  (let ((o7 (+ l5 1)))
  (and (in_range1 o7)
  (exists ((l6 Int))
  (and (= l6 o7)
  (exists ((o8 Bool))
  (and
  (exists ((o9 Bool))
  (and
  (let ((o10 (+ x l6)))
  (and (in_range1 o10)
  (ite (<= o10 (last1 a))
  (let ((o11 (+ y l6)))
  (and (in_range1 o11) (= o9 (ite (<= o11 (last1 a)) true false))))
  (= o9 false))))
  (ite (= o9 true)
  (let ((o10 (+ y l6)))
  (and (in_range1 o10)
  (and (and (<= (first1 a) o10) (<= o10 (last1 a)))
  (exists ((o11 Int))
  (and (= (to_rep (select (to_array a) o10)) o11)
  (let ((o12 (+ x l6)))
  (and (in_range1 o12)
  (and (and (<= (first1 a) o12) (<= o12 (last1 a)))
  (exists ((o13 Int))
  (and (= (to_rep (select (to_array a) o12)) o13)
  (= o8 (ite (= o13 o11) true false)))))))))))) (= o8 false))))
  (and (= o8 true)
  (let ((o9 (+ l6 1)))
  (and (in_range1 o9)
  (exists ((l7 Int))
  (and (= l7 o9)
  (exists ((o10 Bool))
  (and
  (exists ((o11 Bool))
  (and
  (let ((o12 (+ x l7)))
  (and (in_range1 o12)
  (ite (<= o12 (last1 a))
  (let ((o13 (+ y l7)))
  (and (in_range1 o13) (= o11 (ite (<= o13 (last1 a)) true false))))
  (= o11 false))))
  (ite (= o11 true)
  (let ((o12 (+ y l7)))
  (and (in_range1 o12)
  (and (and (<= (first1 a) o12) (<= o12 (last1 a)))
  (exists ((o13 Int))
  (and (= (to_rep (select (to_array a) o12)) o13)
  (let ((o14 (+ x l7)))
  (and (in_range1 o14)
  (and (and (<= (first1 a) o14) (<= o14 (last1 a)))
  (exists ((o15 Int))
  (and (= (to_rep (select (to_array a) o14)) o15)
  (= o10 (ite (= o15 o13) true false)))))))))))) (= o10 false))))
  (and (= o10 true)
  (let ((o11 (+ l7 1)))
  (and (in_range1 o11)
  (exists ((l8 Int))
  (and (= l8 o11)
  (exists ((o12 Bool))
  (and
  (exists ((o13 Bool))
  (and
  (let ((o14 (+ x l8)))
  (and (in_range1 o14)
  (ite (<= o14 (last1 a))
  (let ((o15 (+ y l8)))
  (and (in_range1 o15) (= o13 (ite (<= o15 (last1 a)) true false))))
  (= o13 false))))
  (ite (= o13 true)
  (let ((o14 (+ y l8)))
  (and (in_range1 o14)
  (and (and (<= (first1 a) o14) (<= o14 (last1 a)))
  (exists ((o15 Int))
  (and (= (to_rep (select (to_array a) o14)) o15)
  (let ((o16 (+ x l8)))
  (and (in_range1 o16)
  (and (and (<= (first1 a) o16) (<= o16 (last1 a)))
  (exists ((o17 Int))
  (and (= (to_rep (select (to_array a) o16)) o17)
  (= o12 (ite (= o17 o15) true false)))))))))))) (= o12 false))))
  (and (= o12 true)
  (let ((o13 (+ l8 1)))
  (and (in_range1 o13)
  (exists ((l9 Int))
  (and (= l9 o13)
  (exists ((o14 Bool))
  (and
  (exists ((o15 Bool))
  (and
  (let ((o16 (+ x l9)))
  (and (in_range1 o16)
  (ite (<= o16 (last1 a))
  (let ((o17 (+ y l9)))
  (and (in_range1 o17) (= o15 (ite (<= o17 (last1 a)) true false))))
  (= o15 false))))
  (ite (= o15 true)
  (let ((o16 (+ y l9)))
  (and (in_range1 o16)
  (and (and (<= (first1 a) o16) (<= o16 (last1 a)))
  (exists ((o17 Int))
  (and (= (to_rep (select (to_array a) o16)) o17)
  (let ((o18 (+ x l9)))
  (and (in_range1 o18)
  (and (and (<= (first1 a) o18) (<= o18 (last1 a)))
  (exists ((o19 Int))
  (and (= (to_rep (select (to_array a) o18)) o19)
  (= o14 (ite (= o19 o17) true false)))))))))))) (= o14 false))))
  (and (= o14 true)
  (let ((o15 (+ l9 1)))
  (and (in_range1 o15)
  (exists ((l10 Int))
  (and (= l10 o15)
  (exists ((o16 Bool))
  (and
  (exists ((o17 Bool))
  (and
  (let ((o18 (+ x l10)))
  (and (in_range1 o18)
  (ite (<= o18 (last1 a))
  (let ((o19 (+ y l10)))
  (and (in_range1 o19) (= o17 (ite (<= o19 (last1 a)) true false))))
  (= o17 false))))
  (ite (= o17 true)
  (let ((o18 (+ y l10)))
  (and (in_range1 o18)
  (and (and (<= (first1 a) o18) (<= o18 (last1 a)))
  (exists ((o19 Int))
  (and (= (to_rep (select (to_array a) o18)) o19)
  (let ((o20 (+ x l10)))
  (and (in_range1 o20)
  (and (and (<= (first1 a) o20) (<= o20 (last1 a)))
  (exists ((o21 Int))
  (and (= (to_rep (select (to_array a) o20)) o21)
  (= o16 (ite (= o21 o19) true false)))))))))))) (= o16 false))))
  (and (= o16 true)
  (let ((o17 (+ l10 1)))
  (and (in_range1 o17)
  (exists ((l11 Int))
  (and (= l11 o17)
  (exists ((o18 Bool))
  (and
  (exists ((o19 Bool))
  (and
  (let ((o20 (+ x l11)))
  (and (in_range1 o20)
  (ite (<= o20 (last1 a))
  (let ((o21 (+ y l11)))
  (and (in_range1 o21) (= o19 (ite (<= o21 (last1 a)) true false))))
  (= o19 false))))
  (ite (= o19 true)
  (let ((o20 (+ y l11)))
  (and (in_range1 o20)
  (and (and (<= (first1 a) o20) (<= o20 (last1 a)))
  (exists ((o21 Int))
  (and (= (to_rep (select (to_array a) o20)) o21)
  (let ((o22 (+ x l11)))
  (and (in_range1 o22)
  (and (and (<= (first1 a) o22) (<= o22 (last1 a)))
  (exists ((o23 Int))
  (and (= (to_rep (select (to_array a) o22)) o23)
  (= o18 (ite (= o23 o21) true false)))))))))))) (= o18 false))))
  (and (= o18 true) (let ((o19 (+ l11 1))) (and (in_range1 o19) (= l2 o19)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  (exists ((o Bool))
  (and
  (exists ((o1 Bool))
  (and
  (let ((o2 (+ x l1)))
  (and (in_range1 o2)
  (ite (<= o2 (last1 a))
  (let ((o3 (+ y l1)))
  (and (in_range1 o3) (= o1 (ite (<= o3 (last1 a)) true false))))
  (= o1 false))))
  (ite (= o1 true)
  (let ((o2 (+ y l1)))
  (and (in_range1 o2)
  (and (and (<= (first1 a) o2) (<= o2 (last1 a)))
  (exists ((o3 Int))
  (and (= (to_rep (select (to_array a) o2)) o3)
  (let ((o4 (+ x l1)))
  (and (in_range1 o4)
  (and (and (<= (first1 a) o4) (<= o4 (last1 a)))
  (exists ((o5 Int))
  (and (= (to_rep (select (to_array a) o4)) o5)
  (= o (ite (= o5 o3) true false)))))))))))) (= o false))))
  (ite (not (= o true)) (= l2 l1)
  (let ((o1 (+ l1 1)))
  (and (in_range1 o1)
  (exists ((l3 Int))
  (and (= l3 o1)
  (exists ((o2 Bool))
  (and
  (exists ((o3 Bool))
  (and
  (let ((o4 (+ x l3)))
  (and (in_range1 o4)
  (ite (<= o4 (last1 a))
  (let ((o5 (+ y l3)))
  (and (in_range1 o5) (= o3 (ite (<= o5 (last1 a)) true false))))
  (= o3 false))))
  (ite (= o3 true)
  (let ((o4 (+ y l3)))
  (and (in_range1 o4)
  (and (and (<= (first1 a) o4) (<= o4 (last1 a)))
  (exists ((o5 Int))
  (and (= (to_rep (select (to_array a) o4)) o5)
  (let ((o6 (+ x l3)))
  (and (in_range1 o6)
  (and (and (<= (first1 a) o6) (<= o6 (last1 a)))
  (exists ((o7 Int))
  (and (= (to_rep (select (to_array a) o6)) o7)
  (= o2 (ite (= o7 o5) true false)))))))))))) (= o2 false))))
  (ite (not (= o2 true)) (= l2 l3)
  (let ((o3 (+ l3 1)))
  (and (in_range1 o3)
  (exists ((l4 Int))
  (and (= l4 o3)
  (exists ((o4 Bool))
  (and
  (exists ((o5 Bool))
  (and
  (let ((o6 (+ x l4)))
  (and (in_range1 o6)
  (ite (<= o6 (last1 a))
  (let ((o7 (+ y l4)))
  (and (in_range1 o7) (= o5 (ite (<= o7 (last1 a)) true false))))
  (= o5 false))))
  (ite (= o5 true)
  (let ((o6 (+ y l4)))
  (and (in_range1 o6)
  (and (and (<= (first1 a) o6) (<= o6 (last1 a)))
  (exists ((o7 Int))
  (and (= (to_rep (select (to_array a) o6)) o7)
  (let ((o8 (+ x l4)))
  (and (in_range1 o8)
  (and (and (<= (first1 a) o8) (<= o8 (last1 a)))
  (exists ((o9 Int))
  (and (= (to_rep (select (to_array a) o8)) o9)
  (= o4 (ite (= o9 o7) true false)))))))))))) (= o4 false))))
  (ite (not (= o4 true)) (= l2 l4)
  (let ((o5 (+ l4 1)))
  (and (in_range1 o5)
  (exists ((l5 Int))
  (and (= l5 o5)
  (exists ((o6 Bool))
  (and
  (exists ((o7 Bool))
  (and
  (let ((o8 (+ x l5)))
  (and (in_range1 o8)
  (ite (<= o8 (last1 a))
  (let ((o9 (+ y l5)))
  (and (in_range1 o9) (= o7 (ite (<= o9 (last1 a)) true false))))
  (= o7 false))))
  (ite (= o7 true)
  (let ((o8 (+ y l5)))
  (and (in_range1 o8)
  (and (and (<= (first1 a) o8) (<= o8 (last1 a)))
  (exists ((o9 Int))
  (and (= (to_rep (select (to_array a) o8)) o9)
  (let ((o10 (+ x l5)))
  (and (in_range1 o10)
  (and (and (<= (first1 a) o10) (<= o10 (last1 a)))
  (exists ((o11 Int))
  (and (= (to_rep (select (to_array a) o10)) o11)
  (= o6 (ite (= o11 o9) true false)))))))))))) (= o6 false))))
  (ite (not (= o6 true)) (= l2 l5)
  (let ((o7 (+ l5 1)))
  (and (in_range1 o7)
  (exists ((l6 Int))
  (and (= l6 o7)
  (exists ((o8 Bool))
  (and
  (exists ((o9 Bool))
  (and
  (let ((o10 (+ x l6)))
  (and (in_range1 o10)
  (ite (<= o10 (last1 a))
  (let ((o11 (+ y l6)))
  (and (in_range1 o11) (= o9 (ite (<= o11 (last1 a)) true false))))
  (= o9 false))))
  (ite (= o9 true)
  (let ((o10 (+ y l6)))
  (and (in_range1 o10)
  (and (and (<= (first1 a) o10) (<= o10 (last1 a)))
  (exists ((o11 Int))
  (and (= (to_rep (select (to_array a) o10)) o11)
  (let ((o12 (+ x l6)))
  (and (in_range1 o12)
  (and (and (<= (first1 a) o12) (<= o12 (last1 a)))
  (exists ((o13 Int))
  (and (= (to_rep (select (to_array a) o12)) o13)
  (= o8 (ite (= o13 o11) true false)))))))))))) (= o8 false))))
  (ite (not (= o8 true)) (= l2 l6)
  (let ((o9 (+ l6 1)))
  (and (in_range1 o9)
  (exists ((l7 Int))
  (and (= l7 o9)
  (exists ((o10 Bool))
  (and
  (exists ((o11 Bool))
  (and
  (let ((o12 (+ x l7)))
  (and (in_range1 o12)
  (ite (<= o12 (last1 a))
  (let ((o13 (+ y l7)))
  (and (in_range1 o13) (= o11 (ite (<= o13 (last1 a)) true false))))
  (= o11 false))))
  (ite (= o11 true)
  (let ((o12 (+ y l7)))
  (and (in_range1 o12)
  (and (and (<= (first1 a) o12) (<= o12 (last1 a)))
  (exists ((o13 Int))
  (and (= (to_rep (select (to_array a) o12)) o13)
  (let ((o14 (+ x l7)))
  (and (in_range1 o14)
  (and (and (<= (first1 a) o14) (<= o14 (last1 a)))
  (exists ((o15 Int))
  (and (= (to_rep (select (to_array a) o14)) o15)
  (= o10 (ite (= o15 o13) true false)))))))))))) (= o10 false))))
  (ite (not (= o10 true)) (= l2 l7)
  (let ((o11 (+ l7 1)))
  (and (in_range1 o11)
  (exists ((l8 Int))
  (and (= l8 o11)
  (exists ((o12 Bool))
  (and
  (exists ((o13 Bool))
  (and
  (let ((o14 (+ x l8)))
  (and (in_range1 o14)
  (ite (<= o14 (last1 a))
  (let ((o15 (+ y l8)))
  (and (in_range1 o15) (= o13 (ite (<= o15 (last1 a)) true false))))
  (= o13 false))))
  (ite (= o13 true)
  (let ((o14 (+ y l8)))
  (and (in_range1 o14)
  (and (and (<= (first1 a) o14) (<= o14 (last1 a)))
  (exists ((o15 Int))
  (and (= (to_rep (select (to_array a) o14)) o15)
  (let ((o16 (+ x l8)))
  (and (in_range1 o16)
  (and (and (<= (first1 a) o16) (<= o16 (last1 a)))
  (exists ((o17 Int))
  (and (= (to_rep (select (to_array a) o16)) o17)
  (= o12 (ite (= o17 o15) true false)))))))))))) (= o12 false))))
  (ite (not (= o12 true)) (= l2 l8)
  (let ((o13 (+ l8 1)))
  (and (in_range1 o13)
  (exists ((l9 Int))
  (and (= l9 o13)
  (exists ((o14 Bool))
  (and
  (exists ((o15 Bool))
  (and
  (let ((o16 (+ x l9)))
  (and (in_range1 o16)
  (ite (<= o16 (last1 a))
  (let ((o17 (+ y l9)))
  (and (in_range1 o17) (= o15 (ite (<= o17 (last1 a)) true false))))
  (= o15 false))))
  (ite (= o15 true)
  (let ((o16 (+ y l9)))
  (and (in_range1 o16)
  (and (and (<= (first1 a) o16) (<= o16 (last1 a)))
  (exists ((o17 Int))
  (and (= (to_rep (select (to_array a) o16)) o17)
  (let ((o18 (+ x l9)))
  (and (in_range1 o18)
  (and (and (<= (first1 a) o18) (<= o18 (last1 a)))
  (exists ((o19 Int))
  (and (= (to_rep (select (to_array a) o18)) o19)
  (= o14 (ite (= o19 o17) true false)))))))))))) (= o14 false))))
  (ite (not (= o14 true)) (= l2 l9)
  (let ((o15 (+ l9 1)))
  (and (in_range1 o15)
  (exists ((l10 Int))
  (and (= l10 o15)
  (exists ((o16 Bool))
  (and
  (exists ((o17 Bool))
  (and
  (let ((o18 (+ x l10)))
  (and (in_range1 o18)
  (ite (<= o18 (last1 a))
  (let ((o19 (+ y l10)))
  (and (in_range1 o19) (= o17 (ite (<= o19 (last1 a)) true false))))
  (= o17 false))))
  (ite (= o17 true)
  (let ((o18 (+ y l10)))
  (and (in_range1 o18)
  (and (and (<= (first1 a) o18) (<= o18 (last1 a)))
  (exists ((o19 Int))
  (and (= (to_rep (select (to_array a) o18)) o19)
  (let ((o20 (+ x l10)))
  (and (in_range1 o20)
  (and (and (<= (first1 a) o20) (<= o20 (last1 a)))
  (exists ((o21 Int))
  (and (= (to_rep (select (to_array a) o20)) o21)
  (= o16 (ite (= o21 o19) true false)))))))))))) (= o16 false))))
  (ite (not (= o16 true)) (= l2 l10)
  (let ((o17 (+ l10 1)))
  (and (in_range1 o17)
  (and (= l2 o17)
  (exists ((o18 Bool))
  (and
  (exists ((o19 Bool))
  (and
  (let ((o20 (+ x l2)))
  (and (in_range1 o20)
  (ite (<= o20 (last1 a))
  (let ((o21 (+ y l2)))
  (and (in_range1 o21) (= o19 (ite (<= o21 (last1 a)) true false))))
  (= o19 false))))
  (ite (= o19 true)
  (let ((o20 (+ y l2)))
  (and (in_range1 o20)
  (and (and (<= (first1 a) o20) (<= o20 (last1 a)))
  (exists ((o21 Int))
  (and (= (to_rep (select (to_array a) o20)) o21)
  (let ((o22 (+ x l2)))
  (and (in_range1 o22)
  (and (and (<= (first1 a) o22) (<= o22 (last1 a)))
  (exists ((o23 Int))
  (and (= (to_rep (select (to_array a) o22)) o23)
  (= o18 (ite (= o23 o21) true false)))))))))))) (= o18 false))))
  (not (= o18 true)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  (forall ((lcp__result Int))
  (=> (= lcp__result l2)
  (=> (=> (= usf true) (= lcp__result 0))
  (=> (=> (= usf1 true) (= lcp__result (+ (- (last1 a) x) 1)))
  (=> (=> (not (= (or usf usf1) true)) (< 0 lcp__result))
  (forall ((k Int))
  (=> (and (<= 0 k) (<= k (- lcp__result 1)))
  (= (to_rep (select (to_array a) (+ x k))) (to_rep
                                            (select (to_array a) (+ y k))))))))))))))))))))))))))))
(check-sat)
(exit)
