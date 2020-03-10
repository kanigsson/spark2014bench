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

(declare-sort et1 0)

(declare-fun et1qtint (et1) Int)

;; et1'axiom
  (assert (forall ((i et1)) (and (<= 0 (et1qtint i)) (<= (et1qtint i) 99))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 99)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (et1 et1) Bool)

(declare-const dummy et1)

(declare-datatypes ((et1__ref 0))
(((et1__refqtmk (et1__content et1)))))
(define-fun et1__ref_et1__content__projection ((a et1__ref)) et1 (et1__content
                                                                 a))

(define-fun to_rep ((x et1)) Int (et1qtint x))

(declare-fun of_rep (Int) et1)

;; inversion_axiom
  (assert
  (forall ((x et1)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x et1)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int et1))))))
(declare-fun slide ((Array Int et1) Int Int) (Array Int et1))

;; slide_eq
  (assert
  (forall ((a (Array Int et1)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int et1)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int et1)) (a__first Int) (a__last Int)
  (b (Array Int et1)) (b__first Int)
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
  (forall ((a (Array Int et1)) (b (Array Int et1)))
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

(declare-const i Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const j Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const e Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-sort it1 0)

(declare-fun it1qtint (it1) Int)

;; it1'axiom
  (assert
  (forall ((i1 it1)) (and (<= 1 (it1qtint i1)) (<= (it1qtint i1) 10))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (it1 it1) Bool)

(declare-const dummy1 it1)

(declare-datatypes ((it1__ref 0))
(((it1__refqtmk (it1__content it1)))))
(define-fun it1__ref_it1__content__projection ((a it1__ref)) it1 (it1__content
                                                                 a))

(define-fun dynamic_invariant ((temp___expr_166 Int)
  (temp___is_init_162 Bool) (temp___skip_constant_163 Bool)
  (temp___do_toplevel_164 Bool)
  (temp___do_typ_inv_165 Bool)) Bool (=>
                                     (or (= temp___is_init_162 true)
                                     (<= 1 10)) (in_range2 temp___expr_166)))

(define-fun dynamic_invariant1 ((temp___expr_173 Int)
  (temp___is_init_169 Bool) (temp___skip_constant_170 Bool)
  (temp___do_toplevel_171 Bool)
  (temp___do_typ_inv_172 Bool)) Bool (=>
                                     (or (= temp___is_init_169 true)
                                     (<= 0 99)) (in_range1 temp___expr_173)))

(declare-fun temp_____aggregate_def_209 ((Array Int et1) Int Int Int Int Int
  Int) (Array Int et1))

;; def_axiom
  (assert
  (forall ((temp___211 (Array Int et1)))
  (forall ((temp___212 Int) (temp___213 Int) (temp___214 Int)
  (temp___215 Int) (temp___216 Int) (temp___217 Int))
  (let ((temp___210 (temp_____aggregate_def_209 temp___211 temp___212
                    temp___213 temp___214 temp___215 temp___216 temp___217)))
  (=>
  (and (dynamic_invariant temp___212 true true true true)
  (and
  (and
  (and (dynamic_invariant temp___213 true true true true) (dynamic_invariant
  temp___214 true true true true)) (dynamic_invariant1 temp___215 true true
  true true))
  (and (dynamic_invariant temp___216 true true true true) (dynamic_invariant1
  temp___217 true true true true))))
  (forall ((temp___218 Int))
  (ite (= temp___218 temp___216)
  (= (to_rep (select temp___210 temp___218)) temp___217)
  (ite (or (= temp___218 temp___212)
       (and (<= temp___213 temp___218) (<= temp___218 temp___214)))
  (= (to_rep (select temp___210 temp___218)) temp___215)
  (= (select temp___210 temp___218) (select temp___211 temp___218))))))))))

(assert
;; defqtvc
 ;; File "ar.ads", line 16, characters 0-0
  (not
  (forall ((a (Array Int et1)))
  (=> (dynamic_invariant i true false true true)
  (=> (dynamic_invariant j true false true true)
  (=> (dynamic_invariant1 e true false true true)
  (let ((o (+ e 1)))
  (=> (in_range1 o)
  (let ((o1 (+ j 1)))
  (=> (in_range2 o1)
  (let ((o2 (- e 1)))
  (=> (in_range1 o2)
  (let ((o3 (+ j 2)))
  (=> (in_range2 o3)
  (let ((o4 (- i 1)))
  (=> (in_range2 o4)
  (forall ((a1 (Array Int et1)))
  (=> (= a1 (temp_____aggregate_def_209 a o4 i o3 o2 o1 o)) (in_range1
  (+ e 1))))))))))))))))))))
(check-sat)
(exit)
