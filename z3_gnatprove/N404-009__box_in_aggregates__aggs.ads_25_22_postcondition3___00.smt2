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

(declare-sort t1 0)

(declare-fun t1qtint (t1) Int)

;; t1'axiom
  (assert (forall ((i t1)) (and (<= 1 (t1qtint i)) (<= (t1qtint i) 10))))

(define-fun in_range ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (t1 t1) Bool)

(declare-const dummy t1)

(declare-datatypes () ((t1__ref (t1__refqtmk (t1__content t1)))))
(define-fun t1__ref_t1__content__projection ((a t1__ref)) t1 (t1__content a))

(define-fun to_rep ((x t1)) Int (t1qtint x))

(declare-fun of_rep (Int) t1)

;; inversion_axiom
  (assert
  (forall ((x t1)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert (forall ((x t1)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int t1))))))
(declare-fun slide ((Array Int t1) Int Int) (Array Int t1))

;; slide_eq
  (assert
  (forall ((a (Array Int t1)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int t1)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int t1)) (a__first Int) (a__last Int)
  (b (Array Int t1)) (b__first Int)
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
  (forall ((a (Array Int t1)) (b (Array Int t1)))
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

(declare-sort i 0)

(declare-fun iqtint (i) Int)

;; i'axiom
  (assert (forall ((i1 i)) (and (<= 1 (iqtint i1)) (<= (iqtint i1) 5))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 5)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (i i) Bool)

(declare-const dummy1 i)

(declare-datatypes () ((i__ref (i__refqtmk (i__content i)))))
(define-fun i__ref_i__content__projection ((a i__ref)) i (i__content a))

(define-fun default_initial_assumption ((temp___expr_191 (Array Int t1))
  (temp___skip_top_level_192 Bool)) Bool (forall ((temp___193 Int))
                                         (=>
                                         (and (<= 1 temp___193)
                                         (<= temp___193 5))
                                         (= (to_rep
                                            (select temp___expr_191 temp___193)) 5))))

(declare-fun temp_____aggregate_def_218 (Int) (Array Int t1))

(define-fun dynamic_invariant ((temp___expr_168 Int)
  (temp___is_init_164 Bool) (temp___skip_constant_165 Bool)
  (temp___do_toplevel_166 Bool)
  (temp___do_typ_inv_167 Bool)) Bool (=>
                                     (or (= temp___is_init_164 true)
                                     (<= 1 10)) (in_range temp___expr_168)))

(declare-const rliteral t1)

;; rliteral_axiom
  (assert (= (t1qtint rliteral) 6))

;; def_axiom
  (assert
  (forall ((temp___220 Int))
  (=> (dynamic_invariant temp___220 true true true true)
  (forall ((temp___221 Int))
  (=> (= temp___221 1)
  (= (select (temp_____aggregate_def_218 temp___220) temp___221) rliteral))))))

(define-fun dynamic_invariant1 ((temp___expr_161 Int)
  (temp___is_init_157 Bool) (temp___skip_constant_158 Bool)
  (temp___do_toplevel_159 Bool)
  (temp___do_typ_inv_160 Bool)) Bool (=>
                                     (or (= temp___is_init_157 true)
                                     (<= 1 5)) (in_range1 temp___expr_161)))

(declare-const x (Array Int t1))

;; Assume
  (assert true)

(declare-const x1 (Array Int t1))

;; H
  (assert (= x1 (temp_____aggregate_def_218 6)))

(assert
;; defqtvc
 ;; File "aggs.ads", line 23, characters 0-0
  (not (= (to_rep (select x1 2)) 5)))
(check-sat)

(exit)
