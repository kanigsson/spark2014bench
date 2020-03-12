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

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= (- 2147483648) x)
                                    (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

(declare-datatypes ()
((natural__ref (natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun dynamic_invariant1 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(declare-sort t 0)

(declare-fun tqtint (t) Int)

;; t'axiom
  (assert (forall ((i t)) (and (<= (- 20) (tqtint i)) (<= (tqtint i) 20))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 20) x) (<= x 20)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (t t) Bool)

(declare-const dummy2 t)

(declare-datatypes () ((t__ref (t__refqtmk (t__content t)))))
(define-fun t__ref_t__content__projection ((a t__ref)) t (t__content a))

(define-fun dynamic_invariant2 ((temp___expr_158 Int)
  (temp___is_init_154 Bool) (temp___skip_constant_155 Bool)
  (temp___do_toplevel_156 Bool)
  (temp___do_typ_inv_157 Bool)) Bool (=>
                                     (or (= temp___is_init_154 true)
                                     (<= (- 20) 20)) (in_range2
                                     temp___expr_158)))

(declare-sort nt 0)

(declare-fun ntqtint (nt) Int)

;; nt'axiom
  (assert (forall ((i nt)) (and (<= 0 (ntqtint i)) (<= (ntqtint i) 20))))

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 20)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (nt nt) Bool)

(declare-const dummy3 nt)

(declare-datatypes () ((nt__ref (nt__refqtmk (nt__content nt)))))
(define-fun nt__ref_nt__content__projection ((a nt__ref)) nt (nt__content a))

(define-fun dynamic_invariant3 ((temp___expr_165 Int)
  (temp___is_init_161 Bool) (temp___skip_constant_162 Bool)
  (temp___do_toplevel_163 Bool)
  (temp___do_typ_inv_164 Bool)) Bool (=>
                                     (or (= temp___is_init_161 true)
                                     (<= 0 20)) (in_range3 temp___expr_165)))

(declare-sort s 0)

(declare-fun sqtint (s) Int)

;; s'axiom
  (assert (forall ((i s)) (and (<= 0 (sqtint i)) (<= (sqtint i) 20))))

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 20)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (s s) Bool)

(declare-const dummy4 s)

(declare-datatypes () ((s__ref (s__refqtmk (s__content s)))))
(define-fun s__ref_s__content__projection ((a s__ref)) s (s__content a))

(define-fun dynamic_invariant4 ((temp___expr_172 Int)
  (temp___is_init_168 Bool) (temp___skip_constant_169 Bool)
  (temp___do_toplevel_170 Bool)
  (temp___do_typ_inv_171 Bool)) Bool (=>
                                     (or (= temp___is_init_168 true)
                                     (<= 0 20)) (in_range4 temp___expr_172)))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const g Int)

(declare-const a1 Int)

(declare-const a2 Int)

;; Assume
  (assert (dynamic_invariant g true false true true))

;; Assume
  (assert (dynamic_invariant a1 true false true true))

;; Assume
  (assert (dynamic_invariant a2 true false true true))

(declare-const a11 Int)

(declare-const a21 Int)

;; H
  (assert (= a21 (+ a11 1)))

;; H
  (assert (dynamic_invariant a11 true true true true))

;; H
  (assert (dynamic_invariant a21 true true true true))

;; Ensures
  (assert (in_range1 a21))

;; Ensures
  (assert (in_range1 a11))

(declare-const call_actuals__fn__y Int)

(declare-const call_actuals__fn__x Int)

;; H
  (assert (= call_actuals__fn__y (+ call_actuals__fn__x 1)))

;; H
  (assert (dynamic_invariant1 call_actuals__fn__x true true true true))

;; H
  (assert (dynamic_invariant1 call_actuals__fn__y true true true true))

;; Ensures
  (assert (in_range call_actuals__fn__x))

(declare-const a12 Int)

;; H
  (assert (= a12 call_actuals__fn__x))

;; Ensures
  (assert (in_range call_actuals__fn__y))

(declare-const a22 Int)

;; H
  (assert (= a22 call_actuals__fn__y))

(declare-const call_actuals__ft__y Int)

(declare-const call_actuals__ft__x Int)

;; H
  (assert (= call_actuals__ft__y (+ call_actuals__ft__x 1)))

;; H
  (assert (dynamic_invariant2 call_actuals__ft__x true true true true))

;; H
  (assert (dynamic_invariant2 call_actuals__ft__y true true true true))

(declare-const o integer)

;; Ensures
  (assert (= (to_rep o) call_actuals__ft__x))

(declare-const o1 Int)

;; Ensures
  (assert (= (to_rep o) o1))

(declare-const a13 Int)

;; H
  (assert (= a13 o1))

(declare-const o2 integer)

;; Ensures
  (assert (= (to_rep o2) call_actuals__ft__y))

(declare-const o3 Int)

;; Ensures
  (assert (= (to_rep o2) o3))

(declare-const a23 Int)

;; H
  (assert (= a23 o3))

(declare-const call_actuals__fnt__y Int)

(declare-const call_actuals__fnt__x Int)

;; H
  (assert (= call_actuals__fnt__y (+ call_actuals__fnt__x 1)))

;; H
  (assert (dynamic_invariant3 call_actuals__fnt__x true true true true))

;; H
  (assert (dynamic_invariant3 call_actuals__fnt__y true true true true))

(declare-const o4 integer)

;; Ensures
  (assert (= (to_rep o4) call_actuals__fnt__x))

(declare-const o5 Int)

;; Ensures
  (assert (= (to_rep o4) o5))

(declare-const a14 Int)

;; H
  (assert (= a14 o5))

(declare-const o6 integer)

;; Ensures
  (assert (= (to_rep o6) call_actuals__fnt__y))

(declare-const o7 Int)

;; Ensures
  (assert (= (to_rep o6) o7))

(declare-const a24 Int)

;; H
  (assert (= a24 o7))

;; Ensures
  (assert (in_range4 a24))

;; Ensures
  (assert (in_range4 a24))

;; Ensures
  (assert (in_range4 a14))

;; Ensures
  (assert (in_range4 a14))

(declare-const call_actuals__fs__y Int)

(declare-const call_actuals__fs__x Int)

;; H
  (assert (= call_actuals__fs__y (+ call_actuals__fs__x 1)))

;; H
  (assert (dynamic_invariant4 call_actuals__fs__x true true true true))

;; H
  (assert (dynamic_invariant4 call_actuals__fs__y true true true true))

;; Ensures
  (assert (in_range2 call_actuals__fs__x))

(declare-const o8 integer)

;; Ensures
  (assert (= (to_rep o8) call_actuals__fs__x))

(declare-const o9 Int)

;; Ensures
  (assert (= (to_rep o8) o9))

(assert
;; defqtvc
 ;; File "call_actuals.ads", line 13, characters 0-0
  (not (in_range2 call_actuals__fs__y)))
(check-sat)
