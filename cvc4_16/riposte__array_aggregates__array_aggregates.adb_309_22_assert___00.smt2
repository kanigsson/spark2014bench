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

(declare-sort enum_t 0)

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (enum_t enum_t) Bool)

(declare-const dummy enum_t)

(declare-datatypes ((enum_t__ref 0))
(((enum_t__refqtmk (enum_t__content enum_t)))))
(define-fun enum_t__ref_enum_t__content__projection ((a enum_t__ref)) enum_t 
  (enum_t__content a))

(declare-fun to_rep (enum_t) Int)

(declare-fun of_rep (Int) enum_t)

;; inversion_axiom
  (assert
  (forall ((x enum_t)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x enum_t)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int enum_t))))))
(declare-fun slide ((Array Int enum_t) Int Int) (Array Int enum_t))

;; slide_eq
  (assert
  (forall ((a (Array Int enum_t)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int enum_t)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int enum_t)) (a__first Int) (a__last Int)
  (b (Array Int enum_t)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_155 Int))
                           (=>
                           (and (<= a__first temp___idx_155)
                           (<= temp___idx_155 a__last))
                           (= (to_rep (select a temp___idx_155)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_155)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int enum_t)) (b (Array Int enum_t)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_155 Int))
  (=> (and (<= a__first temp___idx_155) (<= temp___idx_155 a__last))
  (= (to_rep (select a temp___idx_155)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_155)))))))))))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const n Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort small_index_t 0)

(declare-fun small_index_tqtint (small_index_t) Int)

;; small_index_t'axiom
  (assert
  (forall ((i small_index_t))
  (and (<= 1 (small_index_tqtint i)) (<= (small_index_tqtint i) 1000))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 1000)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (small_index_t small_index_t) Bool)

(declare-const dummy1 small_index_t)

(declare-datatypes ((small_index_t__ref 0))
(((small_index_t__refqtmk (small_index_t__content small_index_t)))))
(define-fun small_index_t__ref_small_index_t__content__projection ((a small_index_t__ref)) small_index_t 
  (small_index_t__content a))

(define-fun dynamic_invariant ((temp___expr_257 Int)
  (temp___is_init_253 Bool) (temp___skip_constant_254 Bool)
  (temp___do_toplevel_255 Bool)
  (temp___do_typ_inv_256 Bool)) Bool (=>
                                     (or (= temp___is_init_253 true)
                                     (<= 1 1000)) (in_range2
                                     temp___expr_257)))

(declare-fun temp_____aggregate_def_630 (Int Int Int) (Array Int enum_t))

(define-fun dynamic_invariant1 ((temp___expr_187 Int)
  (temp___is_init_183 Bool) (temp___skip_constant_184 Bool)
  (temp___do_toplevel_185 Bool)
  (temp___do_typ_inv_186 Bool)) Bool (=>
                                     (or (= temp___is_init_183 true)
                                     (<= 0 2)) (in_range1 temp___expr_187)))

;; def_axiom
  (assert
  (forall ((temp___632 Int) (temp___633 Int) (temp___634 Int))
  (let ((temp___631 (temp_____aggregate_def_630 temp___632 temp___633
                    temp___634)))
  (=>
  (and
  (and (dynamic_invariant1 temp___632 true true true true)
  (dynamic_invariant1 temp___633 true true true true)) (dynamic_invariant1
  temp___634 true true true true))
  (forall ((temp___635 Int))
  (ite (= temp___635 1000)
  (= (to_rep (select temp___631 temp___635)) temp___633)
  (ite (or (= temp___635 2) (and (<= 4 temp___635) (<= temp___635 6)))
  (= (to_rep (select temp___631 temp___635)) temp___632)
  (= (to_rep (select temp___631 temp___635)) temp___634))))))))

(assert
;; defqtvc
 ;; File "array_aggregates.adb", line 300, characters 0-0
  (not
  (forall ((x (Array Int enum_t)))
  (=> (dynamic_invariant n true false true true)
  (=> (= x (temp_____aggregate_def_630 0 2 1)) (= (to_rep (select x n)) 0))))))
(check-sat)
(exit)
