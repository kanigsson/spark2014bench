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

(declare-sort flagvalue 0)

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 4)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (flagvalue flagvalue) Bool)

(declare-const dummy flagvalue)

(declare-datatypes ()
((flagvalue__ref (flagvalue__refqtmk (flagvalue__content flagvalue)))))
(define-fun flagvalue__ref_flagvalue__content__projection ((a flagvalue__ref)) flagvalue 
  (flagvalue__content a))

(declare-fun to_rep (flagvalue) Int)

(declare-fun of_rep (Int) flagvalue)

;; inversion_axiom
  (assert
  (forall ((x flagvalue))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x flagvalue)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int flagvalue))))))
(declare-fun slide ((Array Int flagvalue) Int Int) (Array Int flagvalue))

;; slide_eq
  (assert
  (forall ((a (Array Int flagvalue)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int flagvalue)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int flagvalue)) (a__first Int) (a__last Int)
  (b (Array Int flagvalue)) (b__first Int)
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
  (forall ((a (Array Int flagvalue)) (b (Array Int flagvalue)))
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

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const flag_v1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const flag_v2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const value_v1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const value_v2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-sort int__ 0)

(declare-fun int__qtint (int__) Int)

;; int__'axiom
  (assert
  (forall ((i int__)) (and (<= 1 (int__qtint i)) (<= (int__qtint i) 10))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (int__ int__) Bool)

(declare-const dummy1 int__)

(declare-datatypes () ((int____ref (int____refqtmk (int____content int__)))))
(define-fun int____ref_int____content__projection ((a int____ref)) int__ 
  (int____content a))

(define-fun dynamic_invariant ((temp___expr_161 Int)
  (temp___is_init_157 Bool) (temp___skip_constant_158 Bool)
  (temp___do_toplevel_159 Bool)
  (temp___do_typ_inv_160 Bool)) Bool (=>
                                     (or (= temp___is_init_157 true)
                                     (<= 1 10)) (in_range1 temp___expr_161)))

(define-fun dynamic_invariant1 ((temp___expr_168 Int)
  (temp___is_init_164 Bool) (temp___skip_constant_165 Bool)
  (temp___do_toplevel_166 Bool)
  (temp___do_typ_inv_167 Bool)) Bool (=>
                                     (or (= temp___is_init_164 true)
                                     (<= 0 4)) (in_range temp___expr_168)))

(declare-const flags_v1 (Array Int flagvalue))

(declare-const flags_v2 (Array Int flagvalue))

;; Assume
  (assert true)

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant flag_v1 true false true true))

;; Assume
  (assert (dynamic_invariant flag_v2 true false true true))

;; Assume
  (assert (dynamic_invariant1 value_v1 true false true true))

;; Assume
  (assert (dynamic_invariant1 value_v2 true false true true))

(define-fun usf () Bool (= value_v1 value_v2))

(declare-const o flagvalue)

;; Ensures
  (assert (= (to_rep o) value_v1))

(declare-const flags_v11 (Array Int flagvalue))

;; H
  (assert (= flags_v11 (store flags_v1 flag_v1 o)))

(declare-const o1 flagvalue)

;; Ensures
  (assert (= (to_rep o1) value_v2))

(declare-const flags_v21 (Array Int flagvalue))

;; H
  (assert (= flags_v21 (store flags_v2 flag_v2 o1)))

;; H
  (assert (= usf true))

(assert
;; defqtvc
 ;; File "infoflow.ads", line 34, characters 0-0
  (not
  (= (to_rep (select flags_v11 flag_v1)) (to_rep (select flags_v21 flag_v2)))))
(check-sat)

(exit)
