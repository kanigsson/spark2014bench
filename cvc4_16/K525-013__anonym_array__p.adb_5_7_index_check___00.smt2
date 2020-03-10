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

(declare-const a Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const b Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int integer))))))
(declare-fun slide ((Array Int integer) Int Int) (Array Int integer))

;; slide_eq
  (assert
  (forall ((a1 (Array Int integer)))
  (forall ((first Int))
  (! (= (slide a1 first first) a1) :pattern ((slide a1 first first)) ))))

;; slide_def
  (assert
  (forall ((a1 (Array Int integer)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a1 old_first new_first) i) (select a1 (- i (- new_first old_first)))) :pattern ((select 
  (slide a1 old_first new_first) i)) ))))))

(define-fun bool_eq ((a1 (Array Int integer)) (a__first Int) (a__last Int)
  (b1 (Array Int integer)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep (select a1 temp___idx_154)) (to_rep
                                                                  (select b1 (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a1 (Array Int integer)) (b1 (Array Int integer)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b1 b__first b__last a1 a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep (select a1 temp___idx_154)) (to_rep
                                         (select b1 (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-sort txD1 0)

(declare-fun txD1qtint (txD1) Int)

;; txD1'axiom
  (assert
  (forall ((i txD1)) (and (<= 1 (txD1qtint i)) (<= (txD1qtint i) 20))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 20)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (txD1 txD1) Bool)

(declare-const dummy1 txD1)

(declare-datatypes ((txD1__ref 0))
(((txD1__refqtmk (txD1__content txD1)))))
(define-fun txD1__ref_txD1__content__projection ((a1 txD1__ref)) txD1 
  (txD1__content a1))

(declare-fun p__x__aggregate_def (Int) (Array Int integer))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) (- 123)))

;; def_axiom
  (assert
  (forall ((temp___156 Int))
  (=> (dynamic_invariant temp___156 true true true true)
  (forall ((temp___157 Int))
  (= (select (p__x__aggregate_def temp___156) temp___157) rliteral)))))

(assert
;; defqtvc
 ;; File "p.adb", line 1, characters 0-0
  (not
  (=> (dynamic_invariant a true false true true)
  (=> (dynamic_invariant b true false true true)
  (=> (<= 1 a)
  (=> (<= a 20)
  (=> (<= 1 b)
  (=> (<= b 20)
  (=> (<= 1 a) (=> (<= a 20) (=> (<= 1 b) (=> (<= b 20) (<= 1 a)))))))))))))
(check-sat)
(exit)
