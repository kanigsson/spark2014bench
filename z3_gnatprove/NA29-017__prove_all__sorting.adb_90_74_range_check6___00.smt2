(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: Z3
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes () ((tuple0 (Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ()
((us_type_of_heap__ref
 (us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes () ((int__ref (int__refqtmk (int__content Int)))))
(declare-datatypes () ((bool__ref (bool__refqtmk (bool__content Bool)))))
(declare-datatypes ()
((us_fixed__ref (us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes () ((real__ref (real__refqtmk (real__content Real)))))
(declare-datatypes ()
((us_private__ref (us_private__refqtmk (us_private__content us_private)))))
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

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

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

(declare-datatypes ()
((natural__ref (natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int integer))))))
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
                   (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes () ((us_t (us_tqtmk (elts (Array Int integer))(rt t)))))
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

(declare-fun user_eq2 (us_t us_t) Bool)

(declare-const dummy2 us_t)

(declare-datatypes ()
((int_array__ref (int_array__refqtmk (int_array__content us_t)))))
(define-fun int_array__ref_int_array__content__projection ((a int_array__ref)) us_t 
  (int_array__content a))

(declare-fun sorted (us_t Int Int) Bool)

(declare-fun sorted__function_guard (Bool us_t Int Int) Bool)

(define-fun dynamic_invariant1 ((temp___expr_163 us_t)
  (temp___is_init_159 Bool) (temp___skip_constant_160 Bool)
  (temp___do_toplevel_161 Bool)
  (temp___do_typ_inv_162 Bool)) Bool (=>
                                     (not (= temp___skip_constant_160 true))
                                     (dynamic_property 0 2147483647
                                     (first1 temp___expr_163)
                                     (last1 temp___expr_163))))

;; sorted__post_axiom
  (assert true)

(declare-fun perm (us_t us_t Int Int) Bool)

(declare-fun perm__function_guard (Bool us_t us_t Int Int) Bool)

;; perm__post_axiom
  (assert true)

(declare-fun perm2 (us_t us_t Int Int Int Int Int) Bool)

(declare-fun perm2__function_guard (Bool us_t us_t Int Int Int Int Int) Bool)

;; perm2__post_axiom
  (assert true)

(declare-fun le_array (us_t us_t Int Int Int Int) Bool)

(declare-fun le_array__function_guard (Bool us_t us_t Int Int Int Int) Bool)

;; le_array__post_axiom
  (assert true)

(declare-const a__first integer)

(declare-const a__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const b__first integer)

(declare-const b__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const a_first Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const length11 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const length2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(define-fun dynamic_invariant2 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-const a (Array Int integer))

(declare-const b (Array Int integer))

(declare-const i Int)

(declare-const j Int)

(declare-const a1 (Array Int integer))

;; H
  (assert (= a1 a))

;; Assume
  (assert (dynamic_property 0 2147483647 (to_rep a__first) (to_rep a__last)))

;; Assume
  (assert (dynamic_property 0 2147483647 (to_rep b__first) (to_rep b__last)))

;; Assume
  (assert (dynamic_invariant a_first true false true true))

;; Assume
  (assert (dynamic_invariant length11 true false true true))

;; Assume
  (assert (dynamic_invariant length2 true false true true))

;; H
  (assert
  (forall ((a2 (Array Int integer))) (sorted__function_guard
  (sorted (of_array a2 (to_rep a__first) (to_rep a__last)) a_first length11)
  (of_array a2 (to_rep a__first) (to_rep a__last)) a_first length11)))

;; H
  (assert
  (forall ((a2 (Array Int integer))) (sorted__function_guard
  (sorted (of_array a2 (to_rep a__first) (to_rep a__last))
  (+ a_first length11) length2)
  (of_array a2 (to_rep a__first) (to_rep a__last)) (+ a_first length11)
  length2)))

;; Assume
  (assert
  (and
  (and
  (and
  (and
  (and
  (and (<= (to_rep a__first) a_first)
  (<= (+ (+ a_first length11) length2) (+ (to_rep a__last) 1)))
  (<= (+ length11 length2) (length (to_rep b__first) (to_rep b__last))))
  (<= (+ length11 length2) 2147483647))
  (= (sorted (of_array a (to_rep a__first) (to_rep a__last)) a_first
     length11) true))
  (= (sorted (of_array a (to_rep a__first) (to_rep a__last))
     (+ a_first length11) length2) true))
  (<= (to_rep b__first) (to_rep b__last))))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant i false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant j false false true true))

(declare-const i1 Int)

;; H
  (assert (= i1 0))

(declare-const j1 Int)

;; H
  (assert (= j1 0))

(declare-const temp___loop_entry_325 (Array Int integer))

;; H
  (assert (= temp___loop_entry_325 a))

(declare-const o Int)

;; Ensures
  (assert (= (to_rep a__last) o))

(declare-const o1 Int)

;; Ensures
  (assert (= (to_rep a__first) o1))

(declare-const o2 Int)

;; Ensures
  (assert (= (to_rep a__last) o2))

(declare-const o3 Int)

;; Ensures
  (assert (= (to_rep a__first) o3))

(define-fun o4 () Int (- length2 j1))

;; Ensures
  (assert (in_range1 o4))

;; Ensures
  (assert (in_range2 o4))

(define-fun o5 () Int (+ i1 j1))

;; Ensures
  (assert (in_range1 o5))

(define-fun o6 () Int (+ a_first length11))

;; Ensures
  (assert (in_range1 o6))

(define-fun o7 () Int (+ o6 j1))

;; Ensures
  (assert (in_range1 o7))

(declare-const o8 Int)

;; Ensures
  (assert (= (to_rep b__first) o8))

;; Ensures
  (assert (in_range2 o8))

(declare-const o9 Int)

;; Ensures
  (assert (= (to_rep a__last) o9))

(declare-const o10 Int)

;; Ensures
  (assert (= (to_rep a__first) o10))

(define-fun o11 () us_t (of_array a o10 o9))

(declare-const o12 Int)

;; Ensures
  (assert (= (to_rep b__last) o12))

(declare-const o13 Int)

;; Ensures
  (assert (= (to_rep b__first) o13))

(define-fun o14 () us_t (of_array b o13 o12))

;; Ensures
  (assert (le_array__function_guard (le_array o14 o11 o8 o7 o5 o4) o14 
  o11 o8 o7 o5 o4))

(define-fun o15 () Int (- length11 i1))

;; Ensures
  (assert (in_range1 o15))

;; Ensures
  (assert (in_range2 o15))

(define-fun o16 () Int (+ i1 j1))

;; Ensures
  (assert (in_range1 o16))

(define-fun o17 () Int (+ a_first i1))

;; Ensures
  (assert (in_range1 o17))

(declare-const o18 Int)

;; Ensures
  (assert (= (to_rep b__first) o18))

;; Ensures
  (assert (in_range2 o18))

(declare-const o19 Int)

;; Ensures
  (assert (= (to_rep a__last) o19))

(declare-const o20 Int)

;; Ensures
  (assert (= (to_rep a__first) o20))

(define-fun o21 () us_t (of_array a o20 o19))

(declare-const o22 Int)

;; Ensures
  (assert (= (to_rep b__last) o22))

(declare-const o23 Int)

;; Ensures
  (assert (= (to_rep b__first) o23))

(define-fun o24 () us_t (of_array b o23 o22))

;; Ensures
  (assert (le_array__function_guard (le_array o24 o21 o18 o17 o16 o15) 
  o24 o21 o18 o17 o16 o15))

(declare-const o25 Int)

;; Ensures
  (assert (= (to_rep b__first) o25))

;; Ensures
  (assert (in_range2 o25))

(define-fun o26 () Int (+ a_first length11))

;; Ensures
  (assert (in_range1 o26))

(define-fun o27 () Int a_first)

(declare-const o28 Int)

;; Ensures
  (assert (= (to_rep b__last) o28))

(declare-const o29 Int)

;; Ensures
  (assert (= (to_rep b__first) o29))

(define-fun o30 () us_t (of_array b o29 o28))

(declare-const o31 Int)

;; Ensures
  (assert (= (to_rep a__last) o31))

(declare-const o32 Int)

;; Ensures
  (assert (= (to_rep a__first) o32))

(define-fun o33 () us_t (of_array a o32 o31))

;; Ensures
  (assert (perm2__function_guard (perm2 o33 o30 o27 o26 o25 i1 j1) o33 
  o30 o27 o26 o25 i1 j1))

(define-fun o34 () Int (+ i1 j1))

;; Ensures
  (assert (in_range1 o34))

(declare-const o35 Int)

;; Ensures
  (assert (= (to_rep b__first) o35))

;; Ensures
  (assert (in_range2 o35))

(declare-const o36 Int)

;; Ensures
  (assert (= (to_rep b__last) o36))

(declare-const o37 Int)

;; Ensures
  (assert (= (to_rep b__first) o37))

(define-fun o38 () us_t (of_array b o37 o36))

;; Ensures
  (assert (sorted__function_guard (sorted o38 o35 o34) o38 o35 o34))

(declare-const b1 (Array Int integer))

(declare-const i2 Int)

(declare-const j2 Int)

;; H
  (assert
  (forall ((b2 (Array Int integer)) (i3 Int) (j3 Int))
  (sorted__function_guard
  (sorted (of_array b2 (to_rep b__first) (to_rep b__last)) (to_rep b__first)
  (+ i3 j3)) (of_array b2 (to_rep b__first) (to_rep b__last))
  (to_rep b__first) (+ i3 j3))))

;; H
  (assert
  (forall ((a2 (Array Int integer)) (b2 (Array Int integer)) (i3 Int)
  (j3 Int)) (perm2__function_guard
  (perm2 (of_array a2 (to_rep a__first) (to_rep a__last))
  (of_array b2 (to_rep b__first) (to_rep b__last)) a_first
  (+ a_first length11) (to_rep b__first) i3 j3)
  (of_array a2 (to_rep a__first) (to_rep a__last))
  (of_array b2 (to_rep b__first) (to_rep b__last)) a_first
  (+ a_first length11) (to_rep b__first) i3 j3)))

;; H
  (assert
  (forall ((a2 (Array Int integer)) (b2 (Array Int integer)) (i3 Int)
  (j3 Int)) (le_array__function_guard
  (le_array (of_array b2 (to_rep b__first) (to_rep b__last))
  (of_array a2 (to_rep a__first) (to_rep a__last)) (to_rep b__first)
  (+ a_first i3) (+ i3 j3) (- length11 i3))
  (of_array b2 (to_rep b__first) (to_rep b__last))
  (of_array a2 (to_rep a__first) (to_rep a__last)) (to_rep b__first)
  (+ a_first i3) (+ i3 j3) (- length11 i3))))

;; H
  (assert
  (forall ((a2 (Array Int integer)) (b2 (Array Int integer)) (i3 Int)
  (j3 Int)) (le_array__function_guard
  (le_array (of_array b2 (to_rep b__first) (to_rep b__last))
  (of_array a2 (to_rep a__first) (to_rep a__last)) (to_rep b__first)
  (+ (+ a_first length11) j3) (+ i3 j3) (- length2 j3))
  (of_array b2 (to_rep b__first) (to_rep b__last))
  (of_array a2 (to_rep a__first) (to_rep a__last)) (to_rep b__first)
  (+ (+ a_first length11) j3) (+ i3 j3) (- length2 j3))))

;; LoopInvariant
  (assert
  (and
  (and
  (and
  (and
  (and (and (<= i2 length11) (<= j2 length2))
  (= (sorted (of_array b1 (to_rep b__first) (to_rep b__last))
     (to_rep b__first) (+ i2 j2)) true))
  (= (perm2 (of_array a (to_rep a__first) (to_rep a__last))
     (of_array b1 (to_rep b__first) (to_rep b__last)) a_first
     (+ a_first length11) (to_rep b__first) i2 j2) true))
  (= (le_array (of_array b1 (to_rep b__first) (to_rep b__last))
     (of_array a (to_rep a__first) (to_rep a__last)) (to_rep b__first)
     (+ a_first i2) (+ i2 j2) (- length11 i2)) true))
  (= (le_array (of_array b1 (to_rep b__first) (to_rep b__last))
     (of_array a (to_rep a__first) (to_rep a__last)) (to_rep b__first)
     (+ (+ a_first length11) j2) (+ i2 j2) (- length2 j2)) true))
  (= (bool_eq a (to_rep a__first) (to_rep a__last) temp___loop_entry_325
     (to_rep a__first) (to_rep a__last)) true)))

;; Assume
  (assert
  (and (dynamic_invariant i2 false true true true) (dynamic_invariant 
  j2 false true true true)))

;; H
  (assert (=> (not (< i2 length11)) (< j2 length2)))

(declare-const b2 (Array Int integer))

(declare-const i3 Int)

(declare-const j3 Int)

(declare-const o39 Bool)

(declare-const o40 Int)

(declare-const o41 Int)

;; H
  (assert
  (ite (= j2 length2) (= o39 true)
  (ite (< i2 length11)
  (let ((o42 (+ a_first length11)))
  (and (in_range1 o42)
  (let ((o43 (+ o42 j2)))
  (and (in_range1 o43)
  (and (and (<= (to_rep a__first) o43) (<= o43 (to_rep a__last)))
  (and (= (to_rep (select a o43)) o40)
  (let ((o44 (+ a_first i2)))
  (and (in_range1 o44)
  (and (and (<= (to_rep a__first) o44) (<= o44 (to_rep a__last)))
  (and (= (to_rep (select a o44)) o41) (= o39 (ite (<= o41 o40) true false))))))))))))
  (= o39 false))))

(declare-const spark__branch Bool)

;; H
  (assert (= spark__branch o39))

(declare-const o42 Int)

(declare-const o43 integer)

(declare-const o44 Int)

(declare-const o45 Int)

(declare-const o46 integer)

(declare-const o47 Int)

;; H
  (assert
  (ite (= spark__branch true)
  (and
  (let ((o48 (+ a_first i2)))
  (and (in_range1 o48)
  (and (and (<= (to_rep a__first) o48) (<= o48 (to_rep a__last)))
  (and (= (to_rep (select a o48)) o45)
  (and (= (to_rep o46) o45)
  (let ((o49 (+ i2 j2)))
  (and (in_range1 o49)
  (and (= (to_rep b__first) o47)
  (let ((o50 (+ o47 o49)))
  (and (in_range1 o50)
  (and (and (<= (to_rep b__first) o50) (<= o50 (to_rep b__last)))
  (and (= b2 (store b1 o50 o46))
  (let ((o51 (+ i2 1))) (and (in_range1 o51) (= i3 o51)))))))))))))))
  (= j3 j2))
  (and
  (let ((o48 (+ a_first length11)))
  (and (in_range1 o48)
  (let ((o49 (+ o48 j2)))
  (and (in_range1 o49)
  (and (and (<= (to_rep a__first) o49) (<= o49 (to_rep a__last)))
  (and (= (to_rep (select a o49)) o42)
  (and (= (to_rep o43) o42)
  (let ((o50 (+ i2 j2)))
  (and (in_range1 o50)
  (and (= (to_rep b__first) o44)
  (let ((o51 (+ o44 o50)))
  (and (in_range1 o51)
  (and (and (<= (to_rep b__first) o51) (<= o51 (to_rep b__last)))
  (and (= b2 (store b1 o51 o43))
  (let ((o52 (+ j2 1))) (and (in_range1 o52) (= j3 o52)))))))))))))))))
  (= i3 i2))))

(declare-const o48 Int)

;; Ensures
  (assert (= (to_rep a__last) o48))

(declare-const o49 Int)

;; Ensures
  (assert (= (to_rep a__first) o49))

(declare-const o50 Int)

;; Ensures
  (assert (= (to_rep a__last) o50))

(declare-const o51 Int)

;; Ensures
  (assert (= (to_rep a__first) o51))

(define-fun o52 () Int (- length2 j3))

;; Ensures
  (assert (in_range1 o52))

(assert
;; defqtvc
 ;; File "sorting.adb", line 59, characters 0-0
  (not (in_range2 o52)))
(check-sat)
