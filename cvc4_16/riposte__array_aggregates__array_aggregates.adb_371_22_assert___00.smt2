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

(declare-sort unsigned_byte 0)

(declare-fun unsigned_byteqtint (unsigned_byte) Int)

;; unsigned_byte'axiom
  (assert
  (forall ((i unsigned_byte))
  (and (<= 0 (unsigned_byteqtint i)) (<= (unsigned_byteqtint i) 255))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (unsigned_byte unsigned_byte) Bool)

(declare-const dummy unsigned_byte)

(declare-datatypes ((unsigned_byte__ref 0))
(((unsigned_byte__refqtmk (unsigned_byte__content unsigned_byte)))))
(define-fun unsigned_byte__ref_unsigned_byte__content__projection ((a unsigned_byte__ref)) unsigned_byte 
  (unsigned_byte__content a))

(define-fun to_rep ((x unsigned_byte)) Int (unsigned_byteqtint x))

(declare-fun of_rep (Int) unsigned_byte)

;; inversion_axiom
  (assert
  (forall ((x unsigned_byte))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x unsigned_byte)) (! (in_range
  (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int unsigned_byte))))))
(declare-fun slide ((Array Int unsigned_byte) Int
  Int) (Array Int unsigned_byte))

;; slide_eq
  (assert
  (forall ((a (Array Int unsigned_byte)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int unsigned_byte)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int unsigned_byte)) (a__first Int)
  (a__last Int) (b (Array Int unsigned_byte)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_162 Int))
                           (=>
                           (and (<= a__first temp___idx_162)
                           (<= temp___idx_162 a__last))
                           (= (to_rep (select a temp___idx_162)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_162)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int unsigned_byte)) (b (Array Int unsigned_byte)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_162 Int))
  (=> (and (<= a__first temp___idx_162) (<= temp___idx_162 a__last))
  (= (to_rep (select a temp___idx_162)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_162)))))))))))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-fun temp_____aggregate_def_663 (Int Int) (Array Int unsigned_byte))

(define-fun dynamic_invariant ((temp___expr_173 Int)
  (temp___is_init_169 Bool) (temp___skip_constant_170 Bool)
  (temp___do_toplevel_171 Bool)
  (temp___do_typ_inv_172 Bool)) Bool (=>
                                     (or (= temp___is_init_169 true)
                                     (<= 0 255)) (in_range temp___expr_173)))

(declare-const rliteral unsigned_byte)

;; rliteral_axiom
  (assert (= (unsigned_byteqtint rliteral) 10))

(declare-const rliteral1 unsigned_byte)

;; rliteral_axiom
  (assert (= (unsigned_byteqtint rliteral1) 5))

;; def_axiom
  (assert
  (forall ((temp___665 Int) (temp___666 Int))
  (let ((temp___664 (temp_____aggregate_def_663 temp___665 temp___666)))
  (=>
  (and (dynamic_invariant temp___665 true true true true) (dynamic_invariant
  temp___666 true true true true))
  (and (= (select temp___664 0) rliteral)
  (= (select temp___664 1) rliteral1))))))

(assert
;; defqtvc
 ;; File "array_aggregates.adb", line 365, characters 0-0
  (not
  (forall ((x (Array Int unsigned_byte)))
  (=> (= x (temp_____aggregate_def_663 10 5)) (= (to_rep (select x 1)) 4)))))
(check-sat)
(exit)
